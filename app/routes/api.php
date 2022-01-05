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

Route::apiResources([
    '/action' => ActionController::class,
    '/data' => DataController::class,
    '/data_user' => DataUserController::class,
    '/employee' => EmployeeController::class,
    '/type_action' => TypeActionController::class,
]);// Базовые маршруты всех конроллеров

Route::get('/data/indexUser/{id}',[DataController::class, 'indexUser']); //Маршрут для вывода данных определенного пользователя
Route::post('/sing_up',[EmployeeController::class, 'sing_up']); // Маршрут для регистрация пользователя
Route::post('/sing_in',[EmployeeController::class, 'sing_in']); // Маршрут для авторизации пользователя
Route::post('/logout',[EmployeeController::class, 'logout']); // Маршрут для выхода из аккаунта