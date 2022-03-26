<?php

use App\Http\Controllers\Web\AuthController;
use App\Http\Controllers\Web\DataController;
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



Route::get('/', [AuthController::class, 'indexLogin'])->name("login");
Route::get('/reg',  [AuthController::class, 'indexReg'])->name("reg");
Route::get('/add/data', [DataController::class, 'createData'])->middleware("auth")->name('createData');
Route::post('/reg/submit/',  [AuthController::class, 'submitReg'])->name('regSubmit');
Route::post('/add/submit/',  [DataController::class, 'addUserData'])->middleware("auth")->name('addData');
Route::get('/delete/submit/{id}',  [DataController::class, 'deleteUserData'])->middleware("auth")->name('deleteUserData');
Route::get('/update/data/{id}', [DataController::class, 'updateData'])->middleware("auth")->name('update');
Route::post('/update/submit/{id}',  [DataController::class, 'updateUserData'])->name('updateUserData');

Route::post('/login/submit/',  [AuthController::class, 'submitLogin'])->name('loginSubmit');
Route::get('/logout', [AuthController::class, 'logout'])->middleware("auth")->name('main');
Route::get('/main',  [AuthController::class, 'indexMain'])->middleware("auth")->name('main');
