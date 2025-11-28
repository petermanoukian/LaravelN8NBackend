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
        Schema::table('basers', function (Blueprint $table) {
                $table->unsignedBigInteger('catid'); // ✅ not nullable

                $table->foreign('catid')
                    ->references('id')
                    ->on('cats')
                    ->onDelete('cascade'); // delete basers if cat is deleted
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('basers', function (Blueprint $table) {
            $table->dropForeign(['catid']);
            $table->dropColumn('catid');
        });
    }
};
