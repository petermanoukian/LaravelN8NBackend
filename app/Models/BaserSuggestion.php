<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BaserSuggestion extends Model
{
    protected $fillable = [
        'baser_id', 'sheetid',
        'name',
        'des',
        'published',
    ];

    public function baser()
    {
        return $this->belongsTo(Baser::class);
    }
}
