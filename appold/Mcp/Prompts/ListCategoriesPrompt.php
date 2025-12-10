<?php

namespace App\Mcp\Prompts;

use Laravel\Mcp\Server\Prompt;
use Laravel\Mcp\Request;
use Laravel\Mcp\Response;

class ListCategoriesPrompt extends Prompt
{
    protected string $name = 'list-categories';
    protected string $description = 'Prompt to list all categories.';

    public function handle(Request $request): Response
    {
        return Response::json([
            'name'        => $this->name,
            'description' => $this->description,
            'content'     => 'List all categories.',
        ]);
    }
}
