<?php

namespace App\Mcp\Tools;

use App\Models\Cat;
use Illuminate\Support\Facades\Log;
use Laravel\Mcp\Request;
use Laravel\Mcp\Response;
use Laravel\Mcp\Server\Tool;

class CreateCategoryTool extends Tool
{
    protected string $name = 'create-category';

    protected string $description = 'Create a new category with name, department, and optional files/images.';

    public function handle(Request $request): Response
    {
        // Decode raw JSON body like Resource does
        $raw = json_decode(file_get_contents('php://input'), true);
        $params = $raw['params'] ?? [];
        $args = $params['arguments'] ?? [];

        Log::info('CreateCategoryTool RAW', $raw);
        Log::info('CreateCategoryTool ARGS', $args);

        if (empty($args['name']) || empty($args['department'])) {
            return Response::error('Missing required fields: name, department');
        }

        $category = Cat::create([
            'name' => $args['name'],
            'department' => $args['department'],
            'img' => $args['img'] ?? null,
            'img2' => $args['img2'] ?? null,
            'filer' => $args['filer'] ?? null,
        ]);

        // Decode filer into file_summary like your Resource does
        $category->file_summary = is_string($category->filer) && ! empty($category->filer)
            ? json_decode($category->filer, true) ?? []
            : [];

        unset($category->filer);

        return Response::json($category->toArray());
    }
}
