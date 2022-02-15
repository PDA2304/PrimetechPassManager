<?php

namespace App\Http\Requests;

use App\Models\Employee;
use Illuminate\Foundation\Http\FormRequest;

class AuthorizationRequest extends ApiRequest
{
    public function rules()
    {
        return [
            'login' => ["required", "min:3", "max:30", function ($attribute, $value, $fail) {
                if (!Employee::where('login', '=', $value)->first()) {
                    $fail('Такого логина нет в системе');
                }
            }],
            'password' => ["required", "max:16"]
        ];
    }

    public function attributes()
    {
        return [
            "login"=>'логин',
            "password"=>'пароль',
        ];
    }
}
