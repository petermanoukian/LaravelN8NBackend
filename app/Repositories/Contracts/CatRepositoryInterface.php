<?php

namespace App\Repositories\Contracts;

use App\Models\Cat;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

interface CatRepositoryInterface
{
    public function findById(
        int $id,
        bool $withCount = false,
        bool $withBasers = false
    ): ?Cat;

    public function all(
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc'
    ): Collection;

    public function conditioned(
        array $conditions = [],
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc',
        bool $withCount = false,
        bool $withBasers = false
    ): Collection;

        /**
     * Return paginated categories.
     */
    // App\Repositories\Contracts\CatRepositoryInterface.php

    public function paginate(
        int $perPage = 15,
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'asc',
        bool $withCount = false,
        bool $withBasers = false
    ): LengthAwarePaginator;


    public function create(array $data): Cat;

    public function update(int $id, array $data): bool;

    public function delete(int $id): bool;


    public function getBasers(int $catId): Collection;

    public function deleteBasers(int $catId): int;

}
