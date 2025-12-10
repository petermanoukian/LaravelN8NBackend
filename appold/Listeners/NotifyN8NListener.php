<?php

namespace App\Listeners;

use App\Events\CategoryCreated;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class NotifyN8NListener implements ShouldQueue
{
    use InteractsWithQueue;

    public function handle(CategoryCreated $event): void
    {
        $category = $event->category;

        $n8nUrl = rtrim(config('services.n8n.domain'), '/') . '/webhook/insert-read-first-cat';
        $webDomain = rtrim(config('services.web.domain'), '/');

        // Build full URLs if values exist
        $imgUrl   = $category->img   ? $webDomain . '/' . ltrim($category->img, '/')   : '';
        $fileUrl  = $category->filer ? $webDomain . '/' . ltrim($category->filer, '/') : '';

        Log::info('NotifyN8NListener dispatching to N8N', [
            'url'        => $n8nUrl,
            'id'         => $category->id,
            'name'       => $category->name,
            'department' => $category->department,
            'img'        => $imgUrl,
            'filer'      => $fileUrl,
        ]);

        Http::post($n8nUrl, [
            'id'         => $category->id,
            'name'       => $category->name,
            'department' => $category->department,
            'img'        => $imgUrl,
            'filer'      => $fileUrl,
        ]);
    }
}
