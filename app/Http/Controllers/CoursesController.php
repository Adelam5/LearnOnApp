<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Course;
use App\TestUser;
use App\Test;
use App\Answer;
use App\Lesson;
use Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;

class CoursesController extends Controller
{


    public function __construct()
    {
        $this->middleware('auth', ['except' => ['show', 'index', 'archive']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $courses = Course::all();
        return view('courses.index')->with('courses', $courses);
    }

    public function mycourses()
    {
        $user = Auth::user();
       // $authors = $user->authors;
        return view('users.mycourses')->with([
            'user'=> $user,
            'authors' => $user->authors,
            'courses' => $user->courses

        ]);
    }

    public function active()
    {
        $courses = Course::all()->where('status', '=', 1)->sortByDesc('created_at');
        $latest = $courses->splice(0,2);
        $latest->all();
        return view('courses.index')->with([
            'courses' => $courses,
            'latest' => $latest
        ]);
    }

    public function archive()
    {
        $courses = Course::all()->where('status', '=', 0)->sortByDesc('created_at');
        $latest = $courses->splice(0,2);
        $latest->all();
        return view('courses.index')->with([
            'courses' => $courses,
            'latest' => $latest
        ]);
    }

    public function courses_management(){
        $courses = Course::all()->sortByDesc('crated_at');
        return view('users.courses')->with([
            'user' => Auth::user(),
            'courses' => $courses
        ]);
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('courses.create');
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
            'cover_image' => [
                Rule::dimensions()->maxWidth(1900)->maxHeight(800),
            ]
        ]);

        // Handle File Upload
        if($request->hasFile('cover_image')){
            $filenameWithExt = $request->file('cover_image')->getClientOriginalName();
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            $extension = $request->file('cover_image')->getClientOriginalExtension();
            $fileNameToStore = $filename.'_'.time().'.'.$extension;
            $path = $request->file('cover_image')->storeAs('public/images', $fileNameToStore);
        }

        //Create Course
        $course = new Course;
        $course->user_id = Auth::id();
        $course->title = $request->input('title');
        $course->description = $request->input('description');
        $course->status = $request->input('status');
        if($request->hasFile('cover_image')){
            Storage::delete('public/images/'.$course->cover_image);
            $course->cover_image = $fileNameToStore;
        }
        $course->save();
        Session::put('course', $course);
        return redirect('courses/addLesson')->with([
            'success' => 'Course created',
            'course' => $course,
            'user' => Auth::user()
        ]);
    }

    public function enroll(Request $request, $id){
        $course = Course::find($id);
        $course->users()->attach(Auth::id());
        return redirect()->back()->with('success', 'Enrolled successfully');
    }

    public function storeTestResult(Request $request){
        
        $test_id = $request->input('test_id');
        $test = Test::find($test_id);
        $correctNum = 0;
        $questNum = $test->questions->count();
        if(isset($request->qa)){
            foreach($request->qa as $answer){
                $correctNum = $correctNum + Answer::find($answer)->correct;
            }
        }
        $result = ($correctNum / $questNum) * 100;
        $user = Auth::user();
        $testUser = new TestUser;
        $testUser->user()->associate($user);
        $testUser->test()->associate($test);
        $testUser->result = round($result);
        $testUser->save();
        if(isset($request->qa)){
            foreach($request->qa as $question => $answer){
                $testUser->answers()->attach($answer, ['question_id' => $question]);
            }
        }

         $course = $test->course;/*
        foreach($user->courses as $item){
            if($item->pivot->course_id == $course->id){
                $percent = $item->pivot->percent;
            }
        }
        $add = 100 - $percent;
        if($result>75){
            $user->courses()->updateExistingPivot($course->id, ['percent' =>  $percent + $add]);
        } */

        $user->courses()->updateExistingPivot($course->id, ['percent' =>  100]);

        return redirect()->back()->with('success', 'Test submited');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $course = Course::find($id);
        $percent = 0;
        foreach($course->users as $enrollment){
            if (Auth::id() == $enrollment->pivot->user_id){
                $percent = $enrollment->pivot->percent;
            }
        }
        $test = $course->test;
        if(is_null($test)){
            $result = 0;
        } else {
            $testUser = TestUser::all()->where('user_id', Auth::id())->where('test_id', $test->id)->first();
            if(!is_null($testUser)){
                $result = $testUser->result;
            } else {
                $result = 0;
            }
        }
        
        return view('courses.show')->with([
            'course' => $course,
            'percent' => $percent,
            'result' => $result
        ]);
    }

