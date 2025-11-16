<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=Nunito" rel="stylesheet">

    <!-- Scripts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="{{ asset('css/css.css') }}">
</head>
<body>
    <div id="app">
        <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="{{ url('/') }}">
                    {{ config('app.name', 'Laravel') }}
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Right Side Of Navbar (Logout Outside) -->
                    <ul class="navbar-nav ms-auto">
                        @guest
                            @if (Route::has('login'))
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                                </li>
                            @endif
                       
                        @else
                            <li class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                    {{ Auth::user()->name }}
                                </a>
                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                        Logout
                                    </a>
                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                        @csrf
                                    </form>
                                </div>
                            </li>
                        @endguest
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <!-- Horizontal Admin Nav (Outside Logout, Items Next to Each Other) -->
                <nav class="col-md-12 bg-light border-bottom">
                    <div class="d-flex align-items-center justify-content-start p-4 gap-2 mt-5" 
                    style="">
                        <!-- Top-Level Items Horizontal on Same Line -->
                        <div class="dropdown">
                            <button class="btn btn-outline-primary dropdown-toggle" type="button" id="catDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                Cat
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="catDropdown">
                                <li><a class="dropdown-item" href="{{ route('cats.createadmin') }}">Add Category</a></li>
                                <li><a class="dropdown-item" href="{{ route('cats.indexadmin') }}">View Category</a></li>
                            </ul>
                        </div>

                        <div class="dropdown">
                            <button class="btn btn-outline-primary dropdown-toggle" type="button" id="productsDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                Products
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="productsDropdown">
                                <li><a class="dropdown-item" href="">Add Product</a></li>
                                <li><a class="dropdown-item" href="">View Products</a></li>
                            </ul>
                        </div>

                        <!-- Add more items here on the same line -->
                    </div>
                </nav>

                <!-- Main Content Area (Full Space Below Nav) -->
                <main class="col-md-12 px-md-4 py-4">
          
                    @yield('content')
                </main>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="{{ asset('js/app.js') }}"></script>
    </body>
</html>