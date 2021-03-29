<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\Lesson;
use App\Course;
use Auth;

class LessonsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $course_id = $request->input('course_id');
        $course = Course::find($course_id);
        
        if($request->input('submit') == 'save'){
            
            $this->validate($request, [
            'title' => 'required',
            'lessont' => 'required'
        ]);
            //Create Lesson
            $lesson = new Lesson;
            $lesson->course_id = $course_id;
            $lesson->title = $request->input('title');
            $lesson->description = $request->input('description');
            $lesson->lessont = $request->input('lessont');
            $lesson->lessonv = $request->input('lessonv');
            $lesson->save();
            Session::put('course', $course);
            return redirect()->back()->with([
                'success' => 'Lesson created',
                'course' => $course,
                'user' => Auth::user()
            ]);
        } else {
            return view('courses/addTest')->with([
                'course' => $course,
                'user' => Auth::user()
            ]);
        }
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
        $lesson = Lesson::find($id);
        $course = $lesson->course;
        $user = Auth::user();
        foreach($user->courses as $item){
            if($item->pivot->course_id == $course->id){
                $percent = $item->pivot->percent;
            }
        }
        $add = (1 / ($course->lessons->count() + 1)) * 100;
        $user->lessons()->attach($lesson->id,['completed' => 1 ]);
        $user->courses()->updateExistingPivot($course->id, ['percent' =>  $percent + $add]);

        return redirect()->back()->with('success', 'Lesson completed');
        
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
