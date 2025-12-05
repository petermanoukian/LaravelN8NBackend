<?php

namespace App\Mcp\Resources;

use App\Models\Cat;
use Laravel\Mcp\Server\Resource;
use Laravel\Mcp\Response;
use Laravel\Mcp\Request;
use Illuminate\Support\Facades\Log;

class CategoryFilterResource extends Resource
{
    protected string $name = 'categories-filter';
    protected string $title = 'Filtered Knowledge Categories';
    protected string $description = 'List categories filtered by department commands.';
    protected string $uri = 'knowledge://categories-filter';
    protected string $mimeType = 'application/json';

    public function handle(Request $request): Response
    {
        //$raw = $request->all();
        $raw = json_decode(file_get_contents('php://input'), true);
        Log::info("🔵 CategoryFilterResource RAW", ['all' => $raw]);

        $rootParams = $raw['params'] ?? [];
        $params = $rootParams['parameters'] ?? [];

        Log::info("🔵 CategoryFilterResource PARAMETERS", ['params' => $params]);

        $command = strtolower(trim($params['command'] ?? ''));

        Log::info("🔵 CategoryFilterResource PARSED COMMAND", ['command' => $command]);



        if (empty($command)) {
            Log::warning("⚠️ CategoryFilterResource EMPTY COMMAND");
            return Response::json([
                'command' => '',
                'resolved_departments' => [],
                'categories' => [],
                'message' => 'No command provided. Available commands: sales, marketing, hr, pr, blank, all, all but [dept]'
            ]);
        }

        $departments = ['sales', 'marketing', 'hr', 'pr'];
        $selected = [];

        // Parse the command
        if ($command === 'all') {
            $selected = $departments;
        } 
        elseif ($command === 'blank') {
            $selected = [''];
        }
        elseif (strpos($command, 'all but ') === 0) {
            // Extract what to exclude
            $exclude = str_replace('all but ', '', $command);
            $excludeList = array_filter(array_map('trim', explode(' ', $exclude)));
            $selected = array_diff($departments, $excludeList);
            
            // Special case: "all but blank" means all departments (exclude blank)
            if (in_array('blank', $excludeList)) {
                $selected = $departments;
            }
        }
        else {
            // Multiple departments separated by space
            $requested = array_filter(array_map('trim', explode(' ', $command)));
            foreach ($requested as $dept) {
                if (in_array($dept, $departments)) {
                    $selected[] = $dept;
                } elseif ($dept === 'blank') {
                    $selected[] = '';
                }
            }
        }

        // Remove duplicates and reindex
        $selected = array_values(array_unique($selected));
        Log::info("✅ CategoryFilterResource DEPARTMENTS SELECTED", [
                'command' => $command,
                'selected' => $selected,
            ]);



        // If nothing valid was selected, return empty
        if (empty($selected)) {
            return Response::json([
                'command' => $command,
                'resolved_departments' => [],
                'categories' => [],
                'message' => 'No valid departments found. Available: sales, marketing, hr, pr, blank, all'
            ]);
        }

        // Query categories
        $query = Cat::select('id', 'name', 'img', 'img2', 'department', 'filer', 'created_at');

        if (in_array('', $selected)) {
            // Include blank departments
            if (count($selected) === 1) {
                // ONLY blank
                $query->where(function($q) {
                    $q->whereNull('department')->orWhere('department', '');
                });
            } else {
                // Blank + other departments
                $others = array_filter($selected);
                $query->where(function($q) use ($others) {
                    $q->whereIn('department', $others)
                      ->orWhereNull('department')
                      ->orWhere('department', '');
                });
            }
        } else {
            // Only specific departments
            $query->whereIn('department', $selected);
        }

        $categories = $query->orderBy('name')->get();

        // Decode filer field
        $categories->each(function ($category) {
            $category->file_summary = is_string($category->filer) && !empty($category->filer)
                ? json_decode($category->filer, true) ?? []
                : [];
        });


        Log::info("✅ CategoryFilterResource RETURNING", [
            'command' => $command,
            'resolved_departments' => $selected,
            'total_categories' => $categories->count(),
        ]);

        return Response::json([
            'command' => $command,
            'resolved_departments' => $selected,
            'total_categories' => $categories->count(),
            'categories' => $categories->toArray(),
        ]);
    }
}