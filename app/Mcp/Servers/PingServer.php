<?php

namespace App\Mcp\Servers;

use App\Mcp\Resources\CategoryResource;
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

    ];

    protected array $prompts = [
        ListCategoriesPrompt::class,
        SearchCategoriesPrompt::class,
        ListKnowledgeBasePrompt::class, 
        ListKnowledgeBaseByCatidPrompt::class,
        SearchKnowledgeBasePrompt::class,
        CreateCategoryPrompt::class, 
        CreateKnowledgeBasePrompt::class,
    ];

    /**
     * Override resources/read so query parameters don't break resource matching.
     */
    public function resourcesRead(Request $request): Response
    {
        $raw = json_decode(file_get_contents('php://input'), true);
        $params = $raw['params'] ?? [];

        $uri        = $params['uri'] ?? null;
        $parameters = $params['parameters'] ?? [];

        if (empty($uri)) {
            return Response::error('Resource URI is missing or empty.');
        }

        $baseUri = explode('?', $uri)[0];

        Log::info("MCP DEBUG", [
            'raw_uri'    => $uri,
            'base_uri'   => $baseUri,
            'parameters' => $parameters,
        ]);

        $resourceClass = collect($this->resources)->first(function ($class) use ($baseUri) {
            return app($class)->uri === $baseUri;
        });

        if (!$resourceClass) {
            return Response::error('Resource not found: ' . $uri);
        }

        $resource = app($resourceClass);

        $mock = new Request([
            'jsonrpc' => '2.0',
            'method'  => 'resources/read',
            'params'  => [
                'uri'        => $uri,
                'parameters' => $parameters,
            ],
        ]);

        $mock->resource = $resource;

        return $resource->handle($mock);
    }

    public function __call($method, $arguments)
    {
        Log::info("PingServer::__call intercepted", [
            'method'    => $method,
            'arguments' => $arguments,
        ]);

        return parent::__call($method, $arguments);
    }

    /**
     * Handle tool execution.
     */
    public function toolsExecute(Request $request): Response
    {
        $raw = json_decode(file_get_contents('php://input'), true);
        $params = $raw['params'] ?? [];

        $toolName   = $params['name'] ?? null;
        $parameters = $params['parameters'] ?? [];

        if (empty($toolName)) {
            return Response::error("Tool name is missing.");
        }

        $toolClass = collect($this->tools)->first(function ($class) use ($toolName) {
            return app($class)->name === $toolName;
        });

        if (!$toolClass) {
            return Response::error("Tool not found: " . $toolName);
        }

        $tool = app($toolClass);

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
        $prompts = collect($this->prompts)->map(function ($class) {
            $prompt = app($class);
            return [
                'name' => $prompt->name,
                'description' => $prompt->description,
            ];
        });

        return Response::json($prompts->toArray());
    }

    public function promptsRead(Request $request): Response
    {
        $raw = json_decode(file_get_contents('php://input'), true);
        $params = $raw['params'] ?? [];
        $name   = $params['name'] ?? null;

        if (empty($name)) {
            return Response::error("Prompt name is missing.");
        }

        $promptClass = collect($this->prompts)->first(function ($class) use ($name) {
            return app($class)->name === $name;
        });

        if (! $promptClass) {
            return Response::error("Prompt not found: " . $name);
        }

        $prompt = app($promptClass);

        return $prompt->handle($request);
    }

}
