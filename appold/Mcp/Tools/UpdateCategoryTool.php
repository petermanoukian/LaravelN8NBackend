<?php

namespace App\Mcp\Tools;

use App\Models\Cat;
use Laravel\Mcp\Server\Tool;
use Laravel\Mcp\Request;
use Laravel\Mcp\Response;
use Illuminate\Support\Facades\Log;

class UpdateCategoryTool extends Tool
{
    protected string $name = 'update-category';
    protected string $description = 'Update an existing category by ID with new values.';

    public function handle(Request $request): Response
    {
        // Decode raw JSON body like Resource does
        $raw = json_decode(file_get_contents('php://input'), true);
        $params = $raw['params'] ?? [];
        $args   = $params['arguments'] ?? [];

        Log::info("UpdateCategoryTool RAW", $raw);
        Log::info("UpdateCategoryTool ARGS", $args);

        // Validate required field: id
        if (empty($args['id'])) {
            return Response::error("Missing required field: id");
        }

        $category = Cat::find($args['id']);
        if (! $category) {
            return Response::error("Category not found with id {$args['id']}");
        }

        // Update only provided fields
        $category->update([
            'name'       => $args['name'] ?? $category->name,
            'department' => $args['department'] ?? $category->department,
            'img'        => $args['img'] ?? $category->img,
            'img2'       => $args['img2'] ?? $category->img2,
            'filer'      => $args['filer'] ?? $category->filer,
        ]);

        // Decode filer into file_summary like your Resource does
        $category->file_summary = is_string($category->filer) && !empty($category->filer)
            ? json_decode($category->filer, true) ?? []
            : [];

        unset($category->filer);

        return Response::json($category->toArray());
    }
}
