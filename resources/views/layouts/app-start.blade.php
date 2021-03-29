@extends('layouts.app-learn')

@section('content')

<div class="container my-5">

    <div class="row mb-5">
        <div class="col-md-12 text-center">
            <h2><a class="text-decoration-none" href="/courses/{{$course->id}}">Course: {{$course->title}}</a></h2>
        </div>
    </div>
  
    <div class="row">

        <div class="col-md-3">
            <div class="list-group">
                @for ($i = 0; $i < $course->lessons->count(); $i++)
                <a class="list-group-item list-group-item-action @if($i == $lesson_id) active @endif" href="/courses/{{$course->id}}/{{$i}}">
                    <i style="width: 30px" class="fas fa-lg fa-book-open"></i>
                    Lesson {{$i+1}}: {{$course->lessons[$i]->title}}
                </a>
                @endfor
                <a class="list-group-item list-group-item-action @if($lesson_id == -1) active @endif" href="/test/{{$course->id}}">
                    <i style="width: 30px" class="far fa-lg fa-question-circle"></i>
                    Test: {{$course->test->title}}
                </a>
            </div>
        </div>

        <div class="col-md-9">

            @yield('lesson')
            
        </div>
</div>

@endsection