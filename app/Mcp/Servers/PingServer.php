<?php

namespace App\Mcp\Servers;

use App\Mcp\Resources\CategoryResource;
use App\Mcp\Resources\CategoryFilterResource;
use App\Mcp\Resources\KnowledgeBaseResource;
use App\Mcp\Resources\KnowledgeBaseSearchResource;

use App\Mcp\Tools\CreateCategoryTool;
use App\Mcp\Tools\CreateKnowledgeBaseTool;
use App\Mcp\Tools\UpdateCategoryTool;
use App\Mcp\Tools\UpdateKnowledgeBaseTool;
use App\Mcp\Tools\DeleteCategoryTool;
use App\Mcp\Tools\DeleteKnowledgeBaseTool;
use App\Mcp\Prompts\ListKnowledgeBasePrompt;
use App\Mcp\Prompts\ListKnowledgeBaseByCatidPrompt;
use App\Mcp\Prompts\SearchKnowledgeBasePrompt;
use App\Mcp\Prompts\FilterCategoriesPrompt;
use App\Mcp\Prompts\CreateCategoryPrompt;
use App\Mcp\Prompts\CreateKnowledgeBasePrompt;
use Laravel\Mcp\Request;
use Laravel\Mcp\Response;
use Laravel\Mcp\Server;
use App\Mcp\Prompts\ListCategoriesPrompt;
use App\Mcp\Prompts\SearchCategoriesPrompt;
use Illuminate\Support\Facades\Log;

class PingServer extends Server
{
    protected string $name = 'Knowledge MCP Server';
    protected string $version = '1.0.0';
    protected string $instructions = 'MCP server for knowledge base: query categories/entries (with ?catid filters), create entries, upload files.';

    
    public function ping(Request $request): Response
    {
        return Response::json([
            'pong' => true,
            'server' => $this->name,
            'version' => $this->version,
            'timestamp' => now()->toISOString(),
        ]);
    }

    
    // Register tools with clean imports
    protected array $tools = [
        CreateCategoryTool::class,
        CreateKnowledgeBaseTool::class,
        UpdateCategoryTool::class, 
        UpdateKnowledgeBaseTool::class,
        DeleteCategoryTool::class,
        DeleteKnowledgeBaseTool::class, 
    ];

    // Register resources with clean imports
    protected array $resources = [
        CategoryResource::class,
        KnowledgeBaseResource::class,
        KnowledgeBaseSearchResource::class, 
        CategoryFilterResource::class,

    ];

    protected array $prompts = [
        ListCategoriesPrompt::class,
        SearchCategoriesPrompt::class,
        ListKnowledgeBasePrompt::class, 
        ListKnowledgeBaseByCatidPrompt::class,
        SearchKnowledgeBasePrompt::class,
        CreateCategoryPrompt::class, 
        CreateKnowledgeBasePrompt::class,
        FilterCategoriesPrompt::class,
    ];

    /**
     * Override resources/read so query parameters don't break resource matching.
     */
    public function resourcesRead(Request $request): Response
    {
        // ✅ LOG 1: Entry point
        Log::info("🔵 PingServer::resourcesRead CALLED");
        
        $raw = json_decode(file_get_contents('php://input'), true);
        $params = $raw['params'] ?? [];

        $uri        = $params['uri'] ?? null;
        $parameters = $params['parameters'] ?? [];

        // ✅ LOG 2: What we received
        Log::info("🔵 PingServer::resourcesRead RECEIVED", [
            'raw_request' => $raw,
            'uri' => $uri,
            'parameters' => $parameters,
        ]);

        if (empty($uri)) {
            Log::error("❌ PingServer::resourcesRead URI is empty");
            return Response::error('Resource URI is missing or empty.');
        }

        $baseUri = explode('?', $uri)[0];

        // ✅ LOG 3: URI parsing
        Log::info("🔵 PingServer::resourcesRead URI PARSED", [
            'raw_uri'    => $uri,
            'base_uri'   => $baseUri,
            'parameters' => $parameters,
        ]);

        $resourceClass = collect($this->resources)->first(function ($class) use ($baseUri) {
            return app($class)->uri === $baseUri;
        });

        // ✅ LOG 4: Resource lookup
        Log::info("🔵 PingServer::resourcesRead RESOURCE LOOKUP", [
            'looking_for' => $baseUri,
            'found_class' => $resourceClass,
            'available_resources' => collect($this->resources)->map(fn($c) => [
                'class' => $c,
                'uri' => app($c)->uri
            ])->toArray(),
        ]);

        if (!$resourceClass) {
            Log::error("❌ PingServer::resourcesRead Resource not found: " . $uri);
            return Response::error('Resource not found: ' . $uri);
        }

        $resource = app($resourceClass);

        // ✅ LOG 5: Creating mock request
        Log::info("🔵 PingServer::resourcesRead CREATING MOCK REQUEST", [
            'resource_class' => get_class($resource),
            'uri' => $uri,
            'parameters' => $parameters,
        ]);

        $mock = new Request([
            'jsonrpc' => '2.0',
            'method'  => 'resources/read',
            'params'  => [
                'uri'        => $uri,
                'parameters' => $parameters,
            ],
        ]);

        $mock->resource = $resource;

        // ✅ LOG 6: Before calling resource handler
        Log::info("🔵 PingServer::resourcesRead CALLING RESOURCE HANDLER");

        $response = $resource->handle($mock);

        // ✅ LOG 7: After calling resource handler
        Log::info("🔵 PingServer::resourcesRead RESOURCE HANDLER RETURNED", [
            'response_type' => get_class($response),
        ]);

        return $response;
    }


