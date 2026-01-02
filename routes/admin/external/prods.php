<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\external\ProdController;

Route::group(['prefix' => 'admin/external', 'middleware' => 'auth'], function () {
    Route::get('/prods', [ProdController::class, 'index'])
        ->name('external.prods.index');
});
