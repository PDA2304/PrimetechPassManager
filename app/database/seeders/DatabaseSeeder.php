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

        $typeActionName = array(
            'Добавление',
            'Удаленние',
            'Изменнение пароля',
            'Изменнение логина',
            'Изменнение названия данных'
        );

        foreach ($typeActionName as $key) {
            TypeAction::create(
                [
                    'action_name' => $key
                ]
            );
        }
       
    }
}
