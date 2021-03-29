<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Auth;
use App\Test;
use App\User;
use App\TestUser;
use App\Course;

class TestsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = Auth::user();
        $allTests = Test::all();
        $myTests = $user->test_users;
        return view('users.mytests')->with([
            'allTests' => $allTests,
            'myTests' => $myTests, 
            'user' => $user
        ]);
    }

    public function tests_management(){
        $tests = Test::all();
        $users = User::all();
        return view('users.tests')->with([
            'user' => Auth::user(),
            'tests' => $tests,
            'users' => $users
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
       /*  $course = Session::get('course');
       // dd($course);
        return view('courses.addTest')->with([
            'user' => Auth::user(),
            'course' => $course
        ]); */
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required',
        ]);
        //Create Test
        $course_id = $request->input('course_id');
        $course = Course::find($course_id);
        $test = new Test;
        $test->course_id = $course_id;
        $test->title = $request->input('title');
        $test->description = $request->input('description');
        $test->save();
        return view('courses/addQuest')->with([
            'course' => $course,
            'user' => Auth::user(),
            'success' => 'Test created',
            'test' => $test
        ]);
        /* return redirect()->back()->with([
            'success' => 'Test created',
            'course' => $course,
            'user' => Auth::user()
        ]); */
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $testUser = TestUser::find($id);
        //dd($testUser);
        $test = Test::find($testUser->test_id);
        return view('users.test')->with([
            'test' => $test,
            'testUser' => $testUser,
            'user' => Auth::user()
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $test = Test::find($id);
        $test->title = $request->input('title');
        $test->description = $request->input('description');
        $test->save();
        return redirect()->back()->with('success', 'Test is updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
