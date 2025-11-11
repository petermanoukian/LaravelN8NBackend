<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Http\Controllers\Api\AuthController;

Route::get('/sanctum/csrf-cookie', [AuthController::class, 'csrfCookie']);

// 🔐 Public auth routes
Route::post('/login', [AuthController::class, 'login']);

// 🔒 Protected routes
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/check-auth', [AuthController::class, 'checkAuth']);
    Route::get('/user', [AuthController::class, 'loggedUser']);
    Route::post('/logout', [AuthController::class, 'logout']);
});



