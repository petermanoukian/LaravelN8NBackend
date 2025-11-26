<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CatController;

Route::prefix('admin/cats')->group(function () {
    Route::get('/list', [CatController::class, 'indexPaginated'])->name('api.admin.cats.index');
    Route::get('/all', [CatController::class, 'indexAll'])->name('api.admin.cats.all');
    Route::match(['get', 'post'], '/catsconditioned', [CatController::class, 'indexConditioned'])
    ->name('api.admin.cats.catsconditioned');
    Route::post('/store', [CatController::class, 'store'])->name('api.admin.cats.store');
});
