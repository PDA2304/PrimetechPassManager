<?php

namespace App\Http\Helpers;

use Illuminate\Http\Exceptions\HttpResponseException;

/**
 *     Класс отвечающи за логические проверки
*/
class CheckHelpers
{
    /**
     *  Функция отвечающая за проверку нахождения элемента в таблице,
     *  если в переменной date передается null вы вызываем иеслючение
     *  и выдаем ошибку в ответе что данные были не найдены, если
     *  данные были найдены то мы их воращаем обратно для каких либо
     *  действий над ними.
     */
    static function  extension($date = null)
    {
        if ($date == null)
            throw new HttpResponseException(response()->json(['error' => 'Данные были не найдены'], 404));
        else
            return $date;
    }
}
