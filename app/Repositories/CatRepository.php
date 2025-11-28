<?php

namespace App\Repositories;

use App\Models\Cat;
use App\Models\Baser;
use App\Repositories\Contracts\CatRepositoryInterface;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Log;

class CatRepository implements CatRepositoryInterface
{
    public function findById(
        int $id,
        bool $withCount = false,
        bool $withBasers = false
    ): ?Cat {
        $query = Cat::query();

        if ($withBasers) {
            $query->with('basers');
        }

        if ($withCount) {
            $query->withCount('basers');
        }

        return $query->find($id);
    }

        public function all(
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc',
        bool $withCount = false,
        bool $withBasers = false
    ): Collection {
        $query = Cat::select($fields);

        if ($withBasers) {
            $query->with('basers');
        }

        if ($withCount) {
            $query->withCount('basers');
        }

        $cats = $query->orderBy($orderBy, $direction)->get();

        /*
        Log::info('Fetched all categories as collection', [
            'fields'       => $fields,
            'count'        => $cats->count(),
            'order_by'     => $orderBy,
            'direction'    => $direction,
            'with_count'   => $withCount,
            'with_basers'  => $withBasers,
        ]);
        */

        return $cats;
    }


    public function conditioned(
        array $conditions = [],
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc',
        bool $withCount = false,
        bool $withBasers = false
    ): Collection {
        $query = Cat::select($fields);

        if ($withBasers) {
            $query->with('basers');
        }

        if ($withCount) {
            $query->withCount('basers');
        }

        foreach ($conditions as $field => $value) {
            if ($value !== null && $value !== '') {
                if ($field === 'department' && strtolower($value) === 'none') {
                    // Special case: only rows where department is NULL or blank
                    $query->where(function ($q) {
                        $q->whereNull('department')
                        ->orWhere('department', '');
                    });
                } else {
                    // Normal exact match
                    $query->where($field, $value);
                }
            }
        }

        $cats = $query->orderBy($orderBy, $direction)->get();

        /*
        Log::info('Fetched conditioned categories as collection', [
            'fields'       => $fields,
            'conditions'   => $conditions,
            'count'        => $cats->count(),
            'order_by'     => $orderBy,
            'direction'    => $direction,
            'with_count'   => $withCount,
            'with_basers'  => $withBasers,
        ]);
        */

        return $cats;
    }


    /**
     * Return paginated categories.
    */

    public function paginate(
        int $perPage = 15,
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'asc',
        bool $withCount = false,
        bool $withBasers = false
    ): LengthAwarePaginator {
        $query = Cat::select($fields);

        if ($withBasers) {
            $query->with('basers');
        }

        if ($withCount) {
            $query->withCount('basers');
        }

        $cats = $query->orderBy($orderBy, $direction)->paginate($perPage);

        /*
        Log::info('Paginated categories', [
            'per_page'    => $perPage,
            'total'       => $cats->total(),
            'fields'      => $fields,
            'order_by'    => $orderBy,
            'direction'   => $direction,
            'with_count'  => $withCount,
            'with_basers' => $withBasers,
        ]);
        */

        return $cats;
    }



    public function getBasers(int $catId): Collection
    {
        $cat = $this->findById($catId);
        return $cat ? $cat->basers : collect();
    }




    public function create(array $data): Cat
    {
        $cat = Cat::create($data);
        //Log::info('Created category', ['cat_id' => $cat->id, 'data' => $data]);

        return $cat;
    }

    public function update(int $id, array $data): bool
    {
        $cat = $this->findById($id);
        if (!$cat) {
            return false;
        }

        $updated = $cat->update($data);
        if ($updated) {
            //Log::info('Updated category', ['cat_id' => $id, 'data' => $data]);
        }

        return $updated;
    }

    public function delete(int $id): bool
    {
        $cat = $this->findById($id);
        if (!$cat) {
            return false;
        }

        $deleted = $cat->delete();
        if ($deleted) {
            Log::info('Deleted category', ['cat_id' => $id]);
        }

        return $deleted;
    }


   



    public function deleteBasers(int $catId): int
    {
        $cat = $this->findById($catId);
        if (!$cat) {
            return 0;
        }

        $deleted = $cat->basers()->delete();

        if ($deleted) {
            Log::info('Deleted basers for category', ['cat_id' => $catId, 'count' => $deleted]);
        }

        return $deleted;
    }

}
