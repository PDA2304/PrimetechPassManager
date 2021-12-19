<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Action extends Model
{
    use HasFactory;

    
    protected $table = 'actions';

    protected $fillable = [
        'id',
        'action_date',
        'user_id',
        'type_action_id',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
    ];
}
