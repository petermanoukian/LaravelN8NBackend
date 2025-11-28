@extends('layouts.appadmin')

@section('content')
<div class="container">
    <h1 class="mb-4">Categories</h1>

    {{-- Success / Error messages --}}
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif


    @if(session('error'))
        <div class="alert alert-danger">{{ session('error') }}</div>
    @endif



    @if($errors->any())
        <div class="alert alert-danger">
            <ul class="mb-0">
                @foreach($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    {{-- Create button --}}
    <a href="{{ route('cats.createadmin') }}" class="btn btn-primary mb-3">Create New Category</a>

    {{-- Table --}}
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Department</th>
                <th>Image</th>
                <th>File</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($cats as $cat)
                <tr>
                    <td>{{ $cat->id }}</td>
                    <td>{{ $cat->name }}</td>
                    <td>{{ $cat->department }}</td>
                    <td>
                        @if($cat->img2)
                        <a href="{{ asset($cat->img) }}" target="_blank">
                       
                            <img src="{{ asset($cat->img2) }}" alt="Image" width="80">
                            </a>
                        @endif
                    </td>
                    <td>
                        @if($cat->filer)
                            <a href="{{ asset($cat->filer) }}" target="_blank">Download</a>
                        @endif
                    </td>
             
                    <td>
                        <a href="{{ route('admin.cats.edit', $cat->id) }}" class="btn btn-sm btn-secondary">
                            Edit
                        </a>
                        <form action="{{ route('admin.cats.delete', $cat->id) }}" method="POST" style="display:inline-block;"
                            onsubmit="return confirm('Are you sure you want to delete this category?');">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                        </form>

                        {{-- New line for knowledge base actions --}}
                        <div class="mt-2">
                            <a href="{{ route('basers.indexadmin', $cat->id) }}" class="btn btn-sm btn-info">
                                View Knowledge Base
                                @if($cat->basers_count > 0)
                                    ({{ $cat->basers_count }})
                                @endif
                            </a>
                            <a href="{{ route('basers.createadmin', $cat->id) }}" class="btn btn-sm btn-success">
                                Add Knowledge Base
                            </a>
                        </div>

                        {{-- Related basers list --}}
                        @if($cat->basers_count > 0)
                            <hr>
                            <ul class="list-unstyled">
                                @foreach($cat->basers as $baser)
                                    <li>
                                        {{ $baser->name ?? 'Untitled Base' }}
                                        <a href="{{ route('admin.basers.edit', $baser->id) }}" class="btn btn-sm btn-outline-secondary">
                                            Edit
                                        </a>
                                    </li>
                                @endforeach
                            </ul>
                        @endif
                    </td>

                </tr>
            @empty
                <tr>
                    <td colspan="6">No categories found.</td>
                </tr>
            @endforelse
        </tbody>
    </table>

     {{ $cats->links('pagination::bootstrap-5') }}
</div>
@endsection
