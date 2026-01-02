<?php

use App\Http\Controllers\AdminHomeController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;

Route::get('/', function () {
    return view('welcome');
});



Route::get('/test-pgsql-common', function () {
    try {
        $result = DB::connection('pgsql_common')->select('SELECT 1 AS test');
        return response()->json(['status' => 'connected', 'result' => $result]);
    } catch (\Exception $e) {
        return response()->json(['status' => 'error', 'message' => $e->getMessage()]);
    }
});






Route::get('/clear', function () {
    $exitCode = \Artisan::call('config:cache');
    $exitCode = \Artisan::call('cache:clear');
    $exitCode = \Artisan::call('route:clear');
    $exitCode = \Artisan::call('view:clear');
    $exitCode = \Artisan::call('config:clear');

    return '<h1>Clear Config cleared</h1>';
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::group(['middleware' => 'auth'], function () {
    Route::get('/dashboard', [AdminHomeController::class, 'index'])->name('admin.home');
    Route::get('/admin', [AdminHomeController::class, 'index'])->name('admin.home');
    Route::get('/admin/home', [AdminHomeController::class, 'index'])->name('admin.home');
    require __DIR__.'/admin/cats.php';
    require __DIR__.'/admin/basers.php';
    require __DIR__.'/admin/external.php';
});
