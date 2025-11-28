@extends('layouts.appadmin')

@section('content')
<div class="fullwidth98">
    <h1 class="mb-4">Knowledge Base</h1>

    {{-- Success / Error messages --}}
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
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
    <a href="{{ route('basers.createadmin') }}" class="btn btn-primary mb-3">Create New </a>


    {{-- Filter form --}}
    <form method="POST" action="{{ route('basers.indexadmin') }}" class="mb-3 d-flex align-items-center">
        @csrf
        <div class="me-2">
            <select name="catid" class="form-select" onchange="this.form.submit()">
                <option value="">-- All Categories --</option>
                @foreach($cats as $category)
                    <option value="{{ $category->id }}" 
                        {{ $catid == $category->id ? 'selected' : '' }}>
                        {{ $category->name }}
                    </option>
                @endforeach
            </select>
        </div>
    </form>




    {{-- Table --}}
   <table class="table table-bordered table-fixed">
        <thead>
            <tr>
                <th style="width:3%;">ID</th>
                <th style="width:20%;">Name</th>
                <th style="width:20%;">Category</th> {{-- ✅ new --}}
                <th style="width:25%;">Answer</th>
                <th style="width:10%;">Image</th>
                <th style="width:10%;">File</th>
                <th style="width:12%;">Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($rows as $row)
                <tr>
                    <td>{{ $row->id }}</td>
                    <td>{{ $row->name }}</td>
                    <td>{{ $row->cat?->name }}</td> {{-- ✅ eager loaded relation --}}
                    <td style="word-wrap: break-word; white-space: normal;">
                        {{ strlen($row->des) > 100 ? substr($row->des, 0, 100) . '...' : $row->des }}
                    </td>
                    <td>
                        @if($row->img2)
                            <a href="{{ asset($row->img) }}" target="_blank">
                                <img src="{{ asset($row->img2) }}" alt="Image" width="80">
                            </a>
                        @endif
                    </td>
                    <td>
                        @if($row->filer)
                            <a href="{{ asset($row->filer) }}" target="_blank">Download</a>
                        @endif
                    </td>
                    <td>
                        <a href="{{ route('admin.basers.edit', $row->id) }}" class="btn btn-sm btn-secondary">Edit</a>
                        <form action="{{ route('admin.basers.delete', $row->id) }}" method="POST" style="display:inline-block;"
                            onsubmit="return confirm('Are you sure you want to delete this record?');">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="7">No records found.</td>
                </tr>
            @endforelse
        </tbody>

</table>


     {{ $rows->links('pagination::bootstrap-5') }}
</div>
@endsection
