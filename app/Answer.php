<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Answer extends Model
{
    public function question(){
        return $this->belongsTo('App\Question');
    }

    public function test_users(){
        return $this->belongsToMany('App\TestUser');
    }
}
