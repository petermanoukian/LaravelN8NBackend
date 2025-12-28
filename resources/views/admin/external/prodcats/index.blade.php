@extends('layouts.appadmin')

@section('content')
<h3>External Product Categories form external Source</h3>

<table class="table table-striped">
    <thead>
        <tr>
            <th>ID</th>
            <th>Origin ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Filename</th>

        </tr>
    </thead>
    <tbody>
        @foreach($prodcats as $prodcat)
            <tr>
                <td>{{ $prodcat->id }}</td>
                <td>{{ $prodcat->originid }}</td>
                <td>{{ $prodcat->name }}</td>
                <td>{{ $prodcat->des }} <br> {!! $prodcat->dess !!}</td>

                <td>
                    @if(!empty($prodcat->filename) && !empty($prodcat->fileurl))
                        <a href="{{ $prodcat->fileurl }}" target="_blank">
                            {{ $prodcat->filename }}
                        </a>
                        <br>
                        <small>
                            {{ $prodcat->friendly_mime }}
                            @if(!empty($prodcat->sizer))
                                — {{ number_format($prodcat->sizer / 1024, 1) }} KB
                            @endif
                        </small>
                    @else
                        <em>No file</em>
                    @endif
                </td>

            </tr>
        @endforeach
    </tbody>
</table>

{{-- Laravel pagination links --}}
{{ $prodcats->links('pagination::bootstrap-5') }}

@endsection
