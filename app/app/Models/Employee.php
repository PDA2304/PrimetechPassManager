<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


/**
 * Модель для таблицы Employee
 */
class Employee extends Model
{
    use HasFactory;

    protected $table = 'employees';

    protected $filable = [
        'id',
        'user_name',
        'token',
        'login',
        'password',
    ];

    protected $hiden = [
        'created_at',
        'updated_at',
    ];

}
