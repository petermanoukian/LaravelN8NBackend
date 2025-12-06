<?php

namespace App\Services;

use App\Http\Requests\BaserRequest;
use App\Http\Requests\ImageUploadRequest;
use App\Http\Requests\FileUploadRequest;
use App\Repositories\Contracts\BaserRepositoryInterface;
use App\Repositories\Contracts\CatRepositoryInterface;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Log;
use App\Services\ImageUploadService;
use App\Services\FileUploaderService;

class BaserService
{
    public function __construct(
        private BaserRepositoryInterface $baserRepository,
            private CatRepositoryInterface $catRepository,  
        private ImageUploadService $imageUploadService,
        private FileUploaderService $fileUploaderService
    ) {
    }

    public function getAll(
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc'
    ) {
        return $this->baserRepository->all($fields, $orderBy, $direction);
    }

    public function getConditioned(
        array $conditions = [],
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc'
    ) {
        return $this->baserRepository->conditioned($conditions, $fields, $orderBy, $direction);
    }

    public function getPaginated(
        int $perPage = 15,
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc',
        ?int $catid = null
    ) {
        $conditions = [];

        if ($catid) {
            $conditions['catid'] = $catid;
        }

        return $this->baserRepository->paginateConditioned(
            conditions: $conditions,
            perPage: $perPage,
            fields: $fields,
            orderBy: $orderBy,
            direction: $direction
        );
    }

    public function getPaginatedWithCategories(
        int $perPage = 15,
        array $fields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc',
        ?int $catid = null
    ): array {
        $conditions = [];

        if ($catid) {
            $conditions['catid'] = $catid;
        }

        // Basers with optional category filter
        $rows = $this->baserRepository->paginateConditioned(
            conditions: $conditions,
            perPage: $perPage,
            fields: $fields,
            orderBy: $orderBy,
            direction: $direction
        );

        // All categories for dropdown
        $categories = $this->catRepository->all(['id', 'name'], 'name', 'asc');

        return [
            'rows'       => $rows,
            'categories' => $categories,
        ];
    }


    

    /**
     * Search basers by keyword across name, des, dess, optionally filtered by catid.
     */
    public function search(
        string $keyword = '',
        array $fields = ['name', 'des', 'dess'],
        array $selectFields = ['*'],
        string $orderBy = 'id',
        string $direction = 'desc',
        ?int $catid = null
    ): array {
        $results = $this->baserRepository->search(
            $keyword,
            $fields,
            $selectFields,
            $orderBy,
            $direction,
            $catid
        );

        $categories = $this->catRepository->all(['id', 'name'], 'name', 'asc');

        return [
            'results'    => $results,
            'categories' => $categories,
        ];
    }




    public function store(
        BaserRequest $baserRequest,
        ImageUploadRequest $imageRequest,
        FileUploadRequest $fileRequest
    ): array {
        // Extract required fields
        $data = [
            'name' => $baserRequest->input('name'),
            'des'  => $baserRequest->input('des'),
            'dess' => $baserRequest->input('dess'),
            'catid' => $baserRequest->input('catid'),
        ];
        $name = $data['name'];

        // Create baser via repo
        $baser = $this->baserRepository->create($data);

        $imageResult = null;
        $fileResult  = null;

        $basePhysicalPath = Config::get('path.physical_directory');

        // Optional image upload
        if ($imageRequest->hasFile('img')) {
            $imageResult = $this->imageUploadService->upload(
                $imageRequest,
                'img',
                'uploads/img/base',
                'uploads/img/base/thumb',
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
                $name // baser name as baseFileName
            );

            if ($imageResult) {
                $this->baserRepository->update($baser->id, [
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
                'uploads/files/base',
                $name, // baser name as baseFileName
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
                    'text/csv',        
                    'application/csv', 
                    'application/vnd.ms-powerpoint',
                    'application/vnd.openxmlformats-officedocument.presentationml.presentation',
                ],
                9120
            );

            if ($fileResult) {
                $this->baserRepository->update($baser->id, [
                    'filer' => $fileResult['path'],
                ]);
            }
        }

        return [
            'baser' => $baser,
            'image' => $imageResult,
            'file'  => $fileResult,
        ];
    }

    public function create(?int $catid = null): array
    {
        $categories = $this->catRepository->all(['id', 'name'], 'name', 'asc');

        return compact('categories', 'catid');
    }



    public function edit(int $id): ?array
    {
        $baser = $this->baserRepository->findById($id);
        if (!$baser) {
            return null;
        }

        $categories = $this->catRepository->all(['id', 'name'], 'name', 'asc');

        return compact('baser', 'categories');
    }


    public function update(
        int $id,
        BaserRequest $baserRequest,
        ImageUploadRequest $imageRequest,
        FileUploadRequest $fileRequest
    ): array {
        // Extract fields to update
        $data = [
            'name' => $baserRequest->input('name'),
            'des'  => $baserRequest->input('des'),
            'dess' => $baserRequest->input('dess'),
            'catid'  => $baserRequest->input('catid')
        ];
        $name = $data['name'];

        // Update baser via repo
        $this->baserRepository->update($id, $data);
        $baser = $this->baserRepository->findById($id);

        $imageResult = null;
        $fileResult  = null;

        $basePhysicalPath = Config::get('path.physical_directory');

        // Optional image upload
        if ($imageRequest->hasFile('img')) {
            $imageResult = $this->imageUploadService->upload(
                $imageRequest,
                'img',
                'uploads/img/base',
                'uploads/img/base/thumb',
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
                $name // baser name as baseFileName
            );

            if ($imageResult) {
                $this->baserRepository->update($baser->id, [
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
                'uploads/files/base',
                $name, // baser name as baseFileName
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
                    'text/csv',        
                    'application/csv', 
                    'application/vnd.ms-powerpoint',
                    'application/vnd.openxmlformats-officedocument.presentationml.presentation',
                ],
                9120
            );

            if ($fileResult) {
                $this->baserRepository->update($baser->id, [
                    'filer' => $fileResult['path'],
                ]);
            }
        }

        return [
            'baser' => $baser,
            'image' => $imageResult,
            'file'  => $fileResult,
        ];
    }


    public function delete(int $id): bool
    {
        return $this->baserRepository->delete($id);
    }

    public function deleteMany(array $ids): int
    {
        return $this->baserRepository->deleteMany($ids);
    }



}
