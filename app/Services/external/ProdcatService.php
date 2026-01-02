<?php

namespace App\Services\external;

use App\Repositories\external\ProdcatRepository;

class ProdcatService
{
    protected ProdcatRepository $repository;

    public function __construct(ProdcatRepository $repository)
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
     * Fetch cats from MongoDB.
     *
     * @return \Illuminate\Support\Collection
     */
    public function fetchFromMongo()
    {
        return $this->repository->fetchFromMongo();
    }

    /**
     * Sync cats from MongoDB into SQLite prodcats table.
     *
     * This will upsert by originid to prevent duplicates.
     */
    public function syncFromMongo(): void
    {
        $this->repository->syncFromMongo();
    }

    public function reconcileDeletesFromMongo(): int { 
        return $this->repository->reconcileDeletesFromMongo(); 
    }

    
}