    public function __call($method, $arguments)
    {
        // ✅ LOG 8: Magic method interceptor
        Log::info("🟡 PingServer::__call INTERCEPTED", [
            'method'    => $method,
            'arguments' => $arguments,
        ]);

        // Manual map
        $map = [
            'prompts/read' => 'promptsRead',
            'resources/read' => 'resourcesRead',
            'tools/execute' => 'toolsExecute',
            'prompts/list' => 'promptsList',
        ];

        if (isset($map[$method])) {
            Log::info("🟡 PingServer::__call MAPPED to: " . $map[$method]);
            return $this->{$map[$method]}(...$arguments);
        }

        Log::warning("⚠️ PingServer::__call NO MAPPING, calling parent");
        return parent::__call($method, $arguments);
    }


    /**
     * Handle tool execution.
     */
    public function toolsExecute(Request $request): Response
    {
        // ✅ LOG 9: Tool execution entry
        Log::info("🟢 PingServer::toolsExecute CALLED");

        $raw = json_decode(file_get_contents('php://input'), true);
        $params = $raw['params'] ?? [];

        $toolName   = $params['name'] ?? null;
        $parameters = $params['parameters'] ?? [];

        // ✅ LOG 10: Tool execution details
        Log::info("🟢 PingServer::toolsExecute RECEIVED", [
            'raw_request' => $raw,
            'tool_name' => $toolName,
            'parameters' => $parameters,
        ]);

        if (empty($toolName)) {
            Log::error("❌ PingServer::toolsExecute Tool name missing");
            return Response::error("Tool name is missing.");
        }

        $toolClass = collect($this->tools)->first(function ($class) use ($toolName) {
            return app($class)->name === $toolName;
        });

        if (!$toolClass) {
            Log::error("❌ PingServer::toolsExecute Tool not found: " . $toolName);
            return Response::error("Tool not found: " . $toolName);
        }

        $tool = app($toolClass);

        Log::info("🟢 PingServer::toolsExecute EXECUTING TOOL", [
            'tool_class' => get_class($tool),
        ]);

        $mock = new Request([
            'jsonrpc' => '2.0',
            'method'  => 'tools/execute',
            'params'  => [
                'name'       => $toolName,
                'parameters' => $parameters,
            ],
        ]);

        return $tool->execute($mock);
    }


    public function promptsList(Request $request): Response
    {
        // ✅ LOG 11: List prompts
        Log::info("🟣 PingServer::promptsList CALLED");

        $prompts = collect($this->prompts)->map(function ($class) {
            $prompt = app($class);
            return [
                'name' => $prompt->name,
                'description' => $prompt->description,
            ];
        });

        Log::info("🟣 PingServer::promptsList RETURNING", [
            'prompt_count' => $prompts->count(),
            'prompts' => $prompts->toArray(),
        ]);

        return Response::json($prompts->toArray());
    }


    public function promptsRead(Request $request): Response
    {
        // ✅ LOG 12: Entry point
        Log::info("🟣 PingServer::promptsRead CALLED");

        $raw = json_decode(file_get_contents('php://input'), true);
        $params = $raw['params'] ?? [];
        $name   = $params['name'] ?? null;
        $arguments = $params['arguments'] ?? [];

        // ✅ LOG 13: What we received
        Log::info("🟣 PingServer::promptsRead RECEIVED", [
            'raw_request' => $raw,
            'prompt_name' => $name,
            'arguments' => $arguments,
            'all_params' => $params,
        ]);

        if (empty($name)) {
            Log::error("❌ PingServer::promptsRead Prompt name missing");
            return Response::error("Prompt name is missing.");
        }

        $promptClass = collect($this->prompts)->first(fn($class) => app($class)->name === $name);

        // ✅ LOG 14: Prompt lookup
        Log::info("🟣 PingServer::promptsRead PROMPT LOOKUP", [
            'looking_for' => $name,
            'found_class' => $promptClass,
            'available_prompts' => collect($this->prompts)->map(fn($c) => [
                'class' => $c,
                'name' => app($c)->name
            ])->toArray(),
        ]);

        if (! $promptClass) {
            Log::error("❌ PingServer::promptsRead Prompt not found: " . $name);
            return Response::error("Prompt not found: " . $name);
        }

        $prompt = app($promptClass);

        // ✅ LOG 15: Creating mock request
        Log::info("🟣 PingServer::promptsRead CREATING MOCK REQUEST", [
            'prompt_class' => get_class($prompt),
            'params' => $params,
        ]);

        $mock = new Request([
            'jsonrpc' => '2.0',
            'method'  => 'prompts/read',
            'params'  => $params,
        ]);

        // ✅ Attach the prompt explicitly
        $mock->prompt = $prompt;

        // ✅ LOG 16: Before calling prompt handler
        Log::info("🟣 PingServer::promptsRead CALLING PROMPT HANDLER");

        $response = $prompt->handle($mock);

        // ✅ LOG 17: After calling prompt handler
        Log::info("🟣 PingServer::promptsRead PROMPT HANDLER RETURNED", [
            'response_type' => get_class($response),
        ]);

        return $response;
    }
}