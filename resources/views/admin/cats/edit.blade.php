@extends('layouts.appadmin')

@section('content')
<div class="container">
    <h1>Edit Category</h1>

    <form action="{{ route('admin.cats.update', $row->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT') {{-- ensure Laravel treats it as an update --}}

        <div class="mb-3">
            <label for="name" class="form-label">Name (Unique)</label>
            <input type="text" class="form-control" id="name" name="name"
                   value="{{ old('name', $row->name) }}" required>
        </div>

        <div class="mb-3">
            <label for="department" class="form-label">Department</label>
            <select class="form-select" id="department" name="department">
                <option value="">Select Department</option>
                <option value="Marketing" {{ old('department', $row->department) == 'Marketing' ? 'selected' : '' }}>Marketing</option>
                <option value="Sales" {{ old('department', $row->department) == 'Sales' ? 'selected' : '' }}>Sales</option>
                <option value="PR" {{ old('department', $row->department) == 'PR' ? 'selected' : '' }}>PR</option>
                <option value="HR" {{ old('department', $row->department) == 'HR' ? 'selected' : '' }}>HR</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="img" class="form-label">Image (Optional)</label>
            @if($row->img2)
                <div class="mb-2">
                    <img src="{{ asset($row->img2) }}" alt="Image" width="100">
                </div>
            @endif
            <input type="file" class="form-control" id="img" name="img"
                   accept="image/gif,image/jpeg,image/jpg,image/png">
        </div>

        <div class="mb-3">
            <label for="filer" class="form-label">File (Optional)</label>
            @if($row->filer)
                <div class="mb-2">
                    <a href="{{ asset($row->filer) }}" target="_blank">Current File</a>
                </div>
            @endif
            <input type="file" class="form-control" id="filer" name="filer"
                   accept=".txt,.doc,.docx,.pdf,.csv,.xls,.xlsx,.json,image/gif,image/jpeg,image/jpg,image/png,image/webp,image/tiff">
        </div>

        <button type="submit" class="btn btn-primary">Update Category</button>
    </form>
</div>
@endsection
