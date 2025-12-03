<?php

namespace App\Mcp\Prompts;

use Laravel\Mcp\Server\Prompt;
use Laravel\Mcp\Request;
use Laravel\Mcp\Response;

class ListKnowledgeBaseByCatidPrompt extends Prompt
{
    protected string $name = 'list-knowledge-base-by-catid';
    protected string $description = 'Prompt to list knowledge base entries filtered by category ID.';

    public function handle(Request $request): Response
    {
        return Response::json([
            'name'        => $this->name,
            'description' => $this->description,
            'content'     => 'List all knowledge base entries for a given category ID.',
            'arguments'   => [
                [
                    'name'        => 'catid',
                    'type'        => 'integer',
                    'description' => 'Category ID to filter knowledge base entries.',
                    'required'    => true,
                ],
            ],
        ]);
    }
}
