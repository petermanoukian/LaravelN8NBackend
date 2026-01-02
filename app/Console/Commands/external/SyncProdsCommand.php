<?php

namespace App\Console\Commands\external;

use Illuminate\Console\Command;
use App\Services\external\ProdService;
use Illuminate\Support\Facades\Log;

class SyncProdsCommand extends Command
{
    /**
     * The name and signature of the console command.
     */
    protected $signature = 'sync:prods';

    /**
     * The console command description.
     */
    protected $description = 'Sync prods from PostgreSQL into SQLite prods table';

    protected ProdService $service;

    public function __construct(ProdService $service)
    {
        parent::__construct();
        $this->service = $service;
    }

    /**
     * Execute the console command.
     */
    public function handle(): int
    {
        Log::channel('daily')->info('SyncProdsCommand started');

        $this->info('🔄 Fetching prods from PostgreSQL...');
        $prods = $this->service->fetchFromPostgres();
        $count = $prods->count();

        $this->info("✅ Fetched {$count} records.");
        Log::channel('daily')->info("Fetched {$count} prods from PostgreSQL");

        $this->info('📥 Syncing into SQLite...');
        $this->service->syncFromPostgres();
        $this->info('✅ Sync complete.');

        Log::channel('daily')->info("Sync complete. Processed {$count} records.");

        // 🔥 Reconcile deletes after sync
        $this->info('🧹 Reconciling deletes...');
        $deletedCount = $this->service->reconcileDeletesFromPostgres();
        $this->info("✅ Deleted {$deletedCount} records based on prod.deleted events.");

        Log::channel('daily')->info("Reconcile complete. Deleted {$deletedCount} records.");

        return Command::SUCCESS;
    }
}
