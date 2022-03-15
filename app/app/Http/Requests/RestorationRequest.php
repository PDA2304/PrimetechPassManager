<?php

namespace App\Http\Requests;

use App\Models\Data;
use Illuminate\Foundation\Http\FormRequest;

class RestorationRequest extends ApiRequest
{
    
    public function rules()
    {
        return [
            "data_selection" => "required|array",
            "data_selection.*.id"=> ["integer","required",function ($attribute, $value, $fail) {
                if(!is_numeric($value))return;
                if (!Data::where('id', '=', $value)->where("logic_delete",1)->first()) {
                    $fail('Таких данных нет');
                }   
            }]
        ];
    }
}