    public function start($id, $lesson_id = 0)
    {
        $course = Course::find($id);
        $lesson = $course->lessons[$lesson_id];
        $completed = 0;
        foreach($lesson->users as $item){
            if($item->pivot->user_id == Auth::id()){
                $completed = $item->pivot->completed;
            }
        }
        return view('courses.start')->with([
            'user' => Auth::user(),
            'lesson_id' => $lesson_id,
            'course' => $course,
            'percent' => 0,
            'completed' => $completed
        ]);
    }

    public function test($id)
    {
        $course = Course::find($id);
        $test = $course->test;
        $testUser = TestUser::all()->where('user_id', Auth::id())->where('test_id', $test->id)->first();
        //dd($testUser);
        if (!is_null($testUser)){
            $answers = $testUser->answers;
        }
        return view('courses.test')->with([
            'course' => $course,
            'test' => $test,
            'lesson_id' => -1,
            'user' => Auth::user(),
            'testUser' => $testUser,
            'corrects' => Answer::all()->where('correct', 1)
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
        $course = Course::find($id);
        if((auth()->user()->id !== $course->user_id) && (!auth()->user()->hasRole('admin'))){
            return redirect()->back()->with('error', 'Unautorized Action');
        }
        return view('courses.edit')->with([
            'course' => $course,
            'user' => Auth::user(),
            'lessons' => $course->lessons,
            'test' => $course->test
        ]);
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
        $this->validate($request, [
            'title' => 'required',
            'cover_image' => [
                Rule::dimensions()->maxWidth(1900)->maxHeight(800),
            ]
        ]);

        // Handle File Upload
        if($request->hasFile('cover_image')){
            $filenameWithExt = $request->file('cover_image')->getClientOriginalName();
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            $extension = $request->file('cover_image')->getClientOriginalExtension();
            $fileNameToStore = $filename.'_'.time().'.'.$extension;
            $path = $request->file('cover_image')->storeAs('public/images', $fileNameToStore);
        }

        //Create Course
        $course = Course::find($id);
        $course->title = $request->input('title');
        $course->description = $request->input('description');
        if(!is_null($request->input('status'))){
                    $course->status = $request->input('status');
        }
        if($request->hasFile('cover_image')){
            Storage::delete('public/images/'.$course->cover_image);
            $course->cover_image = $fileNameToStore;
        }
        $course->save();
        //Session::put('course', $course);
        return redirect()->back()->with([
            'success' => 'Course updated',
            'user' => Auth::user()
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $course = Course::find($id);
        //dd($course->test->questions[0]->answers);

        if($course->cover_image != 'noimage.jpg'){
            Storage::delete('public/images'.$course->cover_image);
        }

        if(!is_null($course->test)){
            if(!is_null($course->test->questions)){
                foreach($course->test->questions as $question){
                    if(!is_null($question->answers)){
                        foreach($question->answers as $answer){
                            $answer->delete();
                        }
                    }
                    $question->delete();
                }
            }
            
            $course->test->delete();
        }

        if(!is_null($course->lessons)){
            foreach( $course->lessons as $lesson){
                $lesson->delete();
            }
        }
        
        $course->delete();
        return redirect()->back()->with('success', 'Course removed');
    }
}
