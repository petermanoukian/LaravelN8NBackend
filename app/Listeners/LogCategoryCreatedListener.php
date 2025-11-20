<?php

namespace App\Listeners;

use App\Events\CategoryCreated;
use Illuminate\Support\Facades\Log;

//app\Listeners\LogCategoryCreatedListener.php
class LogCategoryCreatedListener
{
    /**
     * Handle the event.
     */
    public function handle(CategoryCreated $event): void
    {
        Log::info('LogCategoryCreatedListener CategoryCreated event fired', [
            'id' => $event->category->id,
            'name' => $event->category->name,
            'department' => $event->category->department,
        ]);
    }
}

