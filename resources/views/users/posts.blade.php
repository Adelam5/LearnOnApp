@extends('layouts.app-users')
@section('main')

<div class="card">
    <div class="card-header">Posts</div>
    <div class="card-body">
        <div>
            <input class="form-control" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by author">
        </div><br>
        <table id="myTable" class="table table-striped table-sm">
            <tr class="text-center">
                <th onclick="sortTable(0)">Title</th>
                <th onclick="sortTable(1)">Author</th>
                <th onclick="sortTable(2)">Date</th>
                <th onclick="sortTable(3)">Category</th>
                <th onclick="sortTable(4)">Comments</th>
                <th>Action</th>
            </tr>
            @foreach ($posts as $post)
              <tr class="text-center">
                <td><a href="/posts/{{$post->id}}">{{ Str::limit($post->title, 25) }}</a></td>
                <td>{{ $post->user->name }}</td>
                <td>{{ date('d M y', strtotime($post->created_at))}}</td>
                <td>{{ implode(', ', $post->categories()->get()->pluck('name')->toArray()) }}</td>
                <td>{{ $post->comments->count() }}</td>
                <td>
                    <form class="float-left" method="post" action="{{ route('posts.destroy', [$post->id]) }}">
                        <input name="_method" type="hidden" value="DELETE">
                        @csrf
                        <button type="submit" class="btn btn-outline-danger mx-2"><i class="fas fa-trash-alt"></i></button>
                    </form>
                    <a href="/posts/{{$post->id}}/edit" class="btn btn-outline-primary float-left"><i class="fas fa-edit"></i></a>
                </td>
            </tr>  
            @endforeach
            
        </table>
    </div>
</div>

@endsection