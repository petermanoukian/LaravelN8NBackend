<?php

namespace App\Mcp\Resources;

use App\Models\Baser;
use Laravel\Mcp\Server\Resource;
use Laravel\Mcp\Response;
use Illuminate\Support\Facades\Log;

class KnowledgeBaseResource extends Resource
{
    protected string $name = 'knowledge-entries';
    protected string $title = 'Knowledge Base';
    protected string $description = 'Knowledge entries with names, filer, des/dess, catid. Filter by catid if provided.';
    protected string $uri = 'knowledge://entries';
    protected string $mimeType = 'application/json';

    public function handle(\Laravel\Mcp\Request $request): Response
    {
       
       Log::info("MCP RAW REQUEST", [
            'request' => (array) $request,
        ]);

       
        // Get URI and parameters
        /*
        $requestedUri = $request->params['uri'] ?? $this->uri;
        $parameters   = $request->params['parameters'] ?? [];
        */
        $raw = json_decode(file_get_contents('php://input'), true);
        $params = $raw['params'] ?? [];

        $requestedUri = $params['uri'] ?? $this->uri;
        $parameters   = $params['parameters'] ?? [];

        $query = Baser::select('id', 'name', 'filer',  'catid')
            ->with('cat');

        // --- Filtering Logic ---

        // First check explicit parameters
        $catId = $parameters['catid'] ?? null;

        // If not provided, fall back to query string
        if (!$catId) {
            $queryString = parse_url($requestedUri, PHP_URL_QUERY);
            $queryParams = [];
            if ($queryString) {
                parse_str($queryString, $queryParams);
            }
            $catId = $queryParams['catid'] ?? null;
        }

        if ($catId !== null) {
            if (!ctype_digit((string) $catId)) {
                return Response::error("Invalid category ID format. Must be an integer.");
            }
            $query->where('catid', (int) $catId);
        }

        $entries = $query->get();

        // --- End Filtering Logic ---

        // Process filer JSON column into a file_summary array
        $entries->each(function ($entry) {
            $entry->file_summary = is_string($entry->filer) && !empty($entry->filer)
                ? json_decode($entry->filer, true) ?? []
                : [];
            unset($entry->filer);
        });

        return Response::json($entries->toArray());
    }
}
