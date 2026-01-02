<?php

namespace App\Repositories\external;

use App\Models\external\Prod;
use App\Repositories\Contracts\external\ProdRepositoryInterface;
use Illuminate\Database\Eloquent\Collection as EloquentCollection;
use Illuminate\Support\Collection as SupportCollection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class ProdRepository implements ProdRepositoryInterface
{
    public function findById(int $id): ?Prod
    {
        return Prod::on('sqlite_external')->find($id);
    }

    public function all(
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc'
    ): EloquentCollection {
        return Prod::on('sqlite_external')
            ->select($fields)
            ->orderBy($orderBy, $direction)
            ->get();
    }

    public function paginate(
        int $perPage = 15,
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'asc'
    ): LengthAwarePaginator {
        return Prod::on('sqlite_external')
            ->select($fields)
            ->orderBy($orderBy, $direction)
            ->paginate($perPage);
    }

    public function create(array $data): Prod
    {
        Log::info('Creating Prod record', $data);
        return Prod::on('sqlite_external')->create($data);
    }

    public function update(int $id, array $data): bool
    {
        Log::info("Updating Prod record with ID {$id}", $data);
        $prod = Prod::on('sqlite_external')->find($id);
        return $prod ? $prod->update($data) : false;
    }

    public function delete(int $id): bool
    {
        Log::info("Deleting Prod record with ID {$id}");
        $prod = Prod::on('sqlite_external')->find($id);
        return $prod ? (bool) $prod->delete() : false;
    }

    public function upsertByOriginId(array $data): Prod
    {
        if (empty($data['originid'])) {
            Log::error('❌ Upsert failed: originid missing', $data);
            throw new \InvalidArgumentException('originid is required for upsert');
        }

        Log::info("Upserting Prod by originid {$data['originid']}", $data);

        return Prod::on('sqlite_external')->updateOrCreate(
            ['originid' => $data['originid']],
            $data
        );
    }

    // ✅ Fetch from PostgreSQL common_db → prodscommon
    public function fetchFromPostgres(array $conditions = []): SupportCollection
    {
        Log::info('Fetching prods from PostgreSQL', $conditions);

        $query = DB::connection('pgsql_common')->table('prodscommon');
        if (!empty($conditions)) {
            $query->where($conditions);
        }

        $results = collect($query->get());
        Log::info('Fetched ' . $results->count() . ' prods from PostgreSQL');
        return $results;
    }

    // ✅ Sync from PostgreSQL into SQLite
    public function syncFromPostgres(): void
    {
        Log::info('Starting sync from PostgreSQL to SQLite');

        $prods = DB::connection('pgsql_common')->table('prodscommon')->get();

        foreach ($prods as $prod) {
            $originid = $prod->originid ?? null;
            $event    = $prod->eventtype ?? null;

            if (empty($originid)) {
                Log::warning('❌ Skipping prod: originid missing', ['raw' => $prod]);
                continue;
            }

            if ($event === 'prod.added' || $event === 'prod.updated') {
                $payload = (array) $prod;
                Log::info("Upserting prod with originid {$originid}", $payload);
                $this->upsertByOriginId($payload);
            }

            if ($event === 'prod.deleted') {
                Log::info("Delegating single delete for originid {$originid}");
                $this->deleteByOriginId($originid);
                continue;
            }
        }

        Log::info('Sync complete. Total prods processed: ' . count($prods));
    }

    public function deleteByOriginId(int $originid): int
    {
        Log::info("Deleting single Prod with originid {$originid}");

        $deleted = Prod::on('sqlite_external')
            ->where('originid', $originid)
            ->delete();

        if ($deleted > 0) {
            Log::info("Successfully deleted Prod with originid {$originid}");
        } else {
            Log::warning("No Prod found to delete with originid {$originid}");
        }

        return $deleted;
    }

    public function reconcileDeletesFromPostgres(): int
    {
        Log::info('Reconciling deletes from PostgreSQL');

        $prods = DB::connection('pgsql_common')->table('prodscommon')->get();
        $deletedCount = 0;

        foreach ($prods as $prod) {
            $originid = $prod->originid ?? null;
            $event    = $prod->eventtype ?? null;

            if ($event === 'prod.deleted' && $originid) {
                $deleted = Prod::on('sqlite_external')
                    ->where('originid', $originid)
                    ->delete();

                $deletedCount += $deleted;
                Log::info("Deleted prod with originid {$originid} based on prod.deleted event");
            }
        }

        Log::info("Total deleted from SQLite based on prod.deleted events: {$deletedCount}");
        return $deletedCount;
    }
}
