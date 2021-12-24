<?php

use App\Http\Controllers\ActionController;
use App\Http\Controllers\DataController;
use App\Http\Controllers\DataUserController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\TypeActionController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResource('/category',ActionController::class);
Route::apiResource('/data',DataController::class);
Route::apiResource('/data_user',DataUserController::class);
Route::apiResource('/employee',EmployeeController::class);
Route::apiResource('/type_action',TypeActionController::class);