<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TestUser extends Model
{
    public function user(){
        return $this->belongsTo('App\User');
    }

    public function test(){
        return $this->belongsTo('App\Test');
    }

    public function answers(){
        return $this->belongsToMany('App\Answer')->withPivot('question_id');;
    }

    public function questions(){
        return $this->belongsToMany('App\Question');
    }
}
