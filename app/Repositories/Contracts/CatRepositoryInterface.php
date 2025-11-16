<?php

namespace App\Repositories\Contracts;

use App\Models\Cat;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

interface CatRepositoryInterface
{
    public function findById(int $id): ?Cat;

    public function create(array $data): Cat;

    public function update(int $id, array $data): bool;

    public function delete(int $id): bool;

    /**
     * Return all categories as a collection.
     */
    public function all(array $fields = ['*']): Collection;

    /**
     * Return paginated categories.
     */
    // App\Repositories\Contracts\CatRepositoryInterface.php

    public function paginate(
        int $perPage = 15,
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'asc'
    ): LengthAwarePaginator;

}
