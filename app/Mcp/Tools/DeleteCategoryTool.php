<?php

namespace App\Mcp\Tools;

use App\Models\Cat;
use Illuminate\Support\Facades\Log;
use Laravel\Mcp\Request;
use Laravel\Mcp\Response;
use Laravel\Mcp\Server\Tool;

class DeleteCategoryTool extends Tool
{
    protected string $name = 'delete-category';

    protected string $description = 'Delete a category by ID and cascade delete its related knowledge base entries.';

    public function handle(Request $request): Response
    {
        // Decode raw JSON body like Resource does
        $raw = json_decode(file_get_contents('php://input'), true);
        $params = $raw['params'] ?? [];
        $args = $params['arguments'] ?? [];

        Log::info('DeleteCategoryTool RAW', $raw);
        Log::info('DeleteCategoryTool ARGS', $args);

        // Validate required field: id
        if (empty($args['id'])) {
            return Response::error('Missing required field: id');
        }

        $category = Cat::find($args['id']);
        if (! $category) {
            return Response::error("Category not found with id {$args['id']}");
        }

        // Delete related basers first (cascade)
        $deletedBasers = $category->basers()->delete();

        // Delete the category itself
        $category->delete();

        return Response::json([
            'message' => "Category {$args['id']} deleted successfully.",
            'deletedBasers' => $deletedBasers,
            'deletedCategory' => $args['id'],
        ]);
    }
}
