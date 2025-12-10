<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use App\Models\Baser;

class Cat extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'department',
        'img',
        'img2',
        'filer',
    ];

    public function basers()
    {
        return $this->hasMany(Baser::class, 'catid'); // explicit foreign key
    }

}