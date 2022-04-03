<?php

use App\Http\Controllers\Web\AuthController;
use App\Http\Controllers\Web\DataController;
use App\Http\Controllers\Web\BinController;

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

Route::get('/copy/{id}', [DataController::class, 'copy'])->name('copy');
Route::get('/redaction', [DataController::class, 'redaction'])->name('redaction');
Route::get('/', [AuthController::class, 'indexLogin'])->name("login");
Route::get('/reg',  [AuthController::class, 'indexReg'])->name("reg");
Route::get('/add/data', [DataController::class, 'createData'])->middleware("auth")->name('createData');
Route::post('/reg/submit/',  [AuthController::class, 'submitReg'])->name('regSubmit');
Route::post('/add/submit/',  [DataController::class, 'addUserData'])->middleware("auth")->name('addData');
Route::get('/delete/submit/{id}',  [DataController::class, 'deleteUserData'])->middleware("auth")->name('deleteUserData');
Route::get('/bin/deleted/{id}',  [BinController::class, 'physicDelete'])->middleware("auth")->name('physicDelete');
Route::get('/bin/restore/{id}',  [BinController::class, 'physicRestore'])->middleware("auth")->name('physicRestore');
Route::get('/bin',  [DataController::class, 'indexBin'])->middleware("auth")->name('indexBin');
Route::get('/update/data/{id}', [DataController::class, 'updateData'])->middleware("auth")->name('update');
Route::post('/update/submit/{id}',  [DataController::class, 'updateUserData'])->name('updateUserData');

Route::post('/login/submit/',  [AuthController::class, 'submitLogin'])->name('loginSubmit');
Route::get('/logout', [AuthController::class, 'logout'])->middleware("auth")->name('logout');
Route::get('/main',  [AuthController::class, 'indexMain'])->middleware("auth")->name('main');
