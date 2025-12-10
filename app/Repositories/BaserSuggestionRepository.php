<?php

namespace App\Repositories;

use App\Models\BaserSuggestion;
use App\Repositories\Contracts\BaserSuggestionRepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

class BaserSuggestionRepository implements BaserSuggestionRepositoryInterface
{
    public function all(): Collection
    {
        return BaserSuggestion::all();
    }

    public function find(int $id): ?BaserSuggestion
    {
        return BaserSuggestion::find($id);
    }

    public function findBySheetId(?int $sheetId): ?BaserSuggestion
    {
        if (!$sheetId) {
            return null;
        }
        return BaserSuggestion::where('sheetid', $sheetId)->first();
    }

    public function existsBySheetId(?int $sheetId): bool
    {
        if (!$sheetId) {
            return false;  // Nullable: No check if null
        }
        return BaserSuggestion::where('sheetid', $sheetId)->exists();
    }

    public function create(array $data): BaserSuggestion
    {
        return BaserSuggestion::create($data);
    }

    public function update(int $id, array $data): ?BaserSuggestion
    {
        $baserSuggestion = $this->find($id);
        if ($baserSuggestion) {
            $baserSuggestion->update($data);

            return $baserSuggestion;
        }

        return null;
    }

    public function delete(int $id): bool
    {
        $baserSuggestion = $this->find($id);
        if ($baserSuggestion) {
            return $baserSuggestion->delete();
        }

        return false;
    }

    public function searchByNameOrDescription(string $query): Collection
    {
        return BaserSuggestion::where('name', 'LIKE', '%'.$query.'%')
            ->orWhere('des', 'LIKE', '%'.$query.'%')
            ->get();
    }
}
