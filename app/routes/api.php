<?php

use App\Http\Controllers\API\ActionController;
use App\Http\Controllers\API\DataController;
use App\Http\Controllers\API\DataUserController;
use App\Http\Controllers\API\EmployeeController;
use App\Http\Controllers\API\TypeActionController;
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

Route::apiResource('/action',ActionController::class);
Route::apiResource('/data',DataController::class);
Route::apiResource('/data_user',DataUserController::class);
Route::apiResource('/employee',EmployeeController::class);
Route::post('/sing_up',[EmployeeController::class, 'sing_up']);
Route::post('/sing_in',[EmployeeController::class, 'sing_in']);
Route::post('/logout',[EmployeeController::class, 'logout']);
Route::apiResource('/type_action',TypeActionController::class);