@extends('layouts.app-start')

@section('lesson')

<div class="container"> 
    

    @if(is_null($testUser))

    <div class="alert alert-danger" role="alert">
        You can take this test only once! Keep learning if you don't feel ready. Good Luck!
    </div>

    <form method="POST" action="{{url('test')}}">
    @csrf
    <input type="hidden" name="test_id" value="{{$test->id}}">
    @foreach ($test->questions as $question)
        <div class="card mb-3">
            <div class="card-header">
                {{$question->question}}
            </div>
            <div class="card-body">
               
                    <div class="row">
                    <legend class="col-form-label col-sm-2 pt-0">Answers</legend>
                    <div class="col-sm-10">
                        @foreach ($question->answers as $answer)      
                        <div class="form-check">
                        <input class="form-check-input" type="radio" {{-- name="gridRadios{{$question->id}}" --}} name="qa[{{$question->id}}]" id="gridRadios{{$question->id}}" value="{{$answer->id}}">
                        <label class="form-check-label" for="gridRadios1">
                            {{$answer->answer}}
                        </label>
                        </div>                            
                        @endforeach
                    </div>
                </div>            
            </div>
        </div>    
    @endforeach
 
    
    <button name="submit" class="btn btn-success">Submit</button> 
    @endif
</form>  

@isset($testUser)
        Result: {{$testUser->result}} <br><br>

        @foreach ($test->questions as $question)
            Question  {{$loop->iteration}}: {{$question->question}} <br>
            Your answer: 
            @if($testUser->answers->count() > 0 )
                @foreach ($testUser->answers as $answer)
                    @if ($question->id == $answer->question_id)
                          {{$answer->answer}} <br>
                        @if ($answer->correct == 1)
                            True <br>
                        @else
                            False <br>
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
    @endisset

</div>

@endsection