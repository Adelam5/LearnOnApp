@extends('layouts.app-users')
@section('main')

<div class="container">
    <div class="row">
        <div class="col-md-12">
            @foreach ($myTests as $myTest)
            @foreach ($allTests as $allTest)
                @if ($allTest->id == $myTest->test_id)
                <div class="card mb-2">
                    <div class="card-header">Test: {{$allTest->title}} || Course: {{$allTest->course->title}}</div>            
                    <div class="card-body">
                        Result: {{$myTest->result}} <br><br>
            
                    @foreach ($allTest->questions as $question)
                        Question  {{$loop->iteration}}: {{$question->question}} <br>
                        Your answer: 
                        @if($myTest->answers->count() > 0 )
                            @foreach ($myTest->answers as $answer)
                                @if ($question->id == $answer->question_id)
                                      {{$answer->answer}} <br>
                                    @if ($answer->correct == 1)
                                        Correct <br>
                                    @else
                                        Wrong <br>
                                    @endif
                                @endif
                            @endforeach
                        @else
                            You didn't choose an answer! <br>
                            Correct answer is: 
                            @foreach ($corrects as $correct)
                                @if ($correct->question_id == $question->id)
                                    {{$correct->answer}} <br>
                                @endif
                            @endforeach
                        @endif
                            <br>
                    @endforeach
                    </div>
                </div>
                @endif
            @endforeach
        @endforeach
        </div>
    </div>
</div>

@endsection