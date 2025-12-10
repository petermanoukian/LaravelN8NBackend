<?php

namespace App\Mcp\Tools;

use App\Repositories\Contracts\BaserSuggestionRepositoryInterface;
use App\Repositories\Contracts\BaserRepositoryInterface;

use Illuminate\Support\Facades\Validator;
use Laravel\Mcp\Request;
use Laravel\Mcp\Response;
use Laravel\Mcp\Server\Tool;
Use Illuminate\Support\Facades\Log;

class BaserSuggestionTool extends Tool
{
    protected string $name = 'manage-baser-suggestions';

    protected string $description = 'Manages Baser suggestions, including creating new suggestions, updating existing ones, and deleting them. Requires an "action" parameter to specify the operation.';

    public function __construct(
        protected BaserSuggestionRepositoryInterface $baserSuggestionRepository,
        protected BaserRepositoryInterface $baserRepository
    ) {}

// In App\Mcp\Tools\BaserSuggestionTool.php

    public function handle(Request $request): Response
    {
        // --- 1. LOGGING THE RAW INCOMING DATA ---
        $raw = json_decode(file_get_contents('php://input'), true);
        
        // Log the request and the raw data received from n8n
        \Log::info('BaserSuggestionTool: Incoming Request Log', [
            'uri' => 'mcp-tool-call',
            'raw_body' => $raw,
        ]);
        // ----------------------------------------
        
        // --- 2. ADJUSTING PARSING FOR FLAT N8N PAYLOAD ---
        // N8N is sending the arguments directly, not nested under 'params' and 'arguments'.
        //$arguments = $raw; 
        $arguments = $raw['params']['arguments'] ?? $raw ?? [];
        
        // Since the action is no longer in the payload, we must default it here.
        $action = $arguments['action'] ?? 'create';
        // ----------------------------------------------------

        switch ($action) {
            case 'create':
                // Log that we are attempting creation with the arguments
                \Log::info('BaserSuggestionTool: Attempting creation.', ['arguments' => $arguments]);
                return $this->_createBaserSuggestion($arguments);

            case 'upsert':
                // Log that we are attempting upsert with the arguments
                \Log::info('BaserSuggestionTool: Attempting upsert.', ['arguments' => $arguments]);
                return $this->_upsertBaserSuggestion($arguments);
                
            // The update and delete actions are not supported with this flat payload structure,
            // so we'll leave them as-is, but they would fail due to missing 'id'.
            case 'update':
                return $this->_updateBaserSuggestion($arguments);
            case 'delete':
                return $this->_deleteBaserSuggestion($arguments);
                
            default:
                return Response::error('Internal Error: Action should be defaulted to "create".');
        }
    }

   // In App\Mcp\Tools\BaserSuggestionTool.php



