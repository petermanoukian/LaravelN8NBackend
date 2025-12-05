<?php

namespace App\Mcp\Servers;

use Laravel\Mcp\Request;
use Laravel\Mcp\Response;
use Laravel\Mcp\Server;

class TestServer extends Server
{
    protected string $name = 'Test MCP Server';
    protected string $version = '1.0.0';
    protected string $instructions = 'A simple test server to confirm MCP wiring.';

    public function ping(Request $request): Response
    {
        return Response::json([
            'pong' => true,
            'server' => $this->name,
            'version' => $this->version,
            'timestamp' => now()->toISOString(),
        ]);
    }
}
