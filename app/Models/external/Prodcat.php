<?php

namespace App\Models\external;

use Illuminate\Database\Eloquent\Model;
use App\Models\Traits\FriendlyMime;
use Illuminate\Database\Eloquent\Relations\HasMany;
use App\Models\external\Prod;

class Prodcat extends Model
{
    use FriendlyMime;

    protected $table = 'prodcats';
    protected $fillable = [
        'originid',
        'name',
        'des',
        'dess',
        'filer',
        'filename',
        'fileurl',
        'mime',
        'sizer',
        'extension',
    ];

    // Relation: one category has many products
    public function prods()
    {
        return $this->hasMany(Prod::class, 'catid', 'originid');
    }

}