    protected function _upsertBaserSuggestion(array $arguments): Response
    {
        // 1. LOG: Capture the arguments received for this upsert attempt
        \Log::info('BaserSuggestionTool: Starting _upsertBaserSuggestion', ['arguments' => $arguments]);

        // Extract sheetid—required for upsert
        $sheetId = $arguments['sheetid'] ?? $arguments['SuggestionID'] ?? null;
        if (!$sheetId) {
            // Silent exit if no sheetid (as per requirement)
            \Log::warning('BaserSuggestionTool: No sheetid provided for upsert, exiting silently.');
            return Response::json([
                'success' => false,
                'message' => 'No sheetid provided, operation skipped.',
                'skipped' => true,
            ]);
        }

        // Accept either baser_id or knowledge base name
        $knowledgeBaseName = $arguments['knowledge_base_name'] ?? $arguments['KnowledgeBase'] ?? null;
        $baserId = $arguments['baser_id'] ?? null;

        if (!$baserId && $knowledgeBaseName) {
            
            // 2. LOG: Capture the database lookup attempt
            \Log::debug('BaserSuggestionTool: Looking up baser by name for upsert.', ['name' => $knowledgeBaseName]);
            
            // **Tolerance Check 1: Find Baser by Name**
            $baser = $this->baserRepository->findByNameLike($knowledgeBaseName);  // Direct, no limit

            if (!$baser) {
                // 3. LOG: Capture the graceful skip (no baser found)
                \Log::warning('BaserSuggestionTool: Baser not found for upsert, skipping suggestion.', ['name' => $knowledgeBaseName]);
                
                return Response::json([
                    'success' => false,
                    'message' => 'No matching baser found, suggestion skipped.',
                    'skipped' => true,
                    'knowledge_base_name' => $knowledgeBaseName,
                ]);
            }
            $baserId = $baser->id;
            
            \Log::debug('BaserSuggestionTool: Baser found for upsert.', ['baser_id' => $baserId]);
        }

        // **Tolerance Check 2: Missing baser_id after lookup**
        if (!$baserId) {
            // 4. LOG: Capture the silent skip (no baser ID provided)
            \Log::warning('BaserSuggestionTool: No baser_id provided after lookup for upsert, skipping silently.');
            
            return Response::json([
                'success' => false,
                'message' => 'No baser_id provided, suggestion skipped.',
                'skipped' => true,
            ]);
        }

        // Build payload
        $payload = [
            'baser_id'  => $baserId,
            'sheetid'   => $sheetId,  // Required, from arguments
            'name'      => $arguments['name'] ?? $arguments['Suggestion'] ?? null,
            'des'       => $arguments['des']  ?? $arguments['Details']    ?? null,
            'published' => $arguments['published'] ?? 'NO', // default to 'NO'
        ];

        // Paranoid check: if request comes from n8n domain, force published = 'NO'
        $origin = request()->header('Origin') ?? request()->header('Referer') ?? request()->getHost();
        $n8nDomain = config('app.n8n_domain'); // load from .env

        if ($origin && str_contains($origin, $n8nDomain)) {
            $payload['published'] = 'NO';
        }

        $validator = Validator::make($payload, [
            'baser_id'  => ['required', 'integer', 'exists:basers,id'],
            'sheetid'   => ['required', 'integer'],  // FIXED: Required for upsert, not nullable
            'name'      => ['required', 'string', 'max:255'],
            'des'       => ['required', 'string'],
            'published' => ['in:YES,NO'], // ✅ enum validation
        ]);
        
        // 5. LOG: Before validation
        \Log::debug('BaserSuggestionTool: Attempting validation for upsert.', ['payload' => $payload]);

        if ($validator->fails()) {
            // 6. LOG: Validation failure
            \Log::error('BaserSuggestionTool: Validation failed for upsert.', ['errors' => $validator->errors()->all()]);
            
            // This returns a non-JSON Response::error() in MCP tools, which is why we must log the raw error.
            return Response::error('Validation failed for upsert: '.$validator->errors()->first());
        }

        try {
            $data = $validator->validated();
            
            // 7. LOG: Final upsert attempt
            \Log::info('BaserSuggestionTool: Final upsert attempt.', ['data' => $data]);

            // Check if sheetid exists
            $existing = $this->baserSuggestionRepository->findBySheetId($data['sheetid']);  // Assume you add findBySheetId to repo

            if ($existing) {
                // Update existing
                \Log::info('BaserSuggestionTool: Updating existing suggestion.', ['sheetid' => $data['sheetid'], 'id' => $existing->id]);
                $suggestion = $this->baserSuggestionRepository->update($existing->id, $data);

                return Response::json([
                    'success' => true,
                    'message' => 'Baser suggestion updated successfully.',
                    'baser_suggestion' => $suggestion->toArray(),
                    'action_taken' => 'updated',
                ]);
            } else {
                // Insert new
                \Log::info('BaserSuggestionTool: Inserting new suggestion.', ['sheetid' => $data['sheetid']]);
                $suggestion = $this->baserSuggestionRepository->create($data);

                return Response::json([
                    'success' => true,
                    'message' => 'Baser suggestion created successfully.',
                    'baser_suggestion' => $suggestion->toArray(),
                    'action_taken' => 'created',
                ]);
            }
        } catch (\Exception $e) {
            // 8. LOG: General exception error
            \Log::error('BaserSuggestionTool: Failed to upsert Baser suggestion (Exception).', [
                'error' => $e->getMessage(), 
                'trace' => $e->getTraceAsString(),
                'payload' => $payload
            ]);
            
            // This returns a non-JSON Response::error() in MCP tools, which is why we must log the raw error.
            return Response::error('Failed to upsert Baser suggestion: '.$e->getMessage());
        }
    }







