<?php

use Laravel\Mcp\Facades\Mcp;
use App\Mcp\Servers\PingServer;


Route::middleware(['auth:sanctum'])->group(function () {
    Mcp::web('/mcp/ping', PingServer::class);
});