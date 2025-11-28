<?php

use App\Http\Controllers\BaserController;

Route::prefix('admin')->group(function () { 
    
    Route::get('/basers/createadmin/{catid?}', [BaserController::class, 'createadmin'])
        ->name('basers.createadmin');
    Route::match(['get', 'post'], '/basers/view/{catid?}', [BaserController::class, 'indexadmin'])
        ->name('basers.indexadmin');
    Route::match(['get', 'post'], '/basers/viewajax/{catid?}', [BaserController::class, 'indexadminajax'])
        ->name('basers.ajaxadmin');
    Route::match(['get', 'post'], '/basers/search', [BaserController::class, 'search'])
        ->name('admin.basers.search');
    Route::post('/basers/add', [BaserController::class, 'store'])->name('admin.basers.store');
    Route::get('/basers/edit/{id}', [BaserController::class, 'edit'])->name('admin.basers.edit');
    Route::post('/basers/update/{id}', [BaserController::class, 'update'])->name('admin.basers.update');
    Route::put('/basers/update/{id}', [BaserController::class, 'update'])->name('admin.basers.update');
    Route::delete('/basers/delete/{id}', [BaserController::class, 'delete'])->name('admin.basers.delete');
    Route::post('/basers/deleteall', [BaserController::class, 'deleteAll'])->name('admin.basers.deleteall');
    Route::delete('/basers/deleteall', [BaserController::class, 'deleteAll'])->name('admin.basers.deleteall');

});