    protected function _createBaserSuggestion(array $arguments): Response
    {
        // 1. LOG: Capture the arguments received for this creation attempt
        \Log::info('BaserSuggestionTool: Starting _createBaserSuggestion', ['arguments' => $arguments]);

        // Accept either baser_id or knowledge base name
        $knowledgeBaseName = $arguments['knowledge_base_name'] ?? $arguments['KnowledgeBase'] ?? null;
        $baserId = $arguments['baser_id'] ?? null;

        if (!$baserId && $knowledgeBaseName) {
            
            // 2. LOG: Capture the database lookup attempt
            \Log::debug('BaserSuggestionTool: Looking up baser by name.', ['name' => $knowledgeBaseName]);
            
            // **Tolerance Check 1: Find Baser by Name**
            $baser = $this->baserRepository->findByNameLike($knowledgeBaseName);  // Direct, no limit


            $baserId = $baser->id ?? null;
            \Log::debug('BaserSuggestionTool: Baser found via first match.', ['baser_id' => $baserId]);
            
            if (!$baser) {
                // 3. LOG: Capture the graceful skip (no baser found)
                \Log::warning('BaserSuggestionTool: Baser not found, skipping suggestion.', ['name' => $knowledgeBaseName]);
                
                return Response::json([
                    'success' => false,
                    'message' => 'No matching baser found, suggestion skipped.',
                    'skipped' => true,
                    'knowledge_base_name' => $knowledgeBaseName,
                ]);
            }
            $baserId = $baser->id;
            
            \Log::debug('BaserSuggestionTool: Baser found.', ['baser_id' => $baserId]);
        }

        // **Tolerance Check 2: Missing baser_id after lookup**
        if (!$baserId) {
            // 4. LOG: Capture the silent skip (no baser ID provided)
            \Log::warning('BaserSuggestionTool: No baser_id provided after lookup, skipping silently.');
            
            return Response::json([
                'success' => false,
                'message' => 'No baser_id provided, suggestion skipped.',
                'skipped' => true,
            ]);
        }

        // Build payload
        $payload = [
            'baser_id'  => $baserId,
            'sheetid'      => $arguments['SuggestionID'] ??  null,
            'name'      => $arguments['name'] ?? $arguments['Suggestion'] ?? null,
            'des'       => $arguments['des']  ?? $arguments['Details']    ?? null,
            'published' => $arguments['published'] ?? 'NO', // default to 'NO'
        ];

        // Paranoid check: if request comes from n8n domain, force published = 'NO'
        $origin = request()->header('Origin') ?? request()->header('Referer') ?? request()->getHost();
        $n8nDomain = config('app.n8n_domain'); // load from .env

        if ($origin && str_contains($origin, $n8nDomain)) {
            $payload['published'] = 'NO';
        }

        $validator = Validator::make($payload, [
            'baser_id'  => ['required', 'integer', 'exists:basers,id'],
            'sheetid'   => ['nullable', 'integer'],
            'name'      => ['required', 'string', 'max:255'],
            'des'       => ['required', 'string'],
            'published' => ['in:YES,NO'], // ✅ enum validation
        ]);
        
        // 5. LOG: Before validation
        \Log::debug('BaserSuggestionTool: Attempting validation.', ['payload' => $payload]);

        if ($validator->fails()) {
            // 6. LOG: Validation failure
            \Log::error('BaserSuggestionTool: Validation failed.', ['errors' => $validator->errors()->all()]);
            
            // This returns a non-JSON Response::error() in MCP tools, which is why we must log the raw error.
            return Response::error('Validation failed for create: '.$validator->errors()->first());
        }

        try {
            $data = $validator->validated();
            
            // 7. LOG: Final creation attempt
            \Log::info('BaserSuggestionTool: Final creation attempt.', ['data' => $data]);

            if (isset($data['sheetid']) && $data['sheetid'] !== null && $this->baserSuggestionRepository->existsBySheetId($data['sheetid'])) {
                \Log::warning('BaserSuggestionTool: Duplicate sheetid detected, skipping.', ['sheetid' => $data['sheetid']]);
                return Response::json([
                    'success' => false,
                    'message' => 'Suggestion with this sheetid already exists.',
                    'skipped' => true,
                    'sheetid' => $data['sheetid'],
                ]);
            }
            \Log::info('BaserSuggestionTool: Final creation attempt.', ['data' => $data]);
            
            $suggestion = $this->baserSuggestionRepository->create($data);

            return Response::json([
                'success' => true,
                'message' => 'Baser suggestion created successfully.',
                'baser_suggestion' => $suggestion->toArray(),
            ]);
        } catch (\Exception $e) {
            // 8. LOG: General exception error
            \Log::error('BaserSuggestionTool: Failed to create Baser suggestion (Exception).', [
                'error' => $e->getMessage(), 
                'trace' => $e->getTraceAsString(),
                'payload' => $payload
            ]);
            
            // This returns a non-JSON Response::error() in MCP tools, which is why we must log the raw error.
            return Response::error('Failed to create Baser suggestion: '.$e->getMessage());
        }
    }

