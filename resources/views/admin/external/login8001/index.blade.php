{{-- resources/views/admin/external/login8001/index.blade.php --}}
@extends('layouts.appadmin')

@section('content')
<h3>External Sanctum Login to 8001</h3>

<form id="login8001" class="mb-3">
    @csrf
    <div class="mb-2">
        <label>Email:</label>
        <input type="email" id="email" class="form-control" required>
    </div>
    <div class="mb-2">
        <label>Password:</label>
        <input type="password" id="password" class="form-control" required>
    </div>
    <input type="hidden" id="ipp" value="3">
    <button type="submit" class="btn btn-primary">Login</button>
</form>

<table class="table table-striped">
    <thead>
        <tr>
            <th>Login Success</th>
            <th>User ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Token</th>
            <th>IP</th>
        </tr>
    </thead>
    <tbody id="loginResult">
    
    </tbody>
</table>


<!-- Hide GraphQL button and table by default -->
<button id="fetchCategories" class="btn btn-info mt-2" style="display:none;">
    Fetch Categories (GraphQL)
</button>

<table class="table table-striped mt-3" id="categoriesTable" style="display:none;">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody id="categoriesResult">
        {{-- Populated by GraphQL --}}
    </tbody>
</table>




<!-- Add this below the table -->
<!-- Hide logout button by default -->
<button id="logout8001" class="btn btn-danger mt-2" style="display:none;">
    Logout (8001)
</button>


@endsection

@section('scripts')

<script>
    window.WEB_EXTERNAL = "{{ env('WEB_EXTERNAL') }}";
    window.WEB_EXTERNAL_API = "{{ env('WEB_EXTERNAL_API') }}";
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

$(function () {
    const savedToken = localStorage.getItem('authToken8001');
    if (savedToken) {
        window.graphqlToken = savedToken;
        $('#logout8001').show();
        $('#login8001').hide();
        $('#fetchCategories').show();
        $('#categoriesTable').show();
        $('#loginResult').html(`
            <tr>
                <td colspan="6"><strong>Session restored with saved token</strong></td>
            </tr>
        `);
    }
});



function getCookie(name) {
    const match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
    return match ? match[2] : null;
}



$(function () {
    $('#login8001').on('submit', function (e) {
        e.preventDefault();

        // 1️⃣ Initialize Sanctum CSRF cookie
        $.ajax({
            url: window.WEB_EXTERNAL + '/sanctum/csrf-cookie',
            method: 'GET',
            xhrFields: {
                withCredentials: true
            }
        }).done(function () {

            const xsrfToken = getCookie('XSRF-TOKEN');

            if (!xsrfToken) {
                console.error('XSRF-TOKEN cookie missing');
                return;
            }

            // 2️⃣ Login request
            $.ajax({
                url: window.WEB_EXTERNAL_API + '/login',
                method: 'POST',
                xhrFields: {
                    withCredentials: true
                },
                headers: {
                    'X-XSRF-TOKEN': decodeURIComponent(xsrfToken)
                },
                data: {
                    email: $('#email').val(),
                    password: $('#password').val(),
                    ipp: $('#ipp').val()
                },
                success: function (response) {
                    $('#loginResult').html(`
                        <tr>
                            <td>${response.login_success}</td>
                            <td>${response.user?.id ?? ''}</td>
                            <td>${response.user?.name ?? ''}</td>
                            <td>${response.user?.email ?? ''}</td>
                            <td>${response.token ?? ''}</td>
                            <td>${response.ip ?? ''}</td>
                        </tr>
                    `);
                    if (response.login_success) { 
                        $('#logout8001').show(); 
                        $('#login8001').hide();
                        $('#fetchCategories').show();  
                        $('#categoriesTable').show();
                        window.graphqlToken = response.token;
                        localStorage.setItem('authToken8001', response.token);
                    }


                },
                error: function (xhr) {
                    $('#loginResult').html(`
                        <tr>
                            <td colspan="6"><strong>Login failed:</strong> ${xhr.status} ${xhr.responseText}</td>
                        </tr>
                    `);
                }
            });

        }).fail(function () {
            $('#loginResult').html(`
                <tr>
                    <td colspan="6"><strong>CSRF init failed</strong></td>
                </tr>
            `);
        });
    });
});


// Logout handler (reuses the same CSRF cookie and header style)
$(function () {
    $('#logout8001').on('click', function () {
        // Ensure CSRF cookie is present (optional refresh)
        $.ajax({
            url: window.WEB_EXTERNAL + '/sanctum/csrf-cookie',
            method: 'GET',
            xhrFields: { withCredentials: true }
        }).always(function () {
            const xsrfToken = getCookie('XSRF-TOKEN');
            if (!xsrfToken) {
                $('#loginResult').html(`
                    <tr>
                        <td colspan="6"><strong>Logout failed:</strong> XSRF-TOKEN missing</td>
                    </tr>
                `);
                return;
            }

            $.ajax({
                url: window.WEB_EXTERNAL_API + '/logout',
                method: 'POST',
                xhrFields: { withCredentials: true },
                headers: { 'X-XSRF-TOKEN': decodeURIComponent(xsrfToken) },
                success: function (response) {
                    $('#loginResult').html(`
                        <tr>
                            <td colspan="6"><strong>${response.message ?? 'Logged out'}</strong></td>
                        </tr>
                    `);
                    $('#logout8001').hide();
                    $('#login8001').show();
                    $('#fetchCategories').hide();  
                    $('#categoriesTable').hide();
                    window.graphqlToken = null;
                    localStorage.removeItem('authToken8001');
                },
                error: function (xhr) {
                    $('#loginResult').html(`
                        <tr>
                            <td colspan="6"><strong>Logout failed:</strong> ${xhr.status} ${xhr.responseText}</td>
                        </tr>
                    `);
                }
            });
        });
    });
});


$('#fetchCategories').on('click', function () {
    $.ajax({
        url: window.WEB_EXTERNAL + '/graphql',
        method: 'POST',
        contentType: 'application/json',
        xhrFields: { withCredentials: true },
        headers: {
            'Authorization': 'Bearer ' + window.graphqlToken   // 🔑 send token
        },
        data: JSON.stringify({
            query: `
                query {
                    cats {
                        id
                        name
                        des
                    }
                }
            `
        }),
        success: function (response) {
            const cats = response.data.cats;
            let rows = '';
            cats.forEach(c => {
                rows += `
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.name}</td>
                        <td>${c.des}</td>
                    </tr>
                `;
            });
            $('#categoriesResult').html(rows);
        },
        error: function (xhr) {
            $('#categoriesResult').html(`
                <tr>
                    <td colspan="3"><strong>GraphQL error:</strong> ${xhr.status} ${xhr.responseText}</td>
                </tr>
            `);
        }
    });
});


</script>



@endsection

