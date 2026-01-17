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


<!-- Products section -->
<button id="fetchProducts" class="btn btn-info mt-2" style="display:none;">
    Fetch Products (GraphQL)
</button>

<table class="table table-striped mt-3" id="productsTable" style="display:none;">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Category</th>
        </tr>
    </thead>
    <tbody id="productsResult"></tbody>
</table>


<!-- Product dropdown + order form -->
<div id="orderSection" style="display:none;" class="mt-3">
    <label for="productSelect">Choose Product:</label>
    <select id="productSelect" class="form-control"></select>

    <form id="createOrderForm" class="mt-2">
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" class="form-control" value="1" min="1">
        <button type="submit" class="btn btn-success mt-2">Add Order</button>
    </form>
</div>





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
        //$('#categoriesTable').show();
        $('#fetchProducts').show();
        //$('#productsTable').show();
        //$('#orderSection').show();
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
                        //$('#categoriesTable').show();
                        $('#fetchProducts').show();
                        //$('#orderSection').show();
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
                    $('#fetchProducts').hide();  
                    $('#productsTable').hide();
                    $('#orderSection').hide();
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
            $('#categoriesTable').show();
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


$('#fetchProducts').on('click', function () {
    $.ajax({
        url: window.WEB_EXTERNAL + '/graphql',
        method: 'POST',
        contentType: 'application/json',
        xhrFields: { withCredentials: true },
        headers: { 'Authorization': 'Bearer ' + window.graphqlToken },
        data: JSON.stringify({
            query: `
                query {
                    prods {
                        id
                        name
                        des
                        cat {
                            name
                        }
                    }
                }
            `
        }),
        success: function (response) {
            const prods = response.data.prods;
            let rows = '';
            $('#productSelect').empty();
            prods.forEach(p => {
                rows += `
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.name}</td>
                        <td>${p.des ?? ''}</td>
                        <td>${p.cat ? p.cat.name : ''}</td>
                    </tr>
                `;
                $('#productSelect').append(
                    `<option value="${p.id}">${p.name}</option>`
                );
            });
            $('#productsResult').html(rows);
            $('#productsTable').show();
            $('#orderSection').show();
        },
        error: function (xhr) {
            $('#productsResult').html(`
                <tr>
                    <td colspan="4"><strong>GraphQL error:</strong> ${xhr.status} ${xhr.responseText}</td>
                </tr>
            `);
        }
    });
});

$('#createOrderForm').on('submit', function (e) {
    e.preventDefault();
    const prodid = $('#productSelect').val();
    const quan = $('#quantity').val();

    $.ajax({
        url: window.WEB_EXTERNAL + '/graphql',
        method: 'POST',
        contentType: 'application/json',
        xhrFields: { withCredentials: true },
        headers: { 'Authorization': 'Bearer ' + window.graphqlToken },
        data: JSON.stringify({
            query: `
                mutation {
                    createProdorder(
                        prodid: ${prodid}, 
                        quan: ${quan}, 
                        customer: "Laravel First App"
                    ) {
                        id
                        prodid
                        quan
                        customer
                    }
                }
            `
        }),
        success: function (response) {
            alert('Order created: ' + JSON.stringify(response.data.createProdorder));
        },
        error: function (xhr) {
            alert('GraphQL error: ' + xhr.status + ' ' + xhr.responseText);
        }
    });
});

</script>



@endsection

