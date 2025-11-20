<?php

namespace App\Services;

use App\Http\Requests\CatRequest;
use App\Http\Requests\ImageUploadRequest;
use App\Http\Requests\FileUploadRequest;
use App\Repositories\Contracts\CatRepositoryInterface;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Log;
use App\Events\CategoryCreated;

class CatService
{
    public function __construct(
        private CatRepositoryInterface $catRepository,
        private ImageUploadService $imageUploadService,
        private FileUploaderService $fileUploaderService
    ) {
    }

    public function getAll(
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc'
    ) 
    {
        return $this->catRepository->all($fields, $orderBy, $direction);
    }

    public function getPaginated(
        int $perPage = 15,
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc'
    ) {
        return $this->catRepository->paginate($perPage, $fields, $orderBy, $direction);
    }


    public function store(
        CatRequest $catRequest,
        ImageUploadRequest $imageRequest,
        FileUploadRequest $fileRequest
    ): array {
        // Extract required fields
        $data = [
            'name'       => $catRequest->input('name'),
            'department' => $catRequest->input('department'),
        ];
        $name = $data['name'];

        // Create category via repo
        $cat = $this->catRepository->create($data);
        //Log::info('Category stored', ['cat_id' => $cat->id, 'name' => $name]);

        $imageResult = null;
        $fileResult  = null;

        $basePhysicalPath = Config::get('path.physical_directory');

        // Optional image upload
        if ($imageRequest->hasFile('img')) {
            $imageResult = $this->imageUploadService->upload(
                $imageRequest,
                'img',
                'uploads/img/cat',
                'uploads/img/cat/thumb',
                1500,
                1000,
                [
                        'image/jpeg',
                        'image/gif',
                        'image/webp',
                        'image/png',
                        'image/tiff',
                    ],
                9920,
                $name // category name as baseFileName
            );

            if ($imageResult) {
                $this->catRepository->update($cat->id, [
                    'img'  => $imageResult['large'],
                    'img2' => $imageResult['small'],
                ]);
            }
        }

        // Optional file upload
        if ($fileRequest->hasFile('filer')) {
            $randomSuffix = time().'_'.uniqid();
            $fileResult = $this->fileUploaderService->upload(
                $fileRequest,
                'filer',
                'uploads/files/cat',
                $name, // category name as baseFileName
                $randomSuffix,
                [
                'text/plain',
                'application/pdf',
                'image/jpeg',
                'image/gif',
                'image/webp',
                'image/png',
                'image/tiff',
                'application/msword', 
                'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
                'application/vnd.ms-excel', 
                'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 
                'application/json', 
                'application/vnd.ms-powerpoint',
                'application/vnd.openxmlformats-officedocument.presentationml.presentation',
                ],
                9120
            );

            if ($fileResult) {
                $this->catRepository->update($cat->id, [
                    'filer' => $fileResult['path'],
                ]);
            }
        }

        event(new CategoryCreated($cat));
        return [
            'cat'   => $cat,
            'image' => $imageResult,
            'file'  => $fileResult,
        ];
    }
}
