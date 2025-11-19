<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\CatService;
use App\Http\Requests\CatRequest;
use App\Http\Requests\ImageUploadRequest;
use App\Http\Requests\FileUploadRequest;

class CatController extends Controller
{
    public function __construct(
        private CatService $catService
    ) {}

    public function indexPaginated(Request $request)
    {
        $cats = $this->catService->getPaginated(
            perPage: $request->get('perPage', 10),
            fields: ['id', 'name', 'department', 'img', 'img2', 'created_at', 'updated_at'],
            orderBy: $request->get('orderBy', 'id'),
            direction: $request->get('direction', 'desc')
        );

        return response()->json($cats);
    }

    public function indexAll(Request $request)
    {
        $cats = $this->catService->getAll(
            fields: ['id', 'name', 'department', 'img', 'img2', 'filer','created_at', 'updated_at'],
            orderBy: $request->get('orderBy', 'id'),
            direction: $request->get('direction', 'desc')
        );

        return response()->json([
            'count' => $cats->count(),
            'data' => $cats
        ]);
    }


    public function store(CatRequest $catRequest, ImageUploadRequest $imageRequest, FileUploadRequest $fileRequest)
    {
        
        $catRequest->validated();
        $imageRequest->validated();
        $fileRequest->validated();
            
        $result = $this->catService->store($catRequest, $imageRequest, $fileRequest);

        return response()->json([
            'message' => 'Category created successfully',
            'data' => $result
        ]);
    }
}
