<?php

namespace App\Repositories;

use App\Models\Baser;
use App\Repositories\Contracts\BaserRepositoryInterface;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Log;

class BaserRepository implements BaserRepositoryInterface
{
    public function findById(int $id): ?Baser
    {
        return Baser::find($id);
    }

    public function create(array $data): Baser
    {
        $baser = Baser::create($data);
        //Log::info('Created baser', ['baser_id' => $baser->id, 'data' => $data]);

        return $baser;
    }

    public function update(int $id, array $data): bool
    {
        $baser = $this->findById($id);
        if (!$baser) {
            return false;
        }

        $updated = $baser->update($data);
        if ($updated) {
            //Log::info('Updated baser', ['baser_id' => $id, 'data' => $data]);
        }

        return $updated;
    }


    public function all(
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc'
    ): Collection {
        return Baser::with('cat') // ✅ eager load category
            ->select($fields)
            ->orderBy($orderBy, $direction)
            ->get();
    }


    public function conditioned(
        array $conditions = [],
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc'
    ): Collection {
        $query = Baser::select($fields);

        foreach ($conditions as $field => $value) {
            if ($value !== null && $value !== '') {
                $query->where($field, $value);
            }
        }

        return $query->orderBy($orderBy, $direction)->get();
    }

    public function paginate(
        int $perPage = 15,
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'asc'
    ): LengthAwarePaginator {
        return Baser::select($fields)
            ->orderBy($orderBy, $direction)
            ->paginate($perPage);
    }


    public function paginateConditioned(
        array $conditions = [],
        int $perPage = 15,
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc'
    ): LengthAwarePaginator {
       $query = Baser::with('cat')->select($fields); 

        foreach ($conditions as $field => $value) {
            if ($value !== null && $value !== '') {
                $query->where($field, $value);
            }
        }

        return $query->orderBy($orderBy, $direction)->paginate($perPage);
    }


    


    /**
     * Search basers by keyword across multiple fields using LIKE,
     * optionally filtered by catid, and eager load related Cat.
     */
    public function search(
        string $keyword = '',
        array $fields = ['name', 'des', 'dess'],
        array $selectFields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc',
        ?int $catid = null
    ): Collection {
        $query = Baser::with('cat')->select($selectFields); // ✅ eager load category

        // Keyword search across multiple fields
        if (!empty($keyword)) {
            $query->where(function ($q) use ($fields, $keyword) {
                foreach ($fields as $field) {
                    $q->orWhere($field, 'LIKE', "%{$keyword}%");
                }
            });
        }

        // Optional category filter
        if (!empty($catid)) {
            $query->where('catid', $catid);
        }

        $results = $query->orderBy($orderBy, $direction)->get();

        /*
        Log::info('Search basers', [
            'keyword' => $keyword,
            'catid'   => $catid,
            'fields'  => $fields,
            'count'   => $results->count(),
        ]);
        */

        return $results;
    }


    public function delete(int $id): bool
    {
        $baser = $this->findById($id);
        if (!$baser) {
            return false;
        }

        $deleted = $baser->delete();
        if ($deleted) {
            Log::info('Deleted baser', ['baser_id' => $id]);
        }

        return $deleted;
    }

    
    public function deleteMany(array $ids): int
    {
        return Baser::whereIn('id', $ids)->delete();
    }

    public function getByCat(int $catId): Collection
    {
        return Baser::where('catid', $catId)->get();
    }

    public function deleteByCat(int $catId): int
    {
        $deleted = Baser::where('catid', $catId)->delete();

        if ($deleted) {
            Log::info('Deleted basers by category', ['cat_id' => $catId, 'count' => $deleted]);
        }

        return $deleted;
    }

}
