<?php

namespace App\Mcp\Prompts;

use Laravel\Mcp\Request;
use Laravel\Mcp\Response;
use Laravel\Mcp\Server\Prompt;

class CreateKnowledgeBasePrompt extends Prompt
{
    protected string $name = 'create-knowledge-base-prompt';

    protected string $description = 'Prompt to create a new knowledge base entry with name, catid, description, and optional files/images.';

    public function handle(Request $request): Response
    {
        return Response::json([
            'name' => $this->name,
            'description' => $this->description,
            'content' => 'Use this prompt to create a knowledge base entry via the create-knowledge-base tool.',
            'arguments' => [
                ['name' => 'name', 'type' => 'string', 'description' => 'Entry name', 'required' => true],
                ['name' => 'catid', 'type' => 'integer', 'description' => 'Category ID', 'required' => true],
                ['name' => 'des', 'type' => 'string', 'description' => 'Main description', 'required' => false],
                ['name' => 'dess', 'type' => 'string', 'description' => 'Secondary description', 'required' => false],
                ['name' => 'img', 'type' => 'string', 'description' => 'Image path', 'required' => false],
                ['name' => 'img2', 'type' => 'string', 'description' => 'Thumbnail path', 'required' => false],
                ['name' => 'filer', 'type' => 'string', 'description' => 'JSON string of file metadata', 'required' => false],
            ],
        ]);
    }
}
