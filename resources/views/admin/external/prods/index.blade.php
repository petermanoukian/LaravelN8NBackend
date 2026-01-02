@extends('layouts.appadmin')

@section('content')
<h3>External Products from external Source</h3>

<table class="table table-striped">
    <thead>
        <tr>
            <th>ID</th>
            <th>Origin ID</th>
            <th>Category</th>
            <th>Name</th>
            <th>Description</th>
            <th>Filename</th>
        </tr>
    </thead>
    <tbody>
        @foreach($prods as $prod)
            <tr>
                <td>{{ $prod->id }}</td>
                <td>{{ $prod->originid }}</td>

                {{-- Category column via relationship --}}
                <td>
                    @if($prod->prodcat)
                        {{ $prod->prodcat->name }}
                        <br>
                        <small>OriginID: {{ $prod->prodcat->originid }}</small>
                    @else
                        <em>No category</em>
                    @endif
                </td>

                <td>{{ $prod->name }}</td>
                <td>{{ $prod->des }} <br> {!! $prod->dess !!}</td>

                <td>
                    @if(!empty($prod->filename) && !empty($prod->fileurl))
                        <a href="{{ $prod->fileurl }}" target="_blank">
                            {{ $prod->filename }}
                        </a>
                        <br>
                        <small>
                            {{ $prod->friendly_mime }}
                            @if(!empty($prod->sizer))
                                — {{ number_format($prod->sizer / 1024, 1) }} KB
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
{{ $prods->links('pagination::bootstrap-5') }}

@endsection
