@extends('layouts.app-start')

@section('lesson')

    <div class="card">
        <div class="card-header">
        <h3>{{$course->lessons[$lesson_id]->title}}</h3> 
        </div>
        @if (isset($course->lessons[$lesson_id]->lessonv))
            <iframe width="100%" height="470" src="{{$course->lessons[$lesson_id]->lessonv}}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        @endif
        <div class="card-body">
            {{$course->lessons[$lesson_id]->lessont}}
        </div>
        @if(!$completed)                                 
        <form method="POST" action="{{ route ('lessons.update', $course->lessons[$lesson_id]) }}">
            <input name="_method" type="hidden" value="PUT">
            @csrf
            <button name="submit" class="btn btn-primary btn-block">Mark as complete</button>
        </form>
        @else
            <button name="submit" class="btn btn-success btn-block" disabled>Lesson completed</button>
        @endif
    </div>

@endsection
