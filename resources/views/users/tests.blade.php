@extends('layouts.app-users')
@section('main')

<div class="card">
    <div class="card-header">Tests Revision</div>
    <div class="card-body">
        <div>
            <input class="form-control" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by student">
        </div><br>
        <table id="myTable" class="table table-striped table-sm">
            <tr class="text-center">
                <th onclick="sortTable(0)">Title</th>
                <th onclick="sortTable(1)">Student</th>
                <th onclick="sortTable(2)">Course</th>
                <th onclick="sortTable(3)">Result</th>
                <th onclick="sortTable(4)">Date</th>
            </tr>
            @foreach ($tests as $test)
                @foreach ($test->test_users as $teus)
                {{-- {{dd($teus)}} --}}
              <tr class="text-center">
                <td><a href="/tests/{{$teus->id}}">{{ Str::limit($test->title, 25) }}</a></td>
                <td>{{ $teus->user->name }}</td>
                <td>{{ $test->course->title }}</td>
                <td>{{ $teus->result }}</td>
                <td>{{ date('d M y', strtotime($teus->created_at)) }}</td>
            </tr>  
            @endforeach
            @endforeach
            
        </table>
    </div>
</div>

@endsection