<?php

namespace App\Http\Controllers;

use App\Http\Helpers\CheckHelpers;
use App\Http\Requests\TypeActionRequest;
use App\Http\Resources\TypeActionResource;
use App\Models\TypeAction;

class TypeActionController extends Controller
{
    /**
     * Вывод всех данных из таблицы 
     */
    public function index()
    {
        $result = TypeActionResource::collection(TypeAction::all());
        return response()->json($result, 200);
    }

    /**
     * Добавление данных в таблицу
     */
    public function store(TypeActionRequest $request)
    {
        $result = TypeAction::create($request->all());
        $request->action_name = strtolower($request->action_name);
        return response()->json(new TypeActionResource($result), 200);
    }

    /**
     *  Вывод строки по его id
     */
    public function show($id)
    {
        $result = CheckHelpers::extension(TypeAction::find($id));
        return response()->json(new TypeActionResource($result), 200);
    }

    /**
     *  Изменние данных по id
     */
    public function update(TypeActionRequest $request, $id)
    {
        $result = CheckHelpers::extension(TypeAction::find($id));
        $request->action_name = strtolower($request->action_name);
        $result->update($request->all());
        return response()->json(new TypeActionResource($result));
    }

    /**
     *  Удаление данных по определенному id
     */
    public function destroy($id)
    {
        $result = CheckHelpers::extension(TypeAction::find($id),null);
        $result->delete();
        return response()->json(new TypeActionResource($result), 200);;
    }
}
