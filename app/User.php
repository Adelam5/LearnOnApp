<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Cashier\Billable;

class User extends Authenticatable
{
    use Notifiable, Billable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function roles(){
        return $this->belongsToMany('App\Role');
    }



    public function hasAnyRoles($roles){
        if($this->roles()->whereIn('name', $roles)->first()){
            return true;
        }
        return false;
    }

    public function hasRole($role){
        if($this->roles()->where('name', $role)->first()){
            return true;
        }
        return false;
    }

    public function posts(){
        return $this->hasMany('App\Post')->orderBy('created_at', 'DESC')->paginate(10);
    }

    public function getRouteKeyName(){
        return 'id';
    }


    public function comments()
    {
        return $this->hasMany('App\Comment');
    }

    public function authors()
    {
        return $this->hasMany('App\Course', 'user_id', 'id');
    }

    public function courses()
    {
        return $this->belongsToMany('App\Course')->withPivot('percent');
    }

    public function reviews()
    {
        return $this->hasMany('App\Review');
    }

    public function tests()
    {
        return $this->belongsToMany('App\Test');
    }

    public function test_users(){
        return $this->hasMany('App\TestUser');
    }

    public function lessons()
    {
        return $this->belongsToMany('App\Lesson')->withPivot('completed');
    }

    public function isSubscribed(){
        $key = \config('services.stripe.secret');
        $stripe = new \Stripe\StripeClient($key);
        $plansraw = $stripe->plans->all(['product' => 'prod_Il9nswaWzwDz19']);
        $plans = $plansraw->data;
        $user = $this;
        foreach($plans as $plan){
            if($user->subscribedToPlan($plan->id, 'main')){
                return true;
            }
        }
        return false;

        /* if(($user->subscribedToPlan('price_1I9dU0ED8dpSHnI3I1CXIKFw', 'main'))||($user->subscribedToPlan('price_1I9dU0ED8dpSHnI3Dgzjt6SP', 'main'))||($user->subscribedToPlan('price_1IJG6ZED8dpSHnI3BAIvHwQf', 'main'))){
            return true;
        }
        else return false; */
    }
}
