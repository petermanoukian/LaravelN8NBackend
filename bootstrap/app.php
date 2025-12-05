<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

use Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful;
use Illuminate\Routing\Middleware\SubstituteBindings;
use Illuminate\Routing\Middleware\ThrottleRequests;
use App\Http\Middleware\SkipAuthIfMcpInspector;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void {

        $middleware->alias([
            'mcp.auth_check' => SkipAuthIfMcpInspector::class,
        ]);

        $middleware->alias([
            'mcp.auth' => \App\Http\Middleware\McpAuth::class,
        ]);

        $middleware->group('sanctum_protected', [
            'auth:sanctum', // Alias is defined here
        ]);


        $middleware->web([
            EnsureFrontendRequestsAreStateful::class,
        ]);

        $middleware->api([
            EnsureFrontendRequestsAreStateful::class,
            ThrottleRequests::class,
            SubstituteBindings::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        //
    })->create();
require __DIR__.'/../routes/ai.php';