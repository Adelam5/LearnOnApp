<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{


    public function user(){
        return $this->belongsTo('App\User');
    }

    public function categories(){
        return $this->belongsToMany('App\Category');
    }

    public function getPostsByCategory($category){
         return $this->categories()->where('name', $category)->get();
    }

    public function comments()
    {
        return $this->hasMany('App\Comment');
    }
}
