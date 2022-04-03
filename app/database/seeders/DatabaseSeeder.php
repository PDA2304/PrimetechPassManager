<?php

namespace Database\Seeders;

use App\Models\Employee;
use App\Models\TypeAction;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

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
            'Данные были перемещены в корзину',
            'Данные были восстановлены',
            'Данные были изменены',
            'Доступ к данным был увеличен',
            'Доступ к данным был уменьшен',
        );

        foreach ($typeActionName as $key) {
            TypeAction::create(
                [
                    'action_name' => $key
                ]
            );
        }

        $employee = new Employee();

        $employee->create([
            'role' => true,
            'user_name' => 'administrator',
            'login' => 'admin',
            'password' => Hash::make('admin'),
        ]);

        DB::statement('
                CREATE OR REPLACE FUNCTION history()
                    RETURNS trigger
                    LANGUAGE plpgsql
                    COST 100
                    VOLATILE NOT LEAKPROOF
                AS $$
                declare
                begin
                    if(TG_OP = \'INSERT\') then
                    INSERT INTO public.actions(
                        action_date, user_id, type_action_id,data_id)
                        VALUES (clock_timestamp(), NEW.user_id, 1,NEW.id);
                        return NEW;
                    end if;
                    if(TG_OP = \'UPDATE\') then
                        if(NEW.name != OLD.name OR NEW.login != OLD.login OR NEW.password != OLD.password OR NEW.description != OLD.description)
                        then 
                            INSERT INTO public.actions(
                            action_date, user_id, type_action_id,data_id)
                            VALUES (clock_timestamp(), OLD.user_id, 4,OLD.id);
                        return NEW;
                        end if;
                            
                        if(NEW.logic_delete = false) 
                        then 
                            INSERT INTO public.actions(
                            action_date, user_id, type_action_id,data_id)
                            VALUES (clock_timestamp(), OLD.user_id, 3,OLD.id);
                        end if;
                        
                        if(NEW.logic_delete = true) 
                        then 
                            INSERT INTO public.actions(
                            action_date, user_id, type_action_id,data_id)
                            VALUES (clock_timestamp(), OLD.user_id, 2,OLD.id);
                        end if;
                        
                        RETURN NULL;
                    end if;
                    
                end;
                $$;
        ');

        DB::statement('  
            CREATE TRIGGER history
            After INSERT OR UPDATE 
            ON data
            FOR EACH ROW
            EXECUTE FUNCTION history();
        ');
    }
}
