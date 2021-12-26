<?php

namespace Database\Seeders;

use App\Models\TypeAction;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();

        $typeActionName = [
            'Добавление',
            'Удаленние',
            'Изменнение пароля',
            'Изменнение логина',
            'Изменнение названиая данных'
        ];

        foreach ($typeActionName as $key) {
            TypeAction::created(
                [
                    'action_name' => $key
                ]
            );
        }
       
    }
}
