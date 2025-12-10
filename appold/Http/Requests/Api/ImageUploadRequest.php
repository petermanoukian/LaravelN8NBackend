<?php

namespace App\Http\Requests\Api;

use Illuminate\Foundation\Http\FormRequest;

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
        $inputName = $this->inputName ?? 'image';
        $allowedMimes = $this->allowedMimes ?? ['jpg', 'jpeg', 'gif', 'webp', 'png', 'tiff'];
        $maxFileSize = $this->maxFileSize ?? 5120;

        return [
            $inputName => 'required|file|mimes:' . implode(',', $allowedMimes) . '|max:' . $maxFileSize,
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
}