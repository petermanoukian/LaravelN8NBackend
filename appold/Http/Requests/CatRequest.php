<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class CatRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
                'name' => [
                    'required',
                    'string',
                    'max:255',
                    Rule::unique('cats', 'name')->ignore($this->route('id')), // ✅ ignore current record on update
                ],
            ];
    }

    public function messages(): array
    {
        return [
            'name.required'    => 'Category name is required.',
            'name.unique'      => 'This category name already exists.',
        ];
    }
}
