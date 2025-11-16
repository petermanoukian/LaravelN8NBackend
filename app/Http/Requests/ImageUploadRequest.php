<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\Log;

class ImageUploadRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true; // Adjust for authorization logic if needed
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        $inputName = $this->inputName ?? 'img';
        $allowedMimes = $this->allowedMimes ?? ['jpg', 'jpeg', 'gif', 'webp', 'png', 'tiff'];
        $maxFileSize = $this->maxFileSize ?? 9920;

        return [
            $inputName => 'nullable|file|mimes:' . implode(',', $allowedMimes) . '|max:' . $maxFileSize,
        ];
    }

    /**
     * Get custom messages for validator errors.
     *
     * @return array
     */
    public function messages(): array
    {
        $inputName = $this->inputName ?? 'image';
        $allowedMimes = $this->allowedMimes ?? ['jpg', 'jpeg', 'gif', 'webp', 'png', 'tiff'];
        $maxFileSize = ($this->maxFileSize ?? 5120) / 1024;

        return [
            "{$inputName}.required" => 'An image is required.',
            "{$inputName}.mimes" => 'Image must be one of: ' . implode(', ', $allowedMimes) . '.',
            "{$inputName}.max" => 'Image size must not exceed ' . $maxFileSize . 'MB.',
        ];
    }

    /**
     * Prepare the data for validation (e.g., set dynamic input name if provided via route/model binding).
     */
    protected function prepareForValidation()
    {
        // Merge dynamic params from route/request (controller can merge allowedMimes/maxFileSize before validation)
        $this->merge([
            'inputName' => $this->route('inputName', 'image'),
            'allowedMimes' => $this->route('allowedMimes') ?? $this->input('allowedMimes'), // From controller merge or input
            'maxFileSize' => $this->route('maxFileSize') ?? $this->input('maxFileSize'), // From controller merge or input
        ]);
    }


    protected function failedValidation(Validator $validator)
    {
        Log::error('❌ ImageUploadRequest validation failed', [
            'errors' => $validator->errors()->toArray(),
            'input'  => $this->all(),
        ]);

        throw new HttpResponseException(
            redirect()->back()
                ->withErrors($validator)
                ->withInput()
        );
    }
}