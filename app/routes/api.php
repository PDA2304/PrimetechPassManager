<?php

use App\Http\Controllers\API\ActionController;
use App\Http\Controllers\API\DataController;
use App\Http\Controllers\API\DataUserController;
use App\Http\Controllers\API\EmployeeController;
use App\Http\Controllers\API\TypeActionController;
use App\Models\Employee;
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

#region Маршруты к контроллеру Data
Route::get('/data/indexLogicDelete/{id}',[DataController::class, 'indexLogicDelete']); // Маршрут для вывода удаленных данных пользователя
Route::get('/data/indexUser/{id}',[DataController::class, 'indexUser']); //Маршрут для вывода данных определенного пользователя
Route::post('/data/logicDelete/{id}',[DataController::class, 'logicDelete']); // Маршрут для логического удаления данных
Route::post('/data/logicRestorationDataAll/{id}',[DataController::class, 'logicRestorationDataAll']); // Маршрут для логического востановления данных
Route::post('/data/logicRestorationDataSelection',[DataController::class, 'logicRestorationDataSelection']); // Маршрут для восстановления выбранных данных
Route::delete('/data/destroyDataAll/{id}',[DataController::class,'destroyDataAll']); // Маршрут для удаления всей корзины
Route::delete('/data/destroyDataSelect/{id}',[DataController::class,'destroyDataSelect']); // Маршрут для удаления выбранных данных в корзине
#endregion

#region Маршруты к контроллеру Employee
Route::post('/sing_up',[EmployeeController::class, 'sing_up']); // Маршрут для регистрация пользователя
Route::post('/sing_in',[EmployeeController::class, 'sing_in']); // Маршрут для авторизации пользователя
Route::post('/email_confirmation',[EmployeeController::class,'email_confirmation'],); // Маршрут для подтверждения почты
Route::post('/logout',[EmployeeController::class, 'logout']); // Маршрут для выхода из аккаунта
Route::post('/EmployeeSearch/{login}',[EmployeeController::class,'EmployeeSearch']);// поиск пользователя по логину
#endregion

Route::get('/dataShow/{id}',[ActionController::class,'dataShow']);// Вывод истории по данным пользователя