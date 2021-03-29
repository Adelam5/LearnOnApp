@extends('layouts.app-users')
@section('main')

<div class="card mb-4">
    <div class="card-header">
        Edit Course: {{$course->title}}
    </div>
    <div class="card-body">
        <form method="POST" action="{{ route('courses.update', [$course->id]) }}" enctype="multipart/form-data">
            <input name="_method" type="hidden" value="PUT">
            @csrf
            <div class="form-group row">
                <label for="title" class="col-md-2 col-form-label text-md-right">Course Title</label>

                <div class="col-md-8">
                    <input id="title" type="text" class="form-control" name="title" value="{{$course->title}}" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="description" class="col-md-2 col-form-label text-md-right">Course Description</label>

                <div class="col-md-8">
                    <textarea name="description" id="body" class="form-control" cols="30" rows="10">{{$course->description}}</textarea>
                </div>
            </div>
            <div class="form-group row">
                <label for="cover_image" class="col-md-2 col-form-label text-md-right">Chose cover image:</label>
                <div class="col-md-8">
                    <input type="file" id="cover_image" name="cover_image" accept="image/png, image/jpeg, image/jpg">
                </div>
            </div>
            <div class="form-group row">
                <label for="status" class="col-md-2 col-form-label text-md-right">Status:</label>
                <div class="col-md-8">
                    <div>
                       <input type="radio"  value="1" name="status" @if($course->status == 1) checked @endif>
                        <label for="1" class="form-check-label">Active Course</label> 
                    </div>
                    <div>
                        <input type="radio" value="0" name="status"  @if($course->status == 0) checked @endif>
                        <label for="0" class="form-check-label">Archive</label> 
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label for="submit" class="col-md-2 col-form-label text-md-right"></label>

                <div class="col-md-8">
                    <button name="submit" class="btn btn-success">Save</button>
                </div>
            </div>
        </form>
    </div>
</div>
@if (count($lessons) > 0)
    @foreach ($lessons as $lesson)
    <div class="card mt-1">
        <div class="card-header">
            Edit Lesson: {{$lesson->title}}
        </div>
        <div class="card-body">
            <form method="POST" action="{{ route('lessons.update', [$lesson->id]) }}" enctype="multipart/form-data">
                <input name="_method" type="hidden" value="PUT">
                @csrf
                <div class="form-group row">
                    <label for="title" class="col-md-2 col-form-label text-md-right">Lesson Title</label>

                    <div class="col-md-8">
                        <input id="title" type="text" class="form-control" name="title" value="{{$lesson->title}}" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="description" class="col-md-2 col-form-label text-md-right">Lesson Description</label>

                    <div class="col-md-8">
                        <textarea name="description" id="description" class="form-control" cols="30" rows="10">{{$lesson->description}}</textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="lessont" class="col-md-2 col-form-label text-md-right">Lesson Text</label>

                    <div class="col-md-8">
                        <textarea name="lessont" id="lessont" class="form-control" cols="30" rows="10">{{$lesson->lessont}}</textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="lessonv" class="col-md-2 col-form-label text-md-right">Lesson Video</label>

                    <div class="col-md-8">
                        <input id="lessonv" type="text" class="form-control" name="lessonv" value="{{$lesson->lessonv}}" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="submit" class="col-md-2 col-form-label text-md-right"></label>

                    <div class="col-md-8">
                        <button name="submit" class="btn btn-success">Save</button>
                    </div>
                </div>
            </form>
        </div> 
    </div> 
    @endforeach <br>
@endif 
    <div class="card mt-1">
        <div class="card-header">
            Add New Lesson:
        </div>
        <div class="card-body">
            <form method="POST" action="{{ route('lessons.store') }}" enctype="multipart/form-data">
                @csrf
                <input type="hidden" value={{$course->id}} name="course_id">
                <div class="form-group row">
                    <label for="title" class="col-md-2 col-form-label text-md-right">Lesson Title</label>

                    <div class="col-md-8">
                        <input id="title" type="text" class="form-control" name="title">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="description" class="col-md-2 col-form-label text-md-right">Lesson Description</label>

                    <div class="col-md-8">
                        <textarea name="description" id="description" class="form-control" cols="30" rows="10"></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="lessont" class="col-md-2 col-form-label text-md-right">Lesson Text</label>

                    <div class="col-md-8">
                        <textarea name="lessont" id="lessont" class="form-control" cols="30" rows="10"></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="lessonv" class="col-md-2 col-form-label text-md-right">Lesson Video</label>

                    <div class="col-md-8">
                        <input id="lessonv" type="text" class="form-control" name="lessonv">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="submit" class="col-md-2 col-form-label text-md-right"></label>

                    <div class="col-md-8">
                        <button type=submit name="submit" value="save" class="btn btn-success">Save</button>
                    </div>
                </div>
            </form>
        </div> 
    </div> 
{{-- <a href="" class="btn btn-success">Add New Lesson</a> <br> <br> --}}

