<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Jenssegers\Date\Date;

class ActionDataShowResources extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            "action_date" => Date::parse($this->action_date)->format('j F Y') ,
            "empoyee" => new EmployeeResource($this->employee),
            "type_action_name" => $this->action->action_name,
        ];
    }
}
