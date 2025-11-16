<?php

use App\Http\Controllers\CatController;

Route::prefix('admin')->group(function () { 
    Route::get('/cats/createadmin', [CatController::class, 'createadmin'])->name('cats.createadmin');
    Route::get('/cats/view', [CatController::class, 'indexadmin'])->name('cats.indexadmin');
    Route::get('/cats/viewajax', [CatController::class, 'indexadminajax'])->name('cats.ajaxadmin');
    Route::post('/cats/add', [CatController::class, 'store'])
        ->name('admin.cats.store'); 
});
