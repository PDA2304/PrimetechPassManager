<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Helpers\CheckHelpers;
use App\Http\Requests\RequestCreateData;
use App\Http\Requests\RequestUpdateData;
use App\Http\Requests\DataSelectRequest;
use App\Http\Resources\DataResource;
use App\Http\Resources\IndexDataResource;
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
        return response()->json($result, 200);
    }

    /**
     * Выводит данные определенного пользователя
     */
    public function indexUser($id)
    {
        $result = IndexDataResource::collection(Data::where("user_id", "=", $id)->where("logic_delete", 0)->get());
        return response()->json($result, 200);
    }

    /**
     * Добавление новых данных пользователя
     */
    public function store(RequestCreateData $request)
    {
        $result = Data::create($request->all());
        return response()->json(new DataResource($result), 200);
    }

    /**
     *  Вывод данных по id 
     */
    public function show($id)
    {
        $result = CheckHelpers::extension(Data::find($id));
        return response()->json(new DataResource($result), 200);
    }

    /**
     * Редактирование данных пользователя 
     */
    public function update(RequestUpdateData $request, $id)
    {
        $result = CheckHelpers::extension(Data::find($id));
        $result->update($request->all());
        return response()->json(new DataResource($result));
    }

    // Вывод логически удаленных данных
    public function indexLogicDelete($id)
    {
        $result = CheckHelpers::extension(IndexDataResource::collection(Data::all()->where("user_id", "=", $id)->where("logic_delete", 1)));
        return response()->json($result, 200);
    }

    // Логическое удаление
    public function logicDelete($id)
    {
        $result = CheckHelpers::extension(Data::find($id));
        $result->logic_delete = true;
        $result->save();
    }

    // Логическое восстановление одних данных
    public function logicRestorationData($id)
    {
        $result = CheckHelpers::extension(Data::find($id));
        $result->logic_delete = false;
        $result->save();
    }

    // Логическое восстановление всех данных
    public function logicRestorationDataAll($id)
    {
        $result =  Data::where("user_id", "=", $id)->where('logic_delete', 1);
        $result->update(['logic_delete' => 0]);
        return response()->json($result);
    }

    // Логическое восстановление выбранных данных
    public function logicRestorationDataSelection(DataSelectRequest $request)
    {
        $count = 0;
        foreach ($request->data_selection as $key) {
            Data::whereId($key)->update(["logic_delete" => 0]);
        }
        return response()->json();
    }

    /**
     * Удаление всех данных в корзине
     */
    public function destroyDataAll($id)
    {
        $result =  Data::where("user_id", "=", $id)->where('logic_delete', 1);
        $result->delete();
        return response()->json($result);
    }

    /**
     * Удаление выбранных данных пользователя
     */
    public function destroyDataSelect(DataSelectRequest $request, $id)
    {
        foreach ($request->data_selection as $key) {
            Data::whereId($key)->delete();
        }
        return response()->json();
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
