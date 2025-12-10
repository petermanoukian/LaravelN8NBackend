<?php

namespace App\Mcp\Tools;

use App\Models\Baser;
use Laravel\Mcp\Server\Tool;
use Laravel\Mcp\Request;
use Laravel\Mcp\Response;
use Illuminate\Support\Facades\Log;

class CreateKnowledgeBaseTool extends Tool
{
    protected string $name = 'create-knowledge-base';
    protected string $description = 'Create a new knowledge base entry with name, catid, description, and optional files/images.';

    public function handle(Request $request): Response
    {
        // Decode raw JSON body like Resource does
        $raw = json_decode(file_get_contents('php://input'), true);
        $params = $raw['params'] ?? [];
        $args   = $params['arguments'] ?? [];

        Log::info("CreateKnowledgeBaseTool RAW", $raw);
        Log::info("CreateKnowledgeBaseTool ARGS", $args);

        // Validate required fields
        if (empty($args['name']) || empty($args['catid'])) {
            return Response::error("Missing required fields: name, catid");
        }

        $entry = Baser::create([
            'name'       => $args['name'],
            'catid'      => $args['catid'],
            'img'        => $args['img'] ?? null,
            'img2'       => $args['img2'] ?? null,
            'filer'      => $args['filer'] ?? null,
            'des'        => $args['des'] ?? null,
            'dess'       => $args['dess'] ?? null,
        ]);

        // Decode filer JSON column into file_summary array
        $entry->file_summary = is_string($entry->filer) && !empty($entry->filer)
            ? json_decode($entry->filer, true) ?? []
            : [];

        unset($entry->filer);

        return Response::json($entry->toArray());
    }
}
