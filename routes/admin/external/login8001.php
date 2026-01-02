<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\external\Login8001Controller;

Route::group(['prefix' => 'admin/external', 'middleware' => 'auth'], function () {
    Route::get('/login8001', [Login8001Controller::class, 'index'])
        ->name('external.login8001.index');
});
