<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    public function test()
    {
        return $this->belongsTo('App\Test');
    }

    public function answers(){
        return $this->hasMany('App\Answer');
    }

    public function test_users(){
        return $this->belongsToMany('App\TestUser');
    }
}
