<?php

namespace App\Http\Requests;

use App\Models\Employee;
use Illuminate\Foundation\Http\FormRequest;

class RequestCreateData extends ApiRequest
{
    public function rules()
    {
        return [
            'name' => ["required", "min:3","max:30"],
            'login' => ["required", "min:3","max:30"],
            'password' => ["required", "min:8","max:16"],
            'description' => ["min:8","max:250"],
            'user_id' => ["required", 'integer',function ($attribute, $value, $fail) {
                if(!is_numeric($value))return;
                if (!Employee::where('id', '=', $value)->first()) {
                    $fail('Taкого пользователя нет в системе');
                }
            }],
        ];
    }
}
