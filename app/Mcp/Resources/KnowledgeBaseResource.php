<?php

namespace App\Mcp\Resources;

use App\Models\Baser;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use Laravel\Mcp\Request;
use Laravel\Mcp\Response;
use Laravel\Mcp\Server\Resource;

class KnowledgeBaseResource extends Resource
{
    protected string $name = 'knowledge-entries';

    protected string $title = 'Knowledge Base';

    protected string $description = 'Knowledge entries with names, filer, des/dess, catid. Filter by catid if provided.';

    protected string $uri = 'knowledge://knowledge-entries';

    protected string $mimeType = 'application/json';

    public function handle(Request $request): Response
    {

        Log::info('MCP RAW REQUEST', [
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
        $parameters = $params['parameters'] ?? [];

        $query = Baser::select('id', 'name', 'filer', 'img', 'catid', 'des', 'dess', 'created_at')
            ->with('cat');

        // --- Filtering Logic ---

        // First check explicit parameters
        $catId = $parameters['catid'] ?? null;

        // If not provided, fall back to query string
        if (! $catId) {
            $queryString = parse_url($requestedUri, PHP_URL_QUERY);
            $queryParams = [];
            if ($queryString) {
                parse_str($queryString, $queryParams);
            }
            $catId = $queryParams['catid'] ?? null;
        }

        if ($catId !== null) {
            if (! ctype_digit((string) $catId)) {
                return Response::error('Invalid category ID format. Must be an integer.');
            }
            $query->where('catid', (int) $catId);
        }

        $entries = $query->get();

        // --- End Filtering Logic ---

        // Process filer JSON column into a file_summary array

        return Response::json([
            'count' => $entries->count(),
            'contents' => [
                [
                    'text' => $entries->map(function ($entry) {
                        return [
                            'id' => $entry->id,
                            'name' => $entry->name,
                            'catid' => $entry->catid,
                            'des' => $entry->des,
                            'dess' => $entry->dess,
                            'knowledgebasefile' => $entry->filer,
                            'knowledgebaseimg' => $entry->img,
                            'dater' => $entry->created_at
                            ? Carbon::parse($entry->created_at)->format('d F Y H:i')
                            : null,
                            'cat' => $entry->cat ? [
                                'id' => $entry->cat->id,
                                'name' => $entry->cat->name,
                                'department' => $entry->cat->department,
                                'categoryfile' => $entry->cat->filer,
                            ] : null,
                        ];
                    })->values()->toJson(JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE),
                ],
            ],
        ]);

    }
}
