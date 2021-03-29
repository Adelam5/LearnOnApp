@extends('layouts.app-users')
@section('main')

<div class="card">
    <div class="card-header">Courses</div>
    <div class="card-body">
        <div class="mb-3">
            <a href="{{ route('courses.create')}}" class="btn btn-success">Create New Course</a>
        </div>
        <div>
            <input class="form-control" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by author">
        </div><br>
        <table id="myTable" class="table table-striped table-sm">
            <tr class="text-center">
                <th onclick="sortTable(0)">Title</th>
                <th onclick="sortTable(1)">Author</th>
                <th onclick="sortTable(2)">Date</th>
                <th onclick="sortTable(3)">Students</th>
                <th onclick="sortTable(4)">Status</th>
                <th onclick="sortTable(5)">Rating</th>
                <th>Action</th>
            </tr>
            @foreach ($courses as $course)
              <tr class="text-center">
                <td><a href="/courses/{{$course->id}}">{{ Str::limit($course->title, 25) }}</a></td>
                <td>{{ $course->user->name }}</td>
                <td>{{ date('d M y', strtotime($course->created_at))}}</td>
                <td>{{ $course->users()->count() }}</td>
                <td>@if($course->status==1) active @else archive  @endif </td>
                <td>{{ $course->rating }}</td>
                <td>
                    <form class="float-left" method="post" action="{{ route('courses.destroy', [$course->id]) }}">
                        <input name="_method" type="hidden" value="DELETE">
                        @csrf
                        <button type="submit" onclick="return confirm('Are you sure you want to delete {{$course->title}}?')" class="btn btn-outline-danger mx-2 show_confirm"><i class="fas fa-trash-alt"></i></button>
                    </form>
                    <a href="/courses/{{$course->id}}/edit" class="btn btn-outline-primary float-left"><i class="fas fa-edit"></i></a>
                </td>
            </tr>  
            @endforeach
            
        </table>
    </div>
</div>

@endsection