<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    public function posts(){
        return $this->belongsToMany('App\Post')->orderBy('created_at', 'DESC')->paginate(9);
    }

    public function getRouteKeyName(){
        return 'name';
    }
}
