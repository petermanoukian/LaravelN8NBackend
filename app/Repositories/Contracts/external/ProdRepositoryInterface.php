<?php

namespace App\Repositories\Contracts\external;

use App\Models\external\Prod;
use Illuminate\Database\Eloquent\Collection as EloquentCollection;
use Illuminate\Support\Collection as SupportCollection;
use Illuminate\Pagination\LengthAwarePaginator;

interface ProdRepositoryInterface
{
    // ✅ Basic find
    public function findById(int $id): ?Prod;

    // ✅ Read all from SQLite (local copy)
    public function all(
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc'
    ): EloquentCollection;

    // ✅ Paginate local prods
    public function paginate(
        int $perPage = 15,
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'asc'
    ): LengthAwarePaginator;

    // ✅ Create in SQLite
    public function create(array $data): Prod;

    // ✅ Update in SQLite
    public function update(int $id, array $data): bool;

    // ✅ Delete in SQLite
    public function delete(int $id): bool;

    // ✅ Upsert by originid (anchor from PostgreSQL)
    public function upsertByOriginId(array $data): Prod;

    // ✅ Fetch from PostgreSQL common_db → prodscommon
    public function fetchFromPostgres(array $conditions = []): SupportCollection;

    // ✅ Sync from PostgreSQL into SQLite
    public function syncFromPostgres(): void;

    // ✅ Reconcile deletes based on eventtype = prod.deleted
    public function reconcileDeletesFromPostgres(): int;

    // ✅ Delete by originid in SQLite
    public function deleteByOriginId(int $originid): int;
}
