<?php

use Laravel\Mcp\Facades\Mcp;
use App\Mcp\Servers\PingServer;
use App\Mcp\Servers\TestServer;

Mcp::web('/mcp/ping', PingServer::class)
   ->middleware('mcp.auth');

Mcp::web('/mcp/test', TestServer::class)
   ->middleware('auth:sanctum');

