<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use Illuminate\Http\Request;


/**
 * Контроллер отвечающий за взаимодействия с таблицей Employee
 */
class EmployeeController extends Controller
{
    /**
     * Вызов всех пользователей
     */
    public function index()
    {
        //
    }

    /**
     * Добавление сотрудника то есть его регистрация
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Вывоз сотрудника по его id
     */
    public function show($id)
    {
        //
    }

    /**
     * Изменнение данных сотрудника
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Удаление сотрудника по его id
     */
    public function destroy($id)
    {
        //
    }
}
