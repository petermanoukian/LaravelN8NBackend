<?php

namespace App\Mcp\Tools;

use App\Models\Baser;
use Laravel\Mcp\Server\Tool;
use Laravel\Mcp\Request;
use Laravel\Mcp\Response;
use Illuminate\Support\Facades\Log;

class UpdateKnowledgeBaseTool extends Tool
{
    protected string $name = 'update-knowledge-base';
    protected string $description = 'Update an existing knowledge base entry by ID with new values.';

    public function handle(Request $request): Response
    {
        // Decode raw JSON body like Resource does
        $raw = json_decode(file_get_contents('php://input'), true);
        $params = $raw['params'] ?? [];
        $args   = $params['arguments'] ?? [];

        Log::info("UpdateKnowledgeBaseTool RAW", $raw);
        Log::info("UpdateKnowledgeBaseTool ARGS", $args);

        // Validate required field: id
        if (empty($args['id'])) {
            return Response::error("Missing required field: id");
        }

        $entry = Baser::find($args['id']);
        if (! $entry) {
            return Response::error("Knowledge base entry not found with id {$args['id']}");
        }

        // Update only provided fields
        $entry->update([
            'name'  => $args['name'] ?? $entry->name,
            'catid' => $args['catid'] ?? $entry->catid,
            'img'   => $args['img'] ?? $entry->img,
            'img2'  => $args['img2'] ?? $entry->img2,
            'filer' => $args['filer'] ?? $entry->filer,
            'des'   => $args['des'] ?? $entry->des,
            'dess'  => $args['dess'] ?? $entry->dess,
        ]);

        // Decode filer JSON column into file_summary array
        $entry->file_summary = is_string($entry->filer) && !empty($entry->filer)
            ? json_decode($entry->filer, true) ?? []
            : [];

        unset($entry->filer);

        return Response::json($entry->toArray());
    }
}
