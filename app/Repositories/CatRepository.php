<?php

namespace App\Repositories;

use App\Models\Cat;
use App\Repositories\Contracts\CatRepositoryInterface;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Log;

class CatRepository implements CatRepositoryInterface
{
    public function findById(int $id): ?Cat
    {
        return Cat::find($id);
    }

    public function create(array $data): Cat
    {
        $cat = Cat::create($data);
        Log::info('Created category', ['cat_id' => $cat->id, 'data' => $data]);

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
            Log::info('Updated category', ['cat_id' => $id, 'data' => $data]);
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

    /**
     * Return all categories as a collection.
     */
    public function all(
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'asc'
    ): Collection {
        $cats = Cat::select($fields)
            ->orderBy($orderBy, $direction)
            ->get();

        Log::info('Fetched all categories as collection', [
            'fields'    => $fields,
            'count'     => $cats->count(),
            'order_by'  => $orderBy,
            'direction' => $direction,
        ]);

        return $cats;
    }

    /**
     * Return paginated categories.
     */
    public function paginate(
        int $perPage = 15,
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'asc'
    ): LengthAwarePaginator {
        $cats = Cat::select($fields)
            ->orderBy($orderBy, $direction)
            ->paginate($perPage); // ✅ no manual page override

        Log::info('Paginated categories', [
            'per_page'  => $perPage,
            'total'     => $cats->total(),
            'fields'    => $fields,
            'order_by'  => $orderBy,
            'direction' => $direction,
        ]);

        return $cats;
    }

}
