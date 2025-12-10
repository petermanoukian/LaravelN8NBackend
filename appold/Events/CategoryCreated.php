<?php

namespace App\Events;

use App\Models\Cat;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class CategoryCreated
{
    use Dispatchable, SerializesModels;

    public $category;

    /**
     * Create a new event instance.
     */
    public function __construct(Cat $category)
    {
        $this->category = $category;
    }
}
