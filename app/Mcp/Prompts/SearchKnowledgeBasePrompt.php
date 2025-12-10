<?php

namespace App\Mcp\Prompts;

use Laravel\Mcp\Request;
use Laravel\Mcp\Response;
use Laravel\Mcp\Server\Prompt;

class SearchKnowledgeBasePrompt extends Prompt
{
    protected string $name = 'search-knowledge-base';

    protected string $description = 'Search knowledge base entries by name/des/dess and/or category name with flexible LIKE matching.';

    public function handle(Request $request): Response
    {
        return Response::json([
            'name' => $this->name,
            'description' => $this->description,
            'content' => 'Search knowledge base entries by keyword(s) across entry fields and category name.',
            'arguments' => [
                [
                    'name' => 'search1',
                    'type' => 'string',
                    'description' => 'Primary search term (name, des, dess).',
                    'required' => false,
                ],
                [
                    'name' => 'search2',
                    'type' => 'string',
                    'description' => 'Secondary search term (category name).',
                    'required' => false,
                ],
                [
                    'name' => 'searchnature',
                    'type' => 'string',
                    'description' => 'Scope: entry-fields, category, or both.',
                    'required' => false,
                ],
                [
                    'name' => 'searchType',
                    'type' => 'string',
                    'description' => 'Combine logic: AND or OR.',
                    'required' => false,
                ],
            ],
        ]);
    }
}
