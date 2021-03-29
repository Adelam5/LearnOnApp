<?php

namespace App\Http\Controllers;

use Stripe\SetupIntent;
use Laravel\Cashier\Cashier;
use Illuminate\Http\Request;
use App\User;
use App\Category;
use App\Post;

class DashboardController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    

    public function dashboard()
    {
        $user_id = auth()->user()->id;
        $user = User::find($user_id);
        return view('users.dashboard')->with([
            'user' => $user,
            'posts' => $user->posts()]);
    }

    public function profile(){
        $user_id = auth()->user()->id;
        $user = User::find($user_id);
        return view('users.profile')->with('user', $user);
    }

    public function edit(){
        $user_id = auth()->user()->id;
        $user = User::find($user_id);
        return view('users.edit')->with('user', $user);
    }

    public function update(Request $request, User $user)
    {

        $this->validate($request, [
            'avatar' => 'image|nullable|max:1999'
        ]);
        // Handle File Upload
        if($request->hasFile('avatar')){
            $filenameWithExt = $request->file('avatar')->getClientOriginalName();
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            $extension = $request->file('avatar')->getClientOriginalExtension();
            $fileNameToStore = $filename.'_'.time().'.'.$extension;
            $path = $request->file('avatar')->storeAs('public/images', $fileNameToStore);
        }

        $user->name = $request->name;
        $user->email = $request->email;
        if($request->hasFile('avatar')){
            Storage::delete('public/images/'.$post->avatar);
            $post->avatar = $fileNameToStore;
        }
        if($user->save()){
            $request->session()->flash('success', $user->name.' has been updated');
        } else {
            $request->session()->flash('error', 'There was an error updating '.$user->name);
        }
        
        return redirect()->back();
    }


}
