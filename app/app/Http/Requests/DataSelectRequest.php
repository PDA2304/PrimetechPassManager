<?php

namespace App\Http\Requests;

use App\Models\Data;
use Illuminate\Foundation\Http\FormRequest;

class DataSelectRequest extends ApiRequest
{
    
    public function rules()
    {
        return [
            "data_selection" => "required|array",
            "data_selection.*"=> ["integer","required",function ($attribute, $value, $fail) {
                if(!is_numeric($value))return;
                if (!Data::where('id', '=', $value)->where("logic_delete",1)->first()) {
                    $fail('Таких данных нет');
                }   
            }]
        ];
    }
}
