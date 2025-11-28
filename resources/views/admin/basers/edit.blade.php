@extends('layouts.appadmin')

@section('content')
<div class="container">
    <h1>Edit Knowledge Base</h1>

    <form action="{{ route('admin.basers.update', $baser->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT') {{-- ensures Laravel treats it as PUT --}}


        <div class="mb-3">
            <label for="catid" class="form-label">Category</label>
            <select name="catid" id="catid" class="form-select">
                @foreach($categories as $category)
                    <option value="{{ $category->id }}"
                        {{ $baser->catid == $category->id ? 'selected' : '' }}>
                        {{ $category->name }}
                    </option>
                @endforeach
            </select>
        </div>



        <div class="mb-3">
            <label for="name" class="form-label">Title</label>
            <input type="text" class="form-control" id="name" name="name" value="{{ old('name', $baser->name) }}" required>
        </div>

        <div class="mb-3">
            <label for="des" class="form-label">Short Description</label>
            <textarea class="form-control" id="des" name="des" rows="3">{{ old('des', $baser->des) }}</textarea>
        </div>

        <div class="mb-3">
            <label for="dess" class="form-label">Long Description</label>
            <textarea class="form-control dess" name="dess">{{ old('dess', $baser->dess) }}</textarea>
        </div>

        <div class="mb-3">
            <label for="img" class="form-label">Image</label>
            @if($baser->img2)
                <div><img src="{{ asset($baser->img2) }}" alt="Image" width="100"></div>
            @endif
            <input type="file" class="form-control" id="img" name="img"
                   accept="image/gif,image/jpeg,image/jpg,image/png">
        </div>

        <div class="mb-3">
            <label for="filer" class="form-label">File</label>
            @if($baser->filer)
                <div><a href="{{ asset($baser->filer) }}" target="_blank">Current File</a></div>
            @endif
            <input type="file" class="form-control" id="filer" name="filer"
                   accept=".txt,.doc,.docx,.pdf,.csv,.xls,.xlsx,.json,image/gif,image/jpeg,image/jpg,image/png,image/webp,image/tiff">
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>
@endsection


@section('scripts')
<script src="https://cdn.tiny.cloud/1/wtkr004h3tlah7yljg2m1o3rg03scnqq5lg4ph3jjhg7j59t/tinymce/8/tinymce.min.js" referrerpolicy="origin" crossorigin="anonymous"></script>
<script>
tinymce.init({
  selector: '.dess',
  menubar: false,
  toolbar: 'formatselect | bold italic underline strikethrough | forecolor backcolor |   alignleft aligncenter alignright alignjustify |   bullist numlist outdent indent | blockquote |   undo redo removeformat',

  branding: false,
  height: 300,
  width: '100%'
});
</script>
@endsection