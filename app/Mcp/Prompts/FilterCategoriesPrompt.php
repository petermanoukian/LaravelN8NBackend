<?php

namespace App\Mcp\Prompts;

use Illuminate\Support\Facades\Log;
use Laravel\Mcp\Request;
use Laravel\Mcp\Response;
use Laravel\Mcp\Server\Prompt;

class FilterCategoriesPrompt extends Prompt
{
    protected string $name = 'filter-categories';

    protected string $description = 'Interprets natural language and resolves it into a command for filtering categories by department.';

    public function handle(Request $request): Response
    {

        $raw = $request->all();

        Log::info('🔵 FilterCategoriesPrompt RAW ARGUMENTS', [
            'all' => $raw,
        ]);

        $rawInput = $raw['command'] ?? ($raw['arguments']['command'] ?? '');
        Log::info('🔵 FilterCategoriesPrompt PARSED INPUT', [
            'rawInput' => $rawInput,
        ]);

        $commandInput = strtolower(trim($rawInput));

        if ($commandInput === '') {

            Log::warning('⚠️ FilterCategoriesPrompt EMPTY INPUT', [
                'rawInput' => $rawInput,
            ]);

            return Response::json([
                'command' => '',
                'resolved' => '',
                'departments' => [],
                'message' => 'No command provided.',
            ]);
        }

        // 2) Normalize common “all” and “blank” phrases
        $normalized = preg_replace('/[^a-z0-9]+/i', ' ', $commandInput);
        $normalized = trim($normalized);

        // synonym shortcuts
        $shortcuts = [
            'all categories' => 'all',
            'all category' => 'all',
            'all depts' => 'all',
            'all departments' => 'all',
            'everything' => 'all',
            'every category' => 'all',
            'categories all' => 'all',

            'no department' => 'blank',
            'without department' => 'blank',
            'empty department' => 'blank',
            'blank department' => 'blank',
            'categories blank' => 'blank',
        ];

        if (isset($shortcuts[$normalized])) {
            $normalized = $shortcuts[$normalized];
        }

        // 3) Synonym map (case-insensitive match on word boundaries)
        $map = [
            'sales' => ['sales', 'sale', 'sales department', 'sayles', 'seyles', 'sales team', 'sales people', 'items sold'],
            'marketing' => ['marketing', 'market', 'marketting', 'promotions', 'promotion', 'marketin'],
            'hr' => ['hr', 'human resources', 'human resource', 'manpower', 'personnel', 'human relations'],
            'pr' => ['pr', 'public relation', 'public relations', 'external relations', 'customer relations', 'company relations', 'outside relations'],
            '' => ['blank', 'no department', 'without department', 'empty department', 'blank department'],
        ];

        $departments = ['sales', 'marketing', 'hr', 'pr'];
        $selected = [];

        // 4) Detect “all but …” first
        if (preg_match('/\b(all but|everything except)\b/i', $commandInput)) {
            $selected = $departments;

            foreach ($map as $dept => $variants) {
                foreach ($variants as $v) {
                    if (preg_match('/\b'.preg_quote($v, '/').'\b/i', $commandInput)) {
                        if ($dept === '') {
                            // exclude blank: keep all real departments
                            $selected = $departments;
                        } else {
                            $selected = array_values(array_diff($selected, [$dept]));
                        }
                    }
                }
            }

            $resolved = 'all but '.implode(' ', $selected);
        }
        // 5) Handle “all” vs “blank”
        elseif (preg_match('/\b(all|everything)\b/i', $normalized)) {
            $resolved = 'all';
        } elseif (preg_match('/\b(blank|no department|without department|empty department|blank department)\b/i', $normalized)) {
            $resolved = 'blank';
            $selected = ['']; // explicit blank
        }
        // 6) OR selection of specific departments
        else {
            foreach ($map as $dept => $variants) {
                foreach ($variants as $v) {
                    if (preg_match('/\b'.preg_quote($v, '/').'\b/i', $normalized)) {
                        $selected[] = $dept;
                        break;
                    }
                }
            }
            $selected = array_values(array_unique($selected));

            // if only blank matched
            if ($selected === ['']) {
                $resolved = 'blank';
            }
            // if multiple departments matched
            elseif (! empty($selected)) {
                $resolved = implode(' ', array_filter($selected)); // exclude '' in resolved
            }
            // nothing matched
            else {
                $resolved = '';
            }
        }

        Log::info('✅ FilterCategoriesPrompt RETURNING', [
            'command' => $normalized,
            'resolved' => $resolved,
            'departments' => $selected,
        ]);

        return Response::json([
            'command' => $normalized,     // original normalized input
            'resolved' => $resolved,      // hr sales | all | blank | all but hr ...
            'departments' => $selected,   // array of normalized departments ('' = blank)
        ]);
    }
}
