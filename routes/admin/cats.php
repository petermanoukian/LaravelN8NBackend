<?php

use App\Http\Controllers\CatController;

Route::prefix('admin')->group(function () { 
    Route::get('/cats/createadmin', [CatController::class, 'createadmin'])->name('cats.createadmin');
    Route::get('/cats/view', [CatController::class, 'indexadmin'])->name('cats.indexadmin');
    Route::get('/cats/viewajax', [CatController::class, 'indexadminajax'])->name('cats.ajaxadmin');
    Route::post('/cats/add', [CatController::class, 'store'])
        ->name('admin.cats.store'); 
    Route::get('/cats/edit/{id}', [CatController::class, 'edit'])->name('admin.cats.edit');
    Route::put('/cats/update/{id}', [CatController::class, 'update'])->name('admin.cats.update'); // ✅ update
    Route::delete('/cats/delete/{id}', [CatController::class, 'destroy'])->name('admin.cats.delete');

});
