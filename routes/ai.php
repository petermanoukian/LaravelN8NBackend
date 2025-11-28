<?php

use Laravel\Mcp\Facades\Mcp;
use App\Mcp\Servers\PingServer;

Mcp::web('/mcp/ping', PingServer::class);
