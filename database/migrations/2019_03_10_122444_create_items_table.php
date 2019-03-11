<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('items', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->string('title');
            $table->string('slug');
            $table->string('image')->nullable();
            $table->string('link')->nullable();
            $table->text('position')->nullable();

            
            $table->text('body1')->nullable();
            $table->text('teaser1')->nullable();
            $table->text('body2')->nullable();
            $table->text('teaser2')->nullable();
            $table->text('body3')->nullable();
            $table->text('teaser3')->nullable();

            $table->string('area2')->nullable();
            $table->string('area3')->nullable();
            $table->string('area4')->nullable();
            $table->string('area5')->nullable();
            $table->string('area6')->nullable();
            $table->string('area7')->nullable();
            $table->string('area8')->nullable();
            $table->string('area9')->nullable();
            $table->string('area10')->nullable();
            $table->string('loader')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('items');
    }
}
