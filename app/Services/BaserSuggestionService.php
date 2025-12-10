<?php

namespace App\Services;

use App\Models\BaserSuggestion;
use App\Repositories\Contracts\BaserSuggestionRepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

class BaserSuggestionService
{
    protected BaserSuggestionRepositoryInterface $baserSuggestionRepository;

    public function __construct(BaserSuggestionRepositoryInterface $baserSuggestionRepository)
    {
        $this->baserSuggestionRepository = $baserSuggestionRepository;
    }

    public function getAllBaserSuggestions(): Collection
    {
        return $this->baserSuggestionRepository->all();
    }

    public function getBaserSuggestionById(int $id): ?BaserSuggestion
    {
        return $this->baserSuggestionRepository->find($id);
    }

    public function createBaserSuggestion(array $data): BaserSuggestion
    {
        return $this->baserSuggestionRepository->create($data);
    }

    public function updateBaserSuggestion(int $id, array $data): ?BaserSuggestion
    {
        return $this->baserSuggestionRepository->update($id, $data);
    }

    public function deleteBaserSuggestion(int $id): bool
    {
        return $this->baserSuggestionRepository->delete($id);
    }

    public function searchBaserSuggestions(string $query): Collection
    {
        return $this->baserSuggestionRepository->searchByNameOrDescription($query);
    }
}
