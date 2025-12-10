<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Cat;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Baser extends Model
{
     
    use HasFactory;
    
    protected $fillable = [
        'name', 'catid',
        'img',
        'img2',
        'filer',
        'des',
        'dess',
    ];


    public function cat()
    {
        return $this->belongsTo(Cat::class, 'catid'); // explicit foreign key
    }
}
