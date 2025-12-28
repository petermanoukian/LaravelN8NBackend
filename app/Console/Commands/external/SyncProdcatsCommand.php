<?php

namespace App\Console\Commands\external;

use Illuminate\Console\Command;
use App\Services\external\ProdcatService;
use Illuminate\Support\Facades\Log;

class SyncProdcatsCommand extends Command
{
    /**
     * The name and signature of the console command.
     */
    protected $signature = 'sync:prodcats';

    /**
     * The console command description.
     */
    protected $description = 'Sync cats from MongoDB into SQLite prodcats table';

    protected ProdcatService $service;

    public function __construct(ProdcatService $service)
    {
        parent::__construct();
        $this->service = $service;
    }

    /**
     * Execute the console command.
     */
    public function handle(): int
    {
        Log::channel('daily')->info('SyncProdcatsCommand started');

        $this->info('🔄 Fetching cats from MongoDB...');
        $cats = $this->service->fetchFromMongo();
        $count = $cats->count();

        $this->info("✅ Fetched {$count} records.");
        Log::channel('daily')->info("Fetched {$count} cats from MongoDB");

        $this->info('📥 Syncing into SQLite...');
        $this->service->syncFromMongo();
        $this->info('✅ Sync complete.');

        Log::channel('daily')->info("Sync complete. Processed {$count} records.");

        // 🔥 NEW: reconcile deletes after sync
        $this->info('🧹 Reconciling deletes...');
        $deletedCount = $this->service->reconcileDeletesFromMongo();
        $this->info("✅ Deleted {$deletedCount} records based on cat.deleted events.");

        Log::channel('daily')->info("Reconcile complete. Deleted {$deletedCount} records.");

        

        return Command::SUCCESS;
    }
}
