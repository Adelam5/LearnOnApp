<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    public function course(){
        $this->belongsTo(Course::class);
    }

    public function user(){
        $this->belongsTo(User::class);
    }
}
