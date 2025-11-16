<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CatRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'name'       => 'required|string|max:255|unique:cats,name',
         
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
