@extends('layouts.app-learn')

@section('content')

<div class="container">
    @if ($course->lessons()->count() > 0)
        <div class="row mt-4">
            <div class="col-md-12">
                @foreach ($course->lessons as $lesson)
                    <p>{{$lesson->title}}</p>
                @endforeach
            </div>
        </div>
    @endif
    <div class="row mt-4">
        <div class="col-md-12">
    <div class="card mt-1">
        <div class="card-header">
            <strong>Add New Lesson To Course: </strong>
            {{$course->title}}
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
                        @if (!$course->test)
                        <button name="submit" name="submit" value="test" class="btn btn-success">Create Test</button>
                        @endif
                    </div>
                </div>
            </form>
        </div> 
    </div> 
 <br>
        </div>
        
    </div>
    
</div>


@endsection