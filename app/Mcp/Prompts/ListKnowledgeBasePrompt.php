<?php

namespace App\Mcp\Prompts;

use Laravel\Mcp\Request;
use Laravel\Mcp\Response;
use Laravel\Mcp\Server\Prompt;

class ListKnowledgeBasePrompt extends Prompt
{
    protected string $name = 'list-knowledge-base';

    protected string $description = 'Prompt to list all knowledge base entries.';

    public function handle(Request $request): Response
    {
        // Return the template instruction
        return Response::json([
            'name' => $this->name,
            'description' => $this->description,
            'content' => 'List all knowledge base entries.',
        ]);
    }
}
