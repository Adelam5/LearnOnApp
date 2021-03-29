<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    public function user()
    {
        return $this->belongsTo('App\User');
    }

    public function users()
    {
        return $this->belongsToMany('App\User')->withPivot('percent', 'created_at');
    }

    public function reviews()
    {
        return $this->hasMany('App\Review');
    }

    public function lessons()
    {
        return $this->hasMany('App\Lesson');
    }

    public function test()
    {
        return $this->hasOne('App\Test');
    }
}
