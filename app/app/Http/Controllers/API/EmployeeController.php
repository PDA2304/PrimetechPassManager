<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\AuthorizationRequest;
use App\Http\Requests\RegistrationRequest;
use App\Http\Resources\EmployeeResource;
use App\Models\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

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
        return response()->json(new EmployeeResource($result), 200);
    }

    public function sing_in(AuthorizationRequest $request)
    {
        $user = Employee::where('login', $request->login)->first();
        if(!Hash::check($request->password,$user->password))
        {
            return response()->json(['password'=> ["Не верный пароль"]], 422);
        }
        $user->token = Str::random(100);
        $user->save(); 
        return response()->json([
            "id"=> $user->id,
            "user_name" => $user->user_name,
            'role' => $user->role,
            "token" => $user->token
        ], 200);
    }


    public function logout(Request $request)
    {
        $user = Employee::where('user_name', $request->user_name)->first();

        if ($user->token == null)
            return response()->json(["message" => "Пользователь не авторизован"], 400);

        $user->token = null;
        $user->save();
        return response()->json(["message" =>"Пользователь вышел из системы"], 200);
    }

    /**
     * Удаление сотрудника по его id
     */
    public function destroy($id)
    {
        //
    }
}
