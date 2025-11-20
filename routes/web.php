<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminHomeController;

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();



Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


Route::group(['middleware' => 'auth'], function () {
    Route::get('/admin', [AdminHomeController::class, 'index'])->name('admin.home');
    Route::get('/admin/home', [AdminHomeController::class, 'index'])->name('admin.home');
    require __DIR__ . '/admin/cats.php';
});


