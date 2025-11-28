<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use App\Repositories\Contracts\UserRepositoryInterface;
use App\Repositories\UserRepository;
use App\Repositories\Contracts\CatRepositoryInterface;
use App\Repositories\CatRepository;
use App\Repositories\Contracts\BaserRepositoryInterface;
use App\Repositories\BaserRepository;



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
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        \Illuminate\Support\Facades\Schema::defaultStringLength(191);
    }

    protected $listen = [
        \App\Events\CategoryCreated::class => [
            \App\Listeners\LogCategoryCreatedListener::class,
            \App\Listeners\NotifyN8NListener::class,
        ],
    ];



}
