<?php

namespace App\Http\Controllers;

use App\Services\BaserService;
use App\Http\Requests\ImageUploadRequest;
use App\Http\Requests\FileUploadRequest;
use App\Http\Requests\BaserRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;

class BaserController extends Controller
{
    public function __construct(
        private BaserService $baserService
    ) 
    {
    }

    /**
     * List basers in admin view
     */
    public function indexadmin(Request $request, ?int $catid = null)
    {
        $catid = $catid ?? $request->input('catid');

        $data = $this->baserService->getPaginatedWithCategories(
            perPage: 15,
            fields: ['id', 'name', 'catid', 'img', 'img2', 'filer', 'des'],
            orderBy: 'id',
            direction: 'desc',
            catid: $catid
        );

        return view('admin.basers.index', [
            'rows'       => $data['rows'],
            'cats' => $data['categories'],
            'catid'      => $catid,
        ]);
    }


    /**
     * List basers via AJAX
     */
    public function indexadminajax(Request $request, ?int $catid = null)
    {
        $catid = $catid ?? $request->input('catid');

        $data = $this->baserService->getPaginatedWithCategories(
            perPage: 15,
            fields: ['id', 'name', 'catid', 'img', 'img2', 'filer', 'des', 'dess'],
            orderBy: 'id',
            direction: 'desc',
            catid: $catid
        );

        return response()->json($data);
    }


    public function search(Request $request)
    {
        $keyword = $request->input('keyword'); // optional
        $catid   = $request->input('catid');   // optional

        // Get results + categories together
        $data = $this->baserService->search(
            keyword: $keyword ?? '',
            fields: ['name', 'des', 'dess'],
            selectFields: ['id', 'name', 'catid', 'des', 'dess', 'img', 'img2', 'filer'],
            orderBy: 'id',
            direction: 'desc',
            catid: $catid
        );

        if ($request->ajax()) {
            return response()->json($data['results']);
        }

        return view('admin.basers.search', [
            'results'    => $data['results'],
            'categories' => $data['categories'],
            'keyword'    => $keyword,
            'catid'      => $catid,
        ]);
    }






    /**
     * Show the create form
     */
    public function createadmin(Request $request, ?int $catid = null)
    {
        $catid = $catid ?? $request->input('catid');

        $data = $this->baserService->create($catid);

        return view('admin.basers.create', [
            'categories' => $data['categories'],
            'catid'      => $data['catid'],
        ]);
    }




    /**
     * Store a new baser with optional image/file uploads
     */
    public function store(BaserRequest $baserRequest, ImageUploadRequest $imageRequest, FileUploadRequest $fileRequest)
    {
        try {
            $baserRequest->validated();
            $imageRequest->validated();
            $fileRequest->validated();

            $result = $this->baserService->store($baserRequest, $imageRequest, $fileRequest);

            return redirect()
                ->route('basers.indexadmin')
                ->with('success', 'Knowledge base entry created successfully!');
        } catch (\Throwable $e) {
            Log::error('❌ BaserController store failed', [
                'error' => $e->getMessage(),
            ]);

            return back()->withErrors(['error' => 'Failed to create knowledge base entry.']);
        }
    }

    /**
     * Show edit form
     */
    public function edit(int $id)
    {
        $data = $this->baserService->edit($id);
        if (!$data) {
            return redirect()->route('basers.indexadmin')->withErrors(['error' => 'Entry not found.']);
        }

        return view('admin.basers.edit', [
            'baser'      => $data['baser'],
            'categories' => $data['categories'],
        ]);
    }


    /**
     * Update an existing baser
     */
    public function update(int $id, BaserRequest $baserRequest, ImageUploadRequest $imageRequest, FileUploadRequest $fileRequest)
    {
        try {
            $baserRequest->validated();
            $imageRequest->validated();
            $fileRequest->validated();

            $result = $this->baserService->update($id, $baserRequest, $imageRequest, $fileRequest);

            return redirect()
                ->route('basers.indexadmin')
                ->with('success', 'Knowledge base entry updated successfully!');
        } catch (\Throwable $e) {
            Log::error('❌ BaserController update failed', [
                'error' => $e->getMessage(),
            ]);

            return back()->withErrors(['error' => 'Failed to update knowledge base entry.']);
        }
    }

    /**
     * Delete a single baser
     */
    public function delete(int $id)
    {
        try {
            $this->baserService->delete($id);

            return redirect()
                ->route('basers.indexadmin')
                ->with('success', 'Knowledge base entry deleted successfully!');
        } catch (\Throwable $e) {
            Log::error('❌ BaserController delete failed', [
                'error' => $e->getMessage(),
            ]);

            return back()->withErrors(['error' => 'Failed to delete knowledge base entry.']);
        }
    }

    /**
     * Bulk delete basers
     */


    public function deleteAll(Request $request)
    {
        $ids = $request->input('ids', []);
        try {
            $this->baserService->deleteMany($ids);
            return redirect()->route('basers.indexadmin')
                ->with('success', 'Selected knowledge base entries deleted successfully!');
        } catch (\Throwable $e) {
            Log::error('❌ BaserController deleteAll failed', ['error' => $e->getMessage()]);
            return back()->withErrors(['error' => 'Failed to delete selected entries.']);
        }
    }




}
