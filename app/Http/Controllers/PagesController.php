<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Auth;

class PagesController extends Controller
{

    public function index(){
        $title = 'Welcome to LearnOn';
        return view('welcome')->with('title', $title);
    }
    
    
    public function about(){
        $title = 'About Us';
        return view('pages.about')->with('title', $title);
    }

/*     public function contact(){
        $title = 'Contact';
        return view('pages.contact')->with('title', $title);
    } */

    public function addLesson(){
        $course = Session::get('course');
        return view('courses.addLesson')->with([
            'success' => 'Course created',
            'course' => $course,
            'user' => Auth::user()
        ]);
    }
}
