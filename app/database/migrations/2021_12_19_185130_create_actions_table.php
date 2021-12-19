<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateActionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('actions', function (Blueprint $table) {
            $table->id();
            $table->date('action-date');
            $table->integer('user_id');
            $table->integer('type_action_id');
            $table->timestamps();
            
            $table->foreign('user_id')->references('id')->on('employees')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('type_action_id')->references('id')->on('type_actions')->onDelete('cascade')->onUpdate('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('actions');
    }
}
