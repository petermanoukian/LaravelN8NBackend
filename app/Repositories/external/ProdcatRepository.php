<?php

namespace App\Repositories\external;

use App\Models\Prodcat;
use App\Repositories\Contracts\external\ProdcatRepositoryInterface;
use Illuminate\Database\Eloquent\Collection as EloquentCollection;
use Illuminate\Support\Collection as SupportCollection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class ProdcatRepository implements ProdcatRepositoryInterface
{
    public function findById(int $id): ?Prodcat
    {
        return Prodcat::on('sqlite_external')->find($id);
    }

    public function all(
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc'
    ): EloquentCollection {
        return Prodcat::on('sqlite_external')
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
        return Prodcat::on('sqlite_external')
            ->select($fields)
            ->orderBy($orderBy, $direction)
            ->paginate($perPage);
    }

    public function create(array $data): Prodcat
    {
        Log::info('Creating Prodcat record', $data);
        return Prodcat::on('sqlite_external')->create($data);
    }

    public function update(int $id, array $data): bool
    {
        Log::info("Updating Prodcat record with ID {$id}", $data);
        $prodcat = Prodcat::on('sqlite_external')->find($id);
        return $prodcat ? $prodcat->update($data) : false;
    }

    public function delete(int $id): bool
    {
        Log::info("Deleting Prodcat record with ID {$id}");
        $prodcat = Prodcat::on('sqlite_external')->find($id);
        return $prodcat ? (bool) $prodcat->delete() : false;
    }

    public function upsertByOriginId(array $data): Prodcat
    {
        if (empty($data['originid'])) {
            Log::error('❌ Upsert failed: originid missing', $data);
            throw new \InvalidArgumentException('originid is required for upsert');
        }

        Log::info("Upserting Prodcat by originid {$data['originid']}", $data);

        return Prodcat::on('sqlite_external')->updateOrCreate(
            ['originid' => $data['originid']],
            $data
        );
    }


    public function fetchFromMongo(array $conditions = []): SupportCollection
    {
        Log::info('Fetching cats from MongoDB', $conditions);

        $query = DB::connection('mongodb')->table('cats');
        if (!empty($conditions)) {
            $query->where($conditions);
        }

        $results = collect($query->get());
        Log::info('Fetched ' . $results->count() . ' cats from MongoDB');
        return $results;
    }

    public function syncFromMongo(): void
    {
        Log::info('Starting sync from MongoDB to SQLite');

        $cats = DB::connection('mongodb')->table('cats')->get();

        foreach ($cats as $cat) {
            $fields = [];

            // Parse embedded event string from key (newline-delimited)
            foreach ((array) $cat as $key => $value) {
                if (str_contains($key, 'Event:cat.')) {
                    $lines = explode("\n", $key);
                    foreach ($lines as $line) {
                        $parts = explode(':', $line, 2);
                        if (count($parts) === 2) {
                            $field = strtolower(trim($parts[0]));
                            $fields[$field] = trim($parts[1]);
                        }
                    }
                }
            }

            $originid = isset($fields['id']) && is_numeric($fields['id'])
                ? (int) $fields['id']
                : null;

            if (empty($originid)) {
                Log::warning('❌ Skipping cat: originid missing after parse', [
                    'raw'    => $cat,
                    'parsed' => $fields
                ]);
                continue;
            }

            $event = $fields['event'] ?? null;

            if ($event === 'cat.added' || $event === 'cat.updated') {
                $payload = [
                    'originid'  => $originid,
                    'name'      => $fields['name'] ?? null,
                    'des'       => $fields['shortdetails'] ?? null,
                    'dess'      => $fields['largedetails'] ?? null,
                    'filer'     => $fields['file'] ?? null,
                    'filename'  => $fields['filename'] ?? null,
                    'fileurl'   => $fields['fileurl'] ?? null,
                    'mime'      => $fields['mime'] ?? null,
                    'sizer'     => isset($fields['size']) ? (int) $fields['size'] : null,
                    'extension' => $fields['fileextension'] ?? null,
                ];

                Log::info("Upserting cat with originid {$originid}", $payload);
                $this->upsertByOriginId($payload);
            }


            if ($event === 'cat.deleted') {
                Log::info("Delegating single delete for originid {$originid}");
                $this->deleteByOriginId($originid);
                continue;
            }



        }

        Log::info('Sync complete. Total cats processed: ' . count($cats));
    }


    public function deleteByOriginId(int $originid): int
    {
        Log::info("Deleting single Prodcat with originid {$originid}");

        $deleted = Prodcat::on('sqlite_external')
            ->where('originid', $originid)
            ->delete();

        if ($deleted > 0) {
            Log::info("Successfully deleted Prodcat with originid {$originid}");
        } else {
            Log::warning("No Prodcat found to delete with originid {$originid}");
        }

        return $deleted;
    }




    public function reconcileDeletesFromMongo(): int
    {
        Log::info('Reconciling deletes from MongoDB');

        $cats = DB::connection('mongodb')->table('cats')->get();
        $deletedCount = 0;

        foreach ($cats as $cat) {
            $fields = [];

            // Parse embedded event string
            foreach ((array) $cat as $key => $value) {
                if (str_contains($key, 'Event:cat.')) {
                    $lines = explode("\n", $key);
                    foreach ($lines as $line) {
                        $parts = explode(':', $line, 2);
                        if (count($parts) === 2) {
                            $field = strtolower(trim($parts[0]));
                            $fields[$field] = trim($parts[1]);
                        }
                    }
                }
            }

            $originid = isset($fields['id']) && is_numeric($fields['id'])
                ? (int) $fields['id']
                : null;

            $event = $fields['event'] ?? null;

            if ($event === 'cat.deleted' && $originid) {
                $deleted = Prodcat::on('sqlite_external')
                    ->where('originid', $originid)
                    ->delete();

                $deletedCount += $deleted;
                Log::info("Deleted cat with originid {$originid} based on cat.deleted event");
            }
        }

        Log::info("Total deleted from SQLite based on cat.deleted events: {$deletedCount}");
        return $deletedCount;
    }




}
