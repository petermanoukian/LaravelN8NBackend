<?php

namespace App\Services;

use App\Http\Requests\FileUploadRequest;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\UploadedFile;

class FileUploaderService
{

    public function upload(
        FileUploadRequest $request,
        string $inputName,
        string $folder,
        string $baseFileName,
        string $randomSuffix,
        array $allowedMimeTypes = [
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
        int $maxFileSize = 9920
    ): ?array 
    {
        $request->merge([
            'allowedMimeTypes' => $allowedMimeTypes,
            'maxFileSize'      => $maxFileSize,
        ]);

        // ✅ enforce validation before moving the file
        try {
            $request->validate($request->rules());
            Log::info('✅ Validation passed for input "' . $inputName . '"', [
                'rules' => $request->rules(),
                'mime'  => $request->file($inputName)?->getMimeType(),
            ]);
        } catch (\Illuminate\Validation\ValidationException $e) {
            Log::error('❌ Validation failed for input "' . $inputName . '"', [
                'errors' => $e->errors(),
                'mime'   => $request->file($inputName)?->getMimeType(),
            ]);
            throw $e; // stop execution, don’t move the file
        }

        Log::info('📥 FileUploadService triggered');

        if (!$request->hasFile($inputName)) {
            Log::warning('🚫 No file received under "' . $inputName . '"');
            return null;
        }

        /** @var UploadedFile $file */
        $file = $request->file($inputName);
        Log::info('📄 File received', [
            'originalName' => $file->getClientOriginalName(),
            'mimeType'     => $file->getMimeType(),
            'extension'    => $file->getClientOriginalExtension(),
        ]);

        $extension = strtolower($file->getClientOriginalExtension());

        // Guarantee baseFileName is never empty
        if (empty($baseFileName)) {
            $baseFileName = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
        }
        $baseFileName = str_replace(' ', '-', $baseFileName);

        // Build final filename
        $fileName = $baseFileName . '_' . $randomSuffix . '.' . $extension;
        Log::info('📝 Final file name built', ['fileName' => $fileName]);

        $relativePath = "{$folder}/{$fileName}";

        if (!file_exists(public_path($folder))) {
            mkdir(public_path($folder), 0755, true);
            Log::info('📁 Created folder', ['folder' => public_path($folder)]);
        }

        $file->move(public_path($folder), $fileName);
        Log::info('✅ File moved', ['path' => $relativePath]);

        return [
            'path'     => $relativePath,
            'original' => $file->getClientOriginalName(),
        ];
    }

}