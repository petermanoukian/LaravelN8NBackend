<?php

namespace App\Mcp\Resources;

use App\Models\Baser;
use Laravel\Mcp\Response;
use Laravel\Mcp\Server\Resource;

class KnowledgeBaseSearchResource extends Resource
{
    protected string $name = 'knowledge-search';

    protected string $title = 'Knowledge Base Search';

    protected string $description = 'Search knowledge base entries by name/des/dess and/or category name with flexible LIKE matching.';

    protected string $uri = 'knowledge://search';

    protected string $mimeType = 'application/json';

    public function handle(\Laravel\Mcp\Request $request): Response
    {
        $raw = json_decode(file_get_contents('php://input'), true);
        $params = $raw['params'] ?? [];
        $arguments = $params['parameters'] ?? [];

        $search1 = $arguments['search1'] ?? null;
        $search2 = $arguments['search2'] ?? null;
        $searchNature = strtolower($arguments['searchnature'] ?? 'entry-fields');
        $searchType = strtoupper($arguments['searchType'] ?? 'OR');

        $query = Baser::with('cat');

        // Case A: only search1
        if ($search1 && empty($search2)) {
            if ($searchNature === 'entry-fields') {
                $query->where(function ($q) use ($search1) {
                    $q->where('name', 'like', "%{$search1}%")
                        ->orWhere('des', 'like', "%{$search1}%")
                        ->orWhere('dess', 'like', "%{$search1}%");
                });
            } elseif ($searchNature === 'category') {
                $query->whereHas('cat', function ($q) use ($search1) {
                    $q->where('name', 'like', "%{$search1}%");
                });
            } elseif ($searchNature === 'both') {
                if ($searchType === 'AND') {
                    $query->where(function ($q) use ($search1) {
                        $q->where('name', 'like', "%{$search1}%")
                            ->orWhere('des', 'like', "%{$search1}%")
                            ->orWhere('dess', 'like', "%{$search1}%");
                    })->whereHas('cat', function ($q) use ($search1) {
                        $q->where('name', 'like', "%{$search1}%");
                    });
                } else {
                    $query->where(function ($q) use ($search1) {
                        $q->where('name', 'like', "%{$search1}%")
                            ->orWhere('des', 'like', "%{$search1}%")
                            ->orWhere('dess', 'like', "%{$search1}%");
                    })->orWhereHas('cat', function ($q) use ($search1) {
                        $q->where('name', 'like', "%{$search1}%");
                    });
                }
            }
        }

        // Case B: search1 + search2
        elseif ($search1 && $search2) {
            if ($searchType === 'AND') {
                $query->where(function ($q) use ($search1) {
                    $q->where('name', 'like', "%{$search1}%")
                        ->orWhere('des', 'like', "%{$search1}%")
                        ->orWhere('dess', 'like', "%{$search1}%");
                })->whereHas('cat', function ($q) use ($search2) {
                    $q->where('name', 'like', "%{$search2}%");
                });
            } else {
                $query->where(function ($q) use ($search1) {
                    $q->where('name', 'like', "%{$search1}%")
                        ->orWhere('des', 'like', "%{$search1}%")
                        ->orWhere('dess', 'like', "%{$search1}%");
                })->orWhereHas('cat', function ($q) use ($search2) {
                    $q->where('name', 'like', "%{$search2}%");
                });
            }
        }

        $entries = $query->get();

        return Response::json($entries->toArray());
    }
}