    protected function _updateBaserSuggestion(array $arguments): Response
    {
        $validator = Validator::make($arguments, [
            'id' => ['required', 'integer', 'exists:baser_suggestions,id'],
            'baser_id' => ['sometimes', 'integer', 'exists:basers,id'],
            'name' => ['sometimes', 'string', 'max:255'],
            'des' => ['sometimes', 'string'],
            'published' => ['sometimes', 'boolean'],
        ]);

        if ($validator->fails()) {
            return Response::error('Validation failed for update: '.$validator->errors()->first());
        }

        try {
            $id = $arguments['id'];
            $data = $validator->validated();
            unset($data['id']); // Don't try to update the ID

            $suggestion = $this->baserSuggestionRepository->update($id, $data);

            if (! $suggestion) {
                return Response::error('Baser suggestion not found for update.');
            }

            return Response::json([
                'success' => true,
                'message' => 'Baser suggestion updated successfully.',
                'baser_suggestion' => $suggestion->toArray(),
            ]);
        } catch (\Exception $e) {
            \Log::error('Failed to update Baser suggestion', ['error' => $e->getMessage()]);
            return Response::error('Failed to update Baser suggestion: '.$e->getMessage());
        }
    }

    protected function _deleteBaserSuggestion(array $arguments): Response
    {
        $validator = Validator::make($arguments, [
            'id' => ['required', 'integer', 'exists:baser_suggestions,id'],
        ]);

        if ($validator->fails()) {
            return Response::error('Validation failed for delete: '.$validator->errors()->first());
        }

        try {
            $id = $arguments['id'];
            $deleted = $this->baserSuggestionRepository->delete($id);

            if (! $deleted) {
                return Response::error('Baser suggestion not found for deletion.');
            }

            return Response::json([
                'success' => true,
                'message' => 'Baser suggestion deleted successfully.',
                'id' => $id,
            ]);
        } catch (\Exception $e) {
            \Log::error('Failed to delete Baser suggestion', ['error' => $e->getMessage()]);
            return Response::error('Failed to delete Baser suggestion: '.$e->getMessage());
        }
    }
}