@if (isset($test))
    <div class="card mt-4">
        <div class="card-header">
            Edit Test: {{$test->title}}
        </div>
        <div class="card-body">
            <form method="POST" action="{{ route('tests.update', [$test->id]) }}">
                <input name="_method" type="hidden" value="PUT">
                @csrf
                <div class="form-group row">
                    <label for="title" class="col-md-2 col-form-label text-md-right">Test Title</label>

                    <div class="col-md-8">
                        <input id="title" type="text" class="form-control" name="title" value="{{$test->title}}" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="description" class="col-md-2 col-form-label text-md-right">Test Description</label>

                    <div class="col-md-8">
                        <textarea name="description" id="description" class="form-control" cols="30" rows="10">{{$test->description}}</textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="submit" class="col-md-2 col-form-label text-md-right"></label>

                    <div class="col-md-8">
                        <button name="submit" class="btn btn-success">Save</button>
                    </div>
                </div>
            </form>
        </div> 
    </div> <br>
    @foreach ($test->questions as $question)
    <div class="card mt-1">
        <div class="card-header">
            Edit Questions And Answers:
        </div>
        <div class="card-body">
            <form method="POST" action="{{ route('questions.update', [$question->id]) }}">
                <input name="_method" type="hidden" value="PUT">
                @csrf
                <div class="form-group row">
                    <label for="question" class="col-md-2 col-form-label text-md-right">Question</label>

                    <div class="col-md-8">
                        <input id="question" type="text" class="form-control" name="question" value="{{$question->question}}" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="submit" class="col-md-2 col-form-label text-md-right"></label>

                    <div class="col-md-8">
                        <button name="submit" class="btn btn-success">Save</button>
                    </div>
                </div>
            </form>
            @foreach ($question->answers as $answer)
            <form method="POST" action="{{ route('answers.update', [$answer->id]) }}">
                <input name="_method" type="hidden" value="PUT">
                @csrf
                
                <div class="form-group row">
                    <label for="answer" class="col-md-2 col-form-label text-md-right">Answer</label>

                    <div class="col-md-5">
                        <input id="answer" type="text" class="form-control" name="answer" value="{{$answer->answer}}" required>
                    </div>
                    <div class="col-md-2">
                        <label for="correct" class="col-form-label text-md-right">Correct:</label>
                        <input type="checkbox"  value="1" name="correct" @if($answer->correct == 1) checked @endif >
                    </div>
                    <div class="col-md-1">
                        <button name="submit" class="btn btn-outline-success mx-2"><i class="far fa-save"></i></button>
                    </div></form>
                    <div class="col-md-1">
                        <form method="post" action="{{ route('answers.destroy', [$answer->id]) }}">
                            <input name="_method" type="hidden" value="DELETE">
                            @csrf
                            <button type="submit" class="btn btn-outline-danger mx-2"><i class="fas fa-trash-alt"></i></button>
                        </form>

                    </div>
                </div>  
             
            @endforeach
            <form method="POST" action="{{ route('answers.store') }}">
                @csrf
                <input type="hidden" name="question_id" value="{{$question->id}}">
                <div class="form-group row">
                    <label for="answer" class="col-md-2 col-form-label text-md-right">Answer</label>

                    <div class="col-md-5">
                        <input id="answer" type="text" class="form-control" name="answer" required>
                    </div>
                    <div class="col-md-2">
                        <label for="correct" class="col-form-label text-md-right">Correct:</label>
                        <input type="checkbox"  value="1" name="correct">
                    </div>
                    <div class="col-md-3">
                        <button name="submit" class="btn btn-outline-success mx-2"><i class="far fa-save"></i></button>
                    </div>
                </div>   
            </form> 
        </div> 
    </div> 
    @endforeach <br>
@endif
    
</div>

@endsection