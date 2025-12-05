<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class McpAuth
{
    public function handle(Request $request, Closure $next)
    {
        $token = $request->header('Authorization');
        
        // Your expected token from claude_desktop_config.json
        $expectedToken = 'Bearer 162|ntapTh7XcvMt1bsZ3PM4sB5wqVuqLWEjRfE9nXsZd4fc3ded';
        
        if ($token === $expectedToken) {
            return $next($request);
        }
        
        return response()->json(['error' => 'Unauthorized'], 401);
    }
}