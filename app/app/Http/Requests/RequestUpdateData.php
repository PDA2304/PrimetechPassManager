<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RequestUpdateData extends FormRequest
{
    public function rules()
    {
        return [
            'name' => ["required", "min:3","max:30"],
            'login' => ["required", "min:3","max:30"],
            'password' => ["required", "min:8","max:16"],
            'description' => ["min:8","max:250"],
        ];
    }

    public function attributes()
    {
        return [
            "name"=>'название',
            "login"=>'логин',
            "password"=>'пароль',
            "description"=>'комментарий',
        ];
    }
}
