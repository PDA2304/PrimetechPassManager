<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Data extends Model
{
    use HasFactory;

    protected $table = 'data';

    protected $fillable = [
        'id',
        'name',
        'login',
        'password',
        'logic_delete',
        'description',
        'user_id',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
    ];

    public function employee()
    {
        return $this->HasOne(Employee::class, 'id', 'user_id');
    }
}
