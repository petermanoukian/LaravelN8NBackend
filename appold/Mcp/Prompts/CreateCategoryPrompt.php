<?php

namespace App\Mcp\Prompts;

use Laravel\Mcp\Server\Prompt;
use Laravel\Mcp\Request;
use Laravel\Mcp\Response;

class CreateCategoryPrompt extends Prompt
{
    protected string $name = 'create-category-prompt';
    protected string $description = 'Prompt to create a new category with name, department, and optional files/images.';

    public function handle(Request $request): Response
    {
        return Response::json([
            'name'        => $this->name,
            'description' => $this->description,
            'content'     => 'Use this prompt to create a new category via the create-category tool.',
            'arguments'   => [
                [
                    'name'        => 'name',
                    'type'        => 'string',
                    'description' => 'Category name',
                    'required'    => true,
                ],
                [
                    'name'        => 'department',
                    'type'        => 'string',
                    'description' => 'Department name',
                    'required'    => true,
                ],
                [
                    'name'        => 'img',
                    'type'        => 'string',
                    'description' => 'Optional image path or URL',
                    'required'    => false,
                ],
                [
                    'name'        => 'img2',
                    'type'        => 'string',
                    'description' => 'Optional secondary image path or URL',
                    'required'    => false,
                ],
                [
                    'name'        => 'filer',
                    'type'        => 'string',
                    'description' => 'Optional JSON string of file metadata',
                    'required'    => false,
                ],
            ],
        ]);
    }
}
