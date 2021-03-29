@extends('layouts.app-users')
@section('main')

<div class="card">
    <div class="card-header">Users</div>
    <div class="card-body">
        <div>
            <input class="form-control" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by name">
        </div><br>
        <table id="myTable" class="table table-striped">
            <tr>
                <th onclick="sortTable(0)">User ID</th>
                <th onclick="sortTable(1)">Name</th>
                <th onclick="sortTable(2)">Role</th>
                <th onclick="sortTable(3)">Email</th>
                <th onclick="sortTable(4)">Joined</th>
                <th>Action</th>
            </tr>
            @foreach ($users as $user)
            <tr> {{-- {{dd ($user->roles()->get()->pluck('name')[0] == "admin" && !$user->isSubscribed())}} --}}
                <td>{{$user->id}}</td>
                <td>{{$user->name}}</td>
                <td> 
                @if($user->isSubscribed()) Member 
                @else {{implode(', ', $user->roles()->get()->pluck('name')->toArray() ) }}
                @endif
                </td>
                <td>{{$user->email}}</td>
                <td>{{date('d M y', strtotime($user->created_at)) }}</td>
                <td>
                    <a href="{{ route('admin.users.edit', $user->id) }}" class="btn btn-primary float-left mr-2">Edit</a> 
                    <form action="{{ route('admin.users.destroy', $user) }}" method="POST" class="float-left">
                        @csrf
                        {{ method_field('DELETE') }}
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </td>
            </tr>
            @endforeach
        </table>
    </div>
</div>

@endsection

