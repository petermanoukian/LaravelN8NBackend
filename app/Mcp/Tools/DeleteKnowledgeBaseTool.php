<?php

namespace App\Mcp\Tools;

use App\Models\Baser;
use Laravel\Mcp\Server\Tool;
use Laravel\Mcp\Request;
use Laravel\Mcp\Response;
use Illuminate\Support\Facades\Log;

class DeleteKnowledgeBaseTool extends Tool
{
    protected string $name = 'delete-knowledge-base';
    protected string $description = 'Delete a knowledge base entry by ID.';

    public function handle(Request $request): Response
    {
        // Decode raw JSON body like Resource does
        $raw = json_decode(file_get_contents('php://input'), true);
        $params = $raw['params'] ?? [];
        $args   = $params['arguments'] ?? [];

        Log::info("DeleteKnowledgeBaseTool RAW", $raw);
        Log::info("DeleteKnowledgeBaseTool ARGS", $args);

        // Validate required field: id
        if (empty($args['id'])) {
            return Response::error("Missing required field: id");
        }

        $entry = Baser::find($args['id']);
        if (! $entry) {
            return Response::error("Knowledge base entry not found with id {$args['id']}");
        }

        $entry->delete();

        return Response::json([
            'message' => "Knowledge base entry {$args['id']} deleted successfully.",
            'deletedEntry' => $args['id'],
        ]);
    }
}
