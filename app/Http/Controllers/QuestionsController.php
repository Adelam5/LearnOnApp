<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\Question;
use App\Course;
use App\Answer;
use App\Test;

class QuestionsController extends Controller
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
        /* return view('courses.addQuest')->with([
            'user' => Auth::user()
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
        $course_id = $request->input('course_id');
        $course = Course::find($course_id);
        $test_id = $request->input('test_id');
        $test = Test::find($test_id);
        if($request->input('correct') !== null){
            $correct = $request->input('correct');
        } else {
            $correct = 0;
        }

        if($request->input('submit') == 'add'){
            /* $this->validate($request, [
            'question' => 'required',
            'answer' => 'required'
        ]); */

            if($request->input('question') !== null){
                //Create Question
                $question = new Question;
                $question->test_id = $test_id;
                $question->question = $request->input('question');
                $question->save();
            } else {
                $question = Question::find($request->input('question_id'));
            }
            //Create Answer
            $answer = new Answer;
            $answer->question_id = $question->id;
            $answer->answer = $request->input('answer');
            $answer->correct = $correct;
            $answer->save();
            return view('courses/addQuest')->with([
                'success' => 'Lesson created',
                'course' => $course,
                'test' => $test,
                'question' => $question,
                'user' => Auth::user()
            ]);
        } elseif ($request->input('submit') == 'next'){
            //dd($request);
            return view('courses/addQuest')->with([
                'success' => 'New Question',
                'course' => $course,
                'test' => $test,
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
        $question = Question::find($id);
        $question->question = $request->input('question');
        $question->save();
        return redirect()->back()->with('success', 'Selected question is edited');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $question = Question::find($id);

        if(count($question->answers) > 0){
            foreach($question->answers as $answer){
                $answer->delete();
            }
        }

        $question->delete();
        return redirect()->back()->with('success', 'Selected question and answers are removed');

    }
}
