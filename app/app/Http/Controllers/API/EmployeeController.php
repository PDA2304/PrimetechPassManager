<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\RegistrationRequest;
use App\Http\Resources\EmployeeResource;
use App\Models\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

/**
 * Контроллер отвечающий за взаимодействия с таблицей Employee
 */
class EmployeeController extends Controller
{
    /**
     * Вызов всех пользователей
     */
    public function index()
    {
        //
    }

    /**
     * Добавление сотрудника то есть его регистрация
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Вывоз сотрудника по его id
     */
    public function show($id)
    {
        //
    }

    /**
     * Изменнение данных сотрудника
     */
    public function update(Request $request, $id)
    {
        //
    }


    public function sing_up(RegistrationRequest $request)
    {
        $result = Employee::create([
            'user_name' => trim($request->user_name),
            'login' => trim($request->login),
            'password' => Hash::make(trim($request->password)),
        ]);
        return response()->json(new EmployeeResource($result),200);
    }

    /**
     * Удаление сотрудника по его id
     */
    public function destroy($id)
    {
        //
    }
}
