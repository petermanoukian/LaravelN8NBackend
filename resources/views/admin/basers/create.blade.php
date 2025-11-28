@extends('layouts.appadmin')

@section('content')
<div class="container">
    <h1>Add Knowledge Base</h1>
    <?php
    /*
    {{ route('cats.store') }}
    */
    ?>
    <form action="{{ route('admin.basers.store') }}" method="POST" enctype="multipart/form-data">
        @csrf

        <div class="mb-3">
            <label for="catid" class="form-label">Category</label>
            <select name="catid" id="catid" class="form-select" required>
                <option value="">-- Select Category --</option>
                @foreach($categories as $category)
                    <option value="{{ $category->id }}"
                        {{ $catid == $category->id ? 'selected' : '' }}>
                        {{ $category->name }}
                    </option>
                @endforeach
            </select>
        </div>



        
        <div class="mb-3">
            <label for="name" class="form-label">Title</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>

        <div class="mb-3">
            <label for="ded" class="form-label">Short Description</label>
            <textarea class="form-control" id="des" name="des" rows="3" placeholder="Enter a brief summary..." ></textarea>
        </div>

        <div class="mb-3">
            <label for="long_description" class="form-label">Long Description</label>
            <textarea class="form-control dess" name="dess" placeholder="Additional Info"></textarea>
        </div>


        <div class="mb-3">
            <label for="img" class="form-label">Image (Optional: gif, jpeg, jpg, png)</label>
            <input type="file" class="form-control" id="img" name="img" 
            accept="image/gif, image/jpeg, image/jpg, image/png">
        </div>

        <div class="mb-3">
            <label for="filer" class="form-label">File (Optional: txt, doc, docx, pdf, gif, jpeg, jpg, png)</label>
            <input type="file" class="form-control" id="filer" name="filer"
            accept=".txt,.doc,.docx,.pdf,.csv,.xls,.xlsx,.json,image/gif,image/jpeg,image/jpg,image/png,image/webp,image/tiff">
        </div>
        
        <button type="submit" class="btn btn-primary">Add</button>
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