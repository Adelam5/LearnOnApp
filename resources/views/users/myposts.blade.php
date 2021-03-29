@extends('layouts.app-users')
@section('main')

<div class="row">
    <div class="col-md-12">
        <table class="table table-striped">
            <tr class="text-center">
                <th>Title</th>
                <th>Date</th>
                <th>Category</th>
                <th>Comments</th>
                <th>Action</th>
            </tr>
            @foreach ($posts as $post)
              <tr class="text-center">
                <td><a href="/posts/{{$post->id}}">{{ $post->title }}</a></td>
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