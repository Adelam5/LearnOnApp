<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateForeignKeysForAnswerTestUserTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('answer_test_user', function (Blueprint $table) {
            $table->foreign('test_user_id')->references('id')->on('test_users')->onDelete('cascade')->change();
            $table->foreign('question_id')->references('id')->on('questions')->onDelete('cascade')->change();
            $table->foreign('answer_id')->references('id')->on('answers')->onDelete('cascade')->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('answer_test_user', function (Blueprint $table){
            $table->dropForeign('answer_test_user_test_user_id_foreign');
            $table->dropForeign('answer_test_user_question_id_foreign');
            $table->dropForeign('answer_test_user_answer_id_foreign');
        });
    }
}
