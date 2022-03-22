<?php

use App\Http\Controllers\Web\AuthController;
use App\Http\Controllers\Web\RegController;
use App\Http\Controllers\Web\EmployeeController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Route::get('/', [AuthController::class, 'indexLogin']);
Route::get('/reg',  [AuthController::class, 'indexReg']);
Route::post('/reg/submit/',  [AuthController::class, 'submitReg'])->name('regSubmit');
Route::post('/login/submit/',  [AuthController::class, 'submitLogin'])->name('loginSubmit');
Route::get('/main',  [AuthController::class, 'indexMain'])->name('main');
