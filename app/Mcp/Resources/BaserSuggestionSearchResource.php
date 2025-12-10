<?php

namespace App\Mcp\Resources;

use App\Repositories\Contracts\BaserSuggestionRepositoryInterface;
use OPGG\LaravelMcpServer\Services\ResourceService\Resource;

class BaserSuggestionSearchResource extends Resource
{
    public string $uri = 'database://baser_suggestions';

    public string $name = 'Baser Suggestions';

    public ?string $description = 'Provides access to all Baser suggestions in the database.';

    public ?string $mimeType = 'application/json';

    public function __construct(
        protected BaserSuggestionRepositoryInterface $baserSuggestionRepository
    ) {}

    public function read(): array
    {
        try {
            $suggestions = $this->baserSuggestionRepository->all();

            return [
                'uri' => $this->uri,
                'mimeType' => $this->mimeType,
                'text' => $suggestions->toJson(JSON_PRETTY_PRINT),
            ];
        } catch (\Exception $e) {
            throw new \RuntimeException(
                "Failed to read resource {$this->uri}: ".$e->getMessage()
            );
        }
    }
}
