<?php

namespace App\Providers;

use App\Repositories\BaserRepository;
use App\Repositories\BaserSuggestionRepository;
use App\Repositories\CatRepository;
use App\Repositories\Contracts\BaserRepositoryInterface;
use App\Repositories\Contracts\BaserSuggestionRepositoryInterface;
use App\Repositories\Contracts\CatRepositoryInterface;
use App\Repositories\Contracts\UserRepositoryInterface;
use App\Repositories\UserRepository;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->bind(UserRepositoryInterface::class, UserRepository::class);
        $this->app->bind(CatRepositoryInterface::class, CatRepository::class);
        $this->app->bind(BaserRepositoryInterface::class, BaserRepository::class);
        $this->app->bind(BaserSuggestionRepositoryInterface::class, BaserSuggestionRepository::class);
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        \Illuminate\Support\Facades\Schema::defaultStringLength(191);

        if (class_exists(\Laravel\Mcp\Server::class)) {
            // Override the supported versions to include Gemini's version
            config([
                'mcp.supported_protocol_versions' => [
                    '2025-11-25',  // Add Gemini's version
                    '2025-06-18',
                    '2025-03-26',
                    '2024-11-05',
                ],
            ]);
        }

    }

    protected $listen = [
        \App\Events\CategoryCreated::class => [
            \App\Listeners\LogCategoryCreatedListener::class,
            \App\Listeners\NotifyN8NListener::class,
        ],
    ];
}
