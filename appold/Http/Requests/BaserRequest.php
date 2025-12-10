<?php

namespace App\Http\Requests;
use Illuminate\Validation\Rule;

use Illuminate\Foundation\Http\FormRequest;

class BaserRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }



    public function rules(): array
    {
        return [
            'name'  => [
                'required',
                'string',
                'max:255',
                Rule::unique('basers')
                    ->where(fn ($query) => $query->where('catid', $this->input('catid')))
                    ->ignore($this->route('id')), // ✅ ignore current record on update
            ],
            'catid' => [
                'required',
                'integer',
                'exists:cats,id', // ✅ must reference a valid category
            ],
            'des'   => 'nullable|string|max:3000',
            'dess'  => 'nullable|string',
            'img'   => 'nullable|image|mimes:jpeg,jpg,png,gif|max:9948',
            'filer' => 'nullable|mimes:txt,doc,docx,pdf,jpeg,jpg,png,gif,csv,xls,xlsx,json|max:9920',
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => 'Title is required.',
            'name.unique'   => 'This knowledge base title already exists in this category.',
            'catid.required' => 'Category is required.',
            'catid.exists'   => 'Selected category does not exist.',
            'img.image'     => 'Uploaded file must be an image.',
            'img.mimes'     => 'Image must be a jpeg, jpg, png, or gif.',
            'filer.mimes'   => 'File must be txt, doc, docx, pdf, jpeg, jpg, png, or gif.',
        ];
    }

}

