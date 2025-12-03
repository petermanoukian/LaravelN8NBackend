<?php

namespace App\Http\Controllers;

use App\Services\CatService;
use App\Http\Requests\ImageUploadRequest;
use App\Http\Requests\FileUploadRequest;
use App\Http\Requests\CatRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Log;

class CatController extends Controller
{
    public function __construct(
        private CatService $catService
    ) 
    {

    }

    public function indexadmin()
    {
        $cats = $this->catService->getPaginated(
            perPage: 25,
            fields: ['id', 'name', 'department', 'img', 'img2', 'filer'],
            orderBy: 'id',
            direction: 'desc',
            withCount: true,     // ✅ include basers_count
            withBasers: true     // ✅ include basers relation
        );

        return view('admin.cats.index', compact('cats'));
    }


    public function indexadminajax()
    {
        $cats = $this->catService->getPaginated(
            perPage: 5,
            page: 1,
            fields: ['id', 'name', 'department', 'img', 'img2', 'filer'],
            orderBy: 'id',
            direction: 'desc'
        );

        return response()->json($cats);
    }





    /**
     * Show the create form
     */
    public function createadmin(?int $catid = null)
    {
        // Call service to get all categories ordered by name ASC
        $categories = $this->catService->getAll(
            fields: ['id', 'name'],
            orderBy: 'name',
            direction: 'asc'
        );

        return view('admin.cats.create', [
            'categories' => $categories,
            'catid'      => $catid,   // pass optional catid to view
        ]);
    }


    public function edit($id)
    {
        // ✅ delegate to service, not directly to Eloquent
        $row = $this->catService->find($id);

        return view('admin.cats.edit', compact('row'));
    }




    /**
     * Store a new category with optional image/file uploads
     */
    public function store(CatRequest $catRequest, ImageUploadRequest $imageRequest, FileUploadRequest $fileRequest)
    {
        try {
            // Delegate to CatService

            $catRequest->validated();
            $imageRequest->validated();
            $fileRequest->validated();


            $result = $this->catService->store($catRequest, $imageRequest, $fileRequest);
            /*
            Log::info('🐱 CatController store success', [
                'cat_id' => $result['cat']->id,
                'image'  => $result['image']['original_name'] ?? null,
                'file'   => $result['file']['original'] ?? null,
            ]);
            */
            
            return redirect()
                ->route('cats.indexadmin')
                ->with('success', 'Category created successfully!');
        } catch (\Throwable $e) {
            Log::error('❌ CatController store failed', [
                'error' => $e->getMessage(),
            ]);

            return back()->withErrors(['error' => 'Failed to create category.']);
        }
    }

    public function update(CatRequest $catRequest, ImageUploadRequest $imageRequest, FileUploadRequest $fileRequest, $id)
    {
        try {
            // ✅ validate all incoming requests
            $catRequest->validated();
            $imageRequest->validated();
            $fileRequest->validated();

            // ✅ delegate to CatService
            $result = $this->catService->update($id, $catRequest, $imageRequest, $fileRequest);

            /*
            Log::info('🐱 CatController update success', [
                'cat_id' => $result['cat']->id,
                'image'  => $result['image']['original_name'] ?? null,
                'file'   => $result['file']['original'] ?? null,
            ]);
            */

            return redirect()
                ->route('cats.indexadmin')
                ->with('success', 'Category updated successfully!');
        } catch (\Throwable $e) {
            Log::error('❌ CatController update failed', [
                'cat_id' => $id,
                'error'  => $e->getMessage(),
            ]);

            return back()->withErrors(['error' => 'Failed to update category.']);
        }
    }


    public function destroy($id)
    {
        try {
            $this->catService->delete($id);

            return redirect()
                ->route('cats.indexadmin')
                ->with('success', 'Category deleted successfully.');
        } catch (\Throwable $e) {
            Log::error('❌ CatController delete failed', [
                'cat_id' => $id,
                'error'  => $e->getMessage(),
            ]);

            return back()->withErrors(['error' => 'Failed to delete category.']);
        }
    }


    
}
