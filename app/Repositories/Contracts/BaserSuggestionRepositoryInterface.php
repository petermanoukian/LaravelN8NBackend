<?php

namespace App\Repositories\Contracts;

use App\Models\BaserSuggestion;
use Illuminate\Database\Eloquent\Collection;

interface BaserSuggestionRepositoryInterface
{
    public function all(): Collection;

    public function find(int $id): ?BaserSuggestion;

    public function findBySheetId(?int $sheetId): ?BaserSuggestion;

    public function existsBySheetId(?int $sheetId): bool;

    public function create(array $data): BaserSuggestion;

    public function update(int $id, array $data): ?BaserSuggestion;

    public function delete(int $id): bool;

    public function searchByNameOrDescription(string $query): Collection;
}
