<?php

namespace App\Services\external;

use App\Repositories\external\ProdRepository;

class ProdService
{
    protected ProdRepository $repository;

    public function __construct(ProdRepository $repository)
    {
        $this->repository = $repository;
    }

    public function paginate(
        int $perPage = 15,
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'asc'
    ) {
        return $this->repository->paginate($perPage, $fields, $orderBy, $direction);
    }

    /**
     * Fetch prods from PostgreSQL common_db → prodscommon.
     *
     * @return \Illuminate\Support\Collection
     */
    public function fetchFromPostgres(array $conditions = [])
    {
        return $this->repository->fetchFromPostgres($conditions);
    }

    /**
     * Sync prods from PostgreSQL into SQLite prods table.
     *
     * This will upsert by originid to prevent duplicates.
     */
    public function syncFromPostgres(): void
    {
        $this->repository->syncFromPostgres();
    }

    /**
     * Reconcile deletes from PostgreSQL based on prod.deleted events.
     *
     * @return int number of deleted records
     */
    public function reconcileDeletesFromPostgres(): int
    {
        return $this->repository->reconcileDeletesFromPostgres();
    }
}
 
