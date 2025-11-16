@extends('layouts.appadmin')

@section('content')
<div class="container">
    <h1>Add Category</h1>
    <?php
    /*
    {{ route('cats.store') }}
    */
    ?>
    <form action="{{ route('admin.cats.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        
        <div class="mb-3">
            <label for="name" class="form-label">Name (Unique)</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>


        <div class="mb-3">
            <label for="department" class="form-label">Department</label>
            <select class="form-select" id="department" name="department" >
                <option value="">Select Department</option>
                <option value="Marketing">Marketing</option>
                <option value="Sales">Sales</option>
                <option value="PR">PR</option>
                <option value="HR">HR</option>
            </select>
        </div>
        
        <div class="mb-3">
            <label for="img" class="form-label">Image (Optional: gif, jpeg, jpg, png)</label>
            <input type="file" class="form-control" id="img" name="img" 
            accept="image/gif, image/jpeg, image/jpg, image/png">
        </div>
        

        
        <div class="mb-3">
            <label for="filer" class="form-label">File (Optional: txt, doc, docx, pdf, gif, jpeg, jpg, png)</label>
            <input type="file" class="form-control" id="filer" name="filer" 
            accept=".txt,.doc,.docx,.pdf,image/gif, image/jpeg, image/jpg, image/png*">
        </div>
        
        <button type="submit" class="btn btn-primary">Add Category</button>
    </form>
</div>
@endsection