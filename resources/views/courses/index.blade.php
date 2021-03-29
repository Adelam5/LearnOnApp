@extends('layouts.app-learn')

@section('content')

<div class="container mt-5">
    <div class="row">
        @foreach ($latest as $course)
        <div class="col-md-6">
            <div class="card mb-6 shadow-sm">
                <a href="/courses/{{$course->id}}" class="text-dark text-decoration-none">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet"  x="0"   y="0" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
                    {{-- <title>Placeholder</title> --}}
                    <image href="{{ url('/storage/images/'.$course->cover_image) }}" width="100%"/>
                   {{--  <rect width="100%" height="100%" fill="black" fill-opacity="0.6" />
                    <text style="font-weight: bold;" x="50%" y="50%" fill="#eceeef" dy=".3em">{{ Str::upper($course->title) }}</text> --}}
                </svg>
               
                <div class="card-header text-center">{{ Str::upper($course->title) }}</div> </a>
                 <div class="card-body">
                    <p class="card-text">{{ Str::limit($course->description, 120) }}</p> <hr>
                    <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <small class="text-muted">Author: {{ $course->user->name }} <br>
                        {{ date('d. M y.', strtotime($course->created_at)) }}</small>
                    </div>
                    <div>
                        <small class="text-muted">Students: {{ $course->users->count() }} <br>
                        Rating: {{ (5 + $course->reviews->sum('rate')) / (1 + $course->reviews->count())}} <i class="fas fa-star"></i></small>
                    </div>
                    </div>
                </div>
            </div>
        </div> 
        @endforeach
    </div>
    <div class="row mt-5">
        @foreach ($courses as $course)
        <div class="col-md-4">    
            <div class="card mb-4 shadow-sm">
                <a href="/courses/{{$course->id}}"  class="text-dark text-decoration-none">
                   <svg class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet"  x="0"   y="0" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
                    {{-- <title>Placeholder</title> --}}
                    <image href="{{ url('/storage/images/'.$course->cover_image) }}" width="100%"/>
                    {{-- <rect width="100%" height="100%" fill="black" fill-opacity="0.6" />
                    <text style="font-weight: bold;" x="50%" y="50%" fill="#eceeef" dy=".3em">{{ Str::upper($course->title) }}</text> --}}
                </svg>  
                <div class="card-header text-center">{{ Str::upper($course->title) }}</div></a>
                <div class="card-body">
                    <p class="card-text">{{ Str::limit($course->description, 120) }}</p> <hr>
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <small class="text-muted">Author: {{ $course->user->name }} <br>
                            {{ date('d. M y.', strtotime($course->created_at)) }}</small>
                        </div>
                        <div>
                            <small class="text-muted">Students: {{ $course->users->count() }} <br>
                            Rating: {{ (5 + $course->reviews->sum('rate')) / (1 + $course->reviews->count())}} <i class="fas fa-star"></i></small>
                        </div>
                    </div>
                </div>
            </div>
        </div>     
        @endforeach
    </div>
</div>




{{-- <table class="table table-striped">
    <tr class="text-center">
        <th>Title</th>
        <th>Author</th>
        <th>Students</th>
        <th>Rating</th>
        <th>Enroll</th>
    </tr>
    @foreach ($courses as $course)
      <tr class="text-center">
        <td><a href="/courses/{{$course->id}}">{{ $course->title }}</a></td>
        <td>{{ $course->user->name }}</td>
        <td>{{ $course->users->count() }}</td>
        <td>{{ (5 + $course->reviews->sum('rate')) / (1 + $course->reviews->count())}}</td>
        @auth
         <td>  
            <a class="btn btn-success @if(Auth::user()->courses()->where('course_id', $course->id)->exists()) disabled @endif" href="{{ url('/courses/'.$course->id.'/enroll')}}">Enroll now</a>
        </td>    
        @endauth
        @guest
        <td>
            <p>Register to login</p>
        </td>
        @endguest
        
    </tr>  
    @endforeach
    
</table> --}}

@endsection