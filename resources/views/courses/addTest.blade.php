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
            <strong>Add Test To Course: </strong>
            {{$course->title}}
        </div>
        <div class="card-body">
            <form method="POST" action="{{ route('tests.store') }}">
                @csrf
                <input type="hidden" value={{$course->id}} name="course_id">
                <div class="form-group row">
                    <label for="title" class="col-md-2 col-form-label text-md-right">Test Title</label>

                    <div class="col-md-8">
                        <input id="title" type="text" class="form-control" name="title" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="description" class="col-md-2 col-form-label text-md-right">Test Description</label>

                    <div class="col-md-8">
                        <textarea name="description" id="description" class="form-control" cols="30" rows="10"></textarea>
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
 <br>
        </div>
        
    </div>
    
</div>


@endsection