@extends('layouts.app-learn')

@section('content')

<div class="container">
    @if($test->questions()->count() > 0)
    <div class="col-md-12 border-top my-2 py-2 ">
        <div class="accordion my-2" id="accordionExample">
            <div class="card">
              <div class="card-header" id="headingOne">
                <p class="mb-0">
                    List of questions
                </p>
              </div>
            </div>
            @foreach ($test->questions as $quest)
              <div class="card">
              <div class="card-header" id="headingTwo">
                <h2 class="mb-0">
                  <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse{{$loop->iteration}}" aria-expanded="false">
                    Question {{$loop->iteration}}: {{$quest->question}}
                  </button>
                </h2>
              </div>
              <div id="collapse{{$loop->iteration}}" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                <div class="card-body">
                    @foreach ($quest->answers as $answer)
                    <p>Answer {{$loop->iteration}}: {{$answer->answer}} @if($answer->correct == 1) -- This is marked as correct answer  @endif</p> 
                    @endforeach
                </div>
              </div>
            </div>  
            @endforeach
            
          </div>
    </div>
    @endif
    <div class="row mt-4">
        <div class="col-md-12">

        </div>
    </div>
    <div class="row mt-4">
        <div class="col-md-12">
            <form method="POST" action="{{route('questions.store')}}">
                @csrf
                <input type="hidden" name="test_id" value="{{$test->id}}">
                @isset($question)
                    <input type="hidden" name="question_id" value="{{$question->id}}">
                @endisset
                @if( empty($question) || $question == '')
                <div class="form-group row">
                    <label for="question" class="col-md-2 col-form-label text-md-right">Question</label>

                    <div class="col-md-8">
                        <input id="question" type="text" class="form-control" name="question" >
                    </div>
                </div> 
                @endif
                  
                <div class="form-group row">
                    <label for="answer" class="col-md-2 col-form-label text-md-right">Answer</label>

                    <div class="col-md-8">
                        <input id="answer" type="text" class="form-control" name="answer" value="" >
                    </div>
                    <div class="col-md-2">
                        <label for="correct" class="col-form-label text-md-right">Correct:</label>
                        <input type="radio"  value="1" name="correct">
                    </div>
                </div> 
                <div class="form-group row">
                    <label for="submit" class="col-md-2 col-form-label text-md-right"></label>

                    <div class="col-md-8">
                        <button name="submit" value="add" class="btn btn-success">Add Answer</button>
                        <button name="submit" value="next" class="btn btn-success">Next Question</button>
                        <a href="/mycourses"  class="btn btn-success">Finish</a>
                    </div>
                </div>
            </form>
        </div>
        
    </div>
    
</div>


@endsection