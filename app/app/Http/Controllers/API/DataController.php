<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Helpers\CheckHelpers;
use App\Http\Requests\RequestCreateData;
use App\Http\Requests\RequestUpdateData;
use App\Http\Resources\DataResource;
use App\Models\Data;
use Illuminate\Http\Request;

class DataController extends Controller
{
    /**
     * Вывод всех данных пользователей
     */
    public function index()
    {
        $result = DataResource::collection(Data::all());
        return response()->json($result,200);
    }

    /**
     * Выводит данные определенного пользователя
     */
    public function indexUser ($id)
    {
        $result = DataResource::collection(Data::where("user_id","=",$id)->get());
        return response()->json($result,200);
    }

    /**
     * Добавление новых данных пользователя
     */
    public function store(RequestCreateData $request)
    {
        $result = Data::create($request->all());
        return response()->json(new DataResource($result),200);
    }

    /**
     *  Вывод данных по id 
     */
    public function show($id)
    {
        $result = CheckHelpers::extension(Data::find($id));
        return response()->json(new DataResource($result),200);
    }

    /**
     *
     */
    public function update(RequestUpdateData $request,$id)
    {
        $result = CheckHelpers::extension(Data::find($id));
        $result->update($request->all());
        return response()->json(new DataResource($result));
    }

    /**
     *  Удаление данных по пользователю
     */
    public function destroy($id)
    {
        $result = CheckHelpers::extension(Data::find($id));
        $result->delete();
        return response()->json(new DataResource($result), 200);;
    }
}
