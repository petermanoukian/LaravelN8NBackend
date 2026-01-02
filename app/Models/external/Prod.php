<?php

namespace App\Models\external;

use Illuminate\Database\Eloquent\Model;
use App\Models\Traits\FriendlyMime;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use App\Models\external\Prodcat;

class Prod extends Model
{
    use FriendlyMime;

    protected $table = 'prods';

    protected $fillable = [
        'originid',
        'eventtype',
        'catid',
        'name',
        'des',
        'dess',
        'filer',
        'filename',
        'fileurl',
        'mime',
        'sizer',
        'extension',
        'img',
        'img2',
    ];

    // Relation: product belongs to one category
    public function prodcat()
    {
        return $this->belongsTo(Prodcat::class, 'catid', 'originid');
    }

}
