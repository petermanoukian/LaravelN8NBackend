<?php

namespace App\Repositories\Contracts\external;

use App\Models\external\Prodcat;
use Illuminate\Database\Eloquent\Collection as EloquentCollection;
use Illuminate\Support\Collection as SupportCollection;
use Illuminate\Pagination\LengthAwarePaginator;

interface ProdcatRepositoryInterface
{
    public function findById(int $id): ?Prodcat;

    public function all(
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc'
    ): EloquentCollection;

    public function paginate(
        int $perPage = 15,
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'asc'
    ): LengthAwarePaginator;

    public function create(array $data): Prodcat;

    public function update(int $id, array $data): bool;

    public function delete(int $id): bool;

    public function upsertByOriginId(array $data): Prodcat;

    // ✅ Explicitly use SupportCollection for MongoDB
    public function fetchFromMongo(array $conditions = []): SupportCollection;

    public function syncFromMongo(): void;

    public function reconcileDeletesFromMongo(): int;

    public function deleteByOriginId(int $originid): int;
}
