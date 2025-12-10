<?php

namespace App\Repositories\Contracts;

use App\Models\Baser;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

interface BaserRepositoryInterface
{
    public function findById(int $id): ?Baser;

    public function create(array $data): Baser;

    public function update(int $id, array $data): bool;

    public function delete(int $id): bool;

    public function deleteMany(array $ids): int;

    public function findByNameLike(string $name): ?Baser;
    public function findBestByName(string $name): ?Baser;
    


    /**
     * Return all basers as a collection.
     */
    public function all(
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc'
    ): Collection;

    public function conditioned(
        array $conditions = [],
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc'
    ): Collection;

    /**
     * Return paginated basers.
     */
    public function paginate(
        int $perPage = 15,
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'asc'
    ): LengthAwarePaginator;

    public function paginateConditioned(
        array $conditions = [],
        int $perPage = 15,
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc'
    ): LengthAwarePaginator;





    public function search(
        string $keyword = '',
        array $fields = ['name', 'des', 'dess'],
        array $selectFields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc',
        ?int $catid = null // ✅ optional category filter
    ): Collection;



    public function getByCat(int $catId): Collection;

    public function deleteByCat(int $catId): int;



}
