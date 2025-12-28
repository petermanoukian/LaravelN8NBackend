<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('prodcats', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('originid')->unique(); // external ID from Laravel 2
            $table->string('name')->nullable();
            $table->text('des')->nullable();
            $table->longText('dess')->nullable();
            $table->string('filer')->nullable();
            $table->string('filename')->nullable();
            $table->string('fileurl')->nullable();
            $table->string('mime')->nullable();
            $table->string('sizer')->nullable();
            $table->string('extension')->nullable();
            $table->timestamps();
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('prodcats');
    }
};

