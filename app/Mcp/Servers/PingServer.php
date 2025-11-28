<?php

namespace App\Mcp\Servers;

use Laravel\Mcp\Server;

class PingServer extends Server
{
    protected string $name = 'Ping Server';
    protected string $version = '1.0.0';
    protected string $instructions = 'A simple MCP server for testing connectivity and basic requests.';

    protected array $tools = [];     // Add tools here if needed (e.g., via `php artisan make:mcp-tool`)
    protected array $resources = []; // Add resources here if needed
    protected array $prompts = [];   // Add prompts here if needed
}
