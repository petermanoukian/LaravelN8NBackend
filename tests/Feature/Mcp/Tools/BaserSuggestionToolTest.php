<?php

namespace Tests\Feature\Mcp\Tools;

use App\Models\Baser;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use Laravel\Mcp\Facades\Mcp;
use App\Mcp\Tools\BaserSuggestionTool;

class BaserSuggestionToolTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_create_baser_suggestion(): void
    {
        $user = User::factory()->create();
        $baser = Baser::factory()->create();

        Mcp::fake([
            BaserSuggestionTool::class,
        ]);

        $response = Mcp::prompt('test', [
            'tool' => 'manage-baser-suggestions',
            'arguments' => [
                'action' => 'create',
                'baser_id' => $baser->id,
                'name' => 'Test Suggestion',
                'des' => 'Test Description',
            ],
        ]);

        $response->assertSuccessful();
    }
}
