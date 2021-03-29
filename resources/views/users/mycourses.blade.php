@extends('layouts.app-users')
@section('main')

<div class="container">

    <div class="row">
        <div class="col-md-12 mt-5">
            <h3>Courses I wrote: </h3>
            <table class="table table-striped">
                <tr class="text-center">
                    <th>Title</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
                @foreach ($authors as $course)
                  <tr class="text-center">
                    <td><a href="/courses/{{$course->id}}">{{ $course->title }}</a></td>
                    <td>{{ date('d M y', strtotime($course->created_at))}}</td>
                    <td class="d-flex align-items-center justify-content-center">
                        <form class="text-center" method="post" action="{{ route('courses.destroy', [$course->id]) }}">
                            <input name="_method" type="hidden" value="DELETE">
                            @csrf
                            <button type="submit" class="btn btn-outline-danger mx-2"><i class="fas fa-trash-alt"></i></button>
                        </form>
                        <a href="/courses/{{$course->id}}/edit" class="btn btn-outline-primary"><i class="fas fa-edit"></i></a>
                    </td>
                </tr>  
                @endforeach
            </table>
        </div> 

        <div class="col-md-12 mt-5">
            <h3>Courses I enrolled: </h3>
            <table class="table table-striped">
                <tr class="text-center">
                    <th>Title</th>
                    <th>Date</th>
                    <th>Progress</th>
                    <th>Action</th>
                </tr>
                @foreach ($courses as $course)
                    @foreach ($course->users as $enrollment)
                        @if (Auth::id() == $enrollment->pivot->user_id)                        
                    
                  <tr class="text-center">
                    <td><a href="/courses/{{$course->id}}">{{ $course->title }}</a></td>
                    <td>{{ date('d M y', strtotime($enrollment->pivot->created_at))}}</td>
                    <td>
                        
                        <div class="progress">
                            <div class="progress-bar bg-success" role="progressbar" style="width: {{$enrollment->pivot->percent}}%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                    </td>
                    <td class="d-flex align-items-center justify-content-center">
                        <a href="/courses/{{$course->id}}" class="btn btn-outline-primary float-left">Keep Learning</a>
                    </td>
                </tr>  @endif @endforeach
                @endforeach
            </table>
        </div>

    </div>



</div>


@endsection