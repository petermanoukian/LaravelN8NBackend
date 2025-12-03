<?php

namespace App\Mcp\Resources;

use App\Models\Cat;
use Laravel\Mcp\Server\Resource;
use Laravel\Mcp\Response;

class CategoryResource extends Resource
{
    protected string $name = 'categories';
    protected string $title = 'Knowledge Categories';
    protected string $description = 'List categories with names, departments, and attached files (from filer JSON).';
    protected string $uri = 'knowledge://categories';
    protected string $mimeType = 'application/json';

    public function handle(\Laravel\Mcp\Request $request): Response
    {
        // FIX: Added 'filer' to the select statement so it can be processed below.
        $categories = Cat::select('id', 'name', 'img', 'img2','department', 'filer' , 'created_at') 
            ->get();
        
        // Process filer as JSON array (e.g., [{'path': '...', 'type': 'pdf'}])
        $categories->each(function ($category) {
            $category->file_summary = is_string($category->filer) && !empty($category->filer) 
                ? json_decode($category->filer, true) ?? [] 
                : [];
        });

        return Response::json($categories->toArray());
    }
}