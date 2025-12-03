<?php

namespace App\Mcp\Prompts;

use Laravel\Mcp\Server\Prompt;
use Laravel\Mcp\Request;
use Laravel\Mcp\Response;
use App\Models\Cat;

class SearchCategoriesPrompt extends Prompt
{
    protected string $name = 'search-categories';
    protected string $description = 'Search categories by name and/or department with LIKE matching and AND/OR logic.';

    public function handle(Request $request): Response
    {
        $raw    = json_decode(file_get_contents('php://input'), true);
        $params = $raw['params'] ?? [];
        $args   = $params['arguments'] ?? [];

        $search1    = $args['search1'] ?? null;
        $search2    = $args['search2'] ?? null;
        $searchFor  = strtolower($args['searchFor'] ?? 'both'); // name, department, or both
        $searchType = strtoupper($args['searchType'] ?? 'OR');  // AND or OR

        $query = Cat::query();

        // Case A: only search1 is sent
        if ($search1 && empty($search2)) {
            if ($searchFor === 'name') {
                $query->where('name', 'like', "%{$search1}%");
            } elseif ($searchFor === 'department') {
                $query->where('department', 'like', "%{$search1}%");
            } else { // both
                if ($searchType === 'AND') {
                    $query->where('name', 'like', "%{$search1}%")
                          ->where('department', 'like', "%{$search1}%");
                } else {
                    $query->where(function ($q) use ($search1) {
                        $q->where('name', 'like', "%{$search1}%")
                          ->orWhere('department', 'like', "%{$search1}%");
                    });
                }
            }
        }

        // Case B: both search1 and search2 are sent
        elseif ($search1 && $search2) {
            if ($searchType === 'AND') {
                $query->where('name', 'like', "%{$search1}%")
                      ->where('department', 'like', "%{$search2}%");
            } else {
                $query->where(function ($q) use ($search1, $search2) {
                    $q->where('name', 'like', "%{$search1}%")
                      ->orWhere('department', 'like', "%{$search2}%");
                });
            }
        }

        $results = $query->get();

        return Response::json($results->toArray());
    }
}
