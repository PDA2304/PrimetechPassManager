<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\AuthorizationRequest;
use App\Http\Requests\RegistrationRequest;
use App\Http\Resources\EmployeeResource;
use App\Models\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
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
        $result = Employee::all();
        return response()->json($result, 200);
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

    public function EmployeeSearch($test)
    {
        if (trim($test) == '')
            return response()->json('Пользователь ничего не ввел', 422);
        $searchTerm = $test . '%';
        $result = Employee::where('login', 'ilike', $searchTerm)->get();
        return response()->json($result, 200);
    }

    /**
     * Отправка кода подтверждения на почту
     */
    public function email_confirmation(RegistrationRequest $request)
    {
        $mail_data = ["number" => random_int(10000, 99999)];

        Mail::send('email', $mail_data, function ($message) use ($request) {
            $message->sender("isip_d.a.pahomov@mpt.ru");
            $message->to($request->login);
            $message->subject("PrimetechPassManager подтвеждение почты");
        });

        return response()->json($mail_data, 200);
    }

    /**
     * Регистрация пользователя
     */
    public function sing_up(RegistrationRequest $request)
    {
        $result = Employee::create([
            'user_name' => trim($request->user_name),
            'login' => trim($request->login),
            "token" => Str::random(100),
            'password' => Hash::make(trim($request->password)),
        ]);
        return response()->json(new EmployeeResource($result), 200);
    }

    /**
     * Авторизация пользователя
     */
    public function sing_in(AuthorizationRequest $request)
    {
        $user = Employee::where('login', $request->login)->first();
        if (!Hash::check($request->password, $user->password)) {
            return response()->json(['password' => ["Не верный пароль"]], 422);
        }
        $user->token = Str::random(100);
        $user->save();
        return response()->json([
            "id" => $user->id,
            "user_name" => $user->user_name,
            'role' => $user->role,
            "token" => $user->token
        ], 200);
    }


    /**
     * Выход из системы
     */
    public function logout(Request $request)
    {
        $user = Employee::where('id', $request->id)->first();

        if ($user->token == null)
            return response()->json(["message" => "Пользователь не авторизован"], 400);

        $user->token = null;
        $user->save();
        return response()->json(["message" => "Пользователь вышел из системы"], 200);
    }

    /**
     * Удаление сотрудника по его id
     */
    public function destroy($id)
    {
        //
    }
}
