<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\ActionDataShowResources;
use App\Models\Action;
use Illuminate\Http\Request;


class ActionController extends Controller
{
    public function index()
    {
    }

    /**
     * Добавление данных в таблицу
     */
    public function store(Request $request)
    {
    }

    /**
     *  Вывод строки по его id
     */
    public function show($id)
    {

    }

    /**
     * Вывод истории по определенным данным
     */
    public function dataShow($id)
    {
        $result = Action::where("data_id", "=", $id)->get();

        
        return response()->json(ActionDataShowResources::collection($result), 200);
    }

    /**
     *  Изменние данных по id
     */
    public function update(Request $request, $id)
    {
    }

    /**
     *  Удаление данных по определенному id
     */
    public function destroy($id)
    {
    }
}
