<?php

namespace App\Http\Requests;

use App\Models\TypeAction;

class TypeActionRequest extends ApiRequest
{
    public function rules()
    {
        return [
            'action_name' => ["required", "max:30", 'alpha_spaces', function ($attribute, $value, $fail) {
                if (TypeAction::where('action_name', '=', $value)->first()) {
                    $fail('Такой название уже есть');
                }
            }]
        ];
    }
}
