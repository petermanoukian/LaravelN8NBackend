<?php

use App\Mcp\Servers\PingServer;
use App\Mcp\Servers\TestServer;
use Laravel\Mcp\Facades\Mcp;

Mcp::local('ping-server', PingServer::class);

/*
Mcp::web('/mcp/ping', PingServer::class);

Mcp::web('/mcp/test', TestServer::class);

*/

Mcp::web('/mcp/ping', PingServer::class)
   ->middleware('auth:sanctum');


