<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Collection; // Make sure to include Collection

class SkipAuthIfMcpInspector
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // Check if the request contains the special MCP Inspector Proxy Auth Token in the query string.
        if ($request->has('MCP_PROXY_AUTH_TOKEN')) {

            $route = $request->route();

            if ($route) {
                // Gather all current middleware applied to this route.
                $middlewares = Collection::make($route->gatherMiddleware())
                    // Remove the 'auth:sanctum' middleware from the list.
                    ->reject(function ($middleware) {
                        return $middleware === 'auth:sanctum';
                    })
                    ->toArray();

                // Re-apply the modified list of middleware (without 'auth:sanctum') to the route.
                $route->middleware($middlewares);
            }
        }

        // Proceed to the next middleware or controller action.
        // If the token was present, 'auth:sanctum' is now skipped.
        // If the token was NOT present (i.e., production/external access), 'auth:sanctum' will run as usual.
        return $next($request);
    }
}