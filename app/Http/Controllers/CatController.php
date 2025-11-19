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
            perPage: 5,
            fields: ['id', 'name', 'department', 'img', 'img2', 'filer'],
            orderBy: 'id',
            direction: 'desc'
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
    public function createadmin()
    {
        return view('admin.cats.create');
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

            Log::info('🐱 CatController store success', [
                'cat_id' => $result['cat']->id,
                'image'  => $result['image']['original_name'] ?? null,
                'file'   => $result['file']['original'] ?? null,
            ]);

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
}
