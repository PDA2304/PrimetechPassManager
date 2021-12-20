<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DataUser extends Model
{
    use HasFactory;

    protected $table = 'data_users';

    protected $fillable = [
        'id',
        'data_id',
        'user_id',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
    ];
}
