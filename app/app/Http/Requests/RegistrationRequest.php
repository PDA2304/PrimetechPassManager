<?php

namespace App\Http\Requests;

use App\Models\Employee;
use Illuminate\Foundation\Http\FormRequest;

class RegistrationRequest extends ApiRequest
{
    public function rules()
    {
        return [
            'user_name' => ["required", "min:3","max:30"],
            'login' => ["required", "min:3","max:30",function ($attribute, $value, $fail) {
                if (Employee::where('login', '=', $value)->first()) {
                    $fail('Taкой логин уже используется другим пользователем');
                }
            }],
            'password' => ["required",'min:8', "max:16"]
        ];
    }
}
