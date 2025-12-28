<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\external\ProdcatController;

Route::group(['prefix' => 'admin/external', 'middleware' => 'auth'], function () {
    Route::get('/prodcats', [ProdcatController::class, 'index'])
        ->name('external.prodcats.index');
});
