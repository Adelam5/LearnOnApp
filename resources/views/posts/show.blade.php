@extends('layouts.app')

@section('content')
@include('inc.cover')
<div class="container">
        <div class="card">
            <div class="row card-header p-0 pt-3 m-0">
                <div class="col-md-1 text-center">
                    <img style="width:100%" class="rounded-circle img-thumbnail" src="{{ url('/storage/avatars/'.$post->user->avatar) }}" alt="">
                    <br><a href="/posts/byUser/{{$post->user->id}}">{{$post->user->name}}</a>
                </div>
                <div class="col-md-7 text-center">
                    <h3>{{ $post->title }}</h3>
                    <p>Category: <a href="/posts/category/{{ implode(', ', $post->categories()->get()->pluck('name')->toArray()) }}">{{ implode(', ', $post->categories()->get()->pluck('name')->toArray()) }}</a>
                    <br>{{date('d M Y', strtotime($post->created_at))}}</p>
                </div>
                <div class="col-md-4">
                    <form class="float-right" method="post" action="{{ route('posts.destroy', [$post->id]) }}">
                        <input name="_method" type="hidden" value="DELETE">
                        @csrf
                        <button type="submit" class="btn btn-lg btn-outline-danger mx-2">Delete</button>
                    </form>
                    <a href="/posts/{{$post->id}}/edit" class="btn btn-lg btn-outline-primary float-right">Edit</a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <img style="object-fit: cover; width: 90%; max-height: 300px;" class="rounded mt-2" src="{{ url('/storage/images/'.$post->cover_image) }}" alt="">
                </div>
            </div>
            <div class="card-body">
                {{$post->body}}
            </div>
        </div>
        <hr>
        <div class="card">
            <div class="card-header">
                <h5 class="float-left">Comments:</h5> 
            </div>
            <div class="card-body">
            @foreach ($post->comments as $comment)
                <div class="card mb-1">
                    <div class="card-header mb-1 pb-0">
                        <img src="" alt="">
                        <p class="float-left font-weight-bold">{{ App\User::where('id', $comment->user_id)->first()->name}}: <br>
                        <small>{{date('d M Y H:m', strtotime($comment->created_at))}}</small></p> 
                        
                        <form class="float-right" method="post" action="{{ route('comments.destroy', [$comment->id]) }}">
                            <input name="_method" type="hidden" value="DELETE">
                            @csrf
                            <button type="submit" class="btn btn-outline"><h5><i class="fas fa-times"></i></h5></button>
                        </form>
                    </div>
                    <p class="p-2">{{$comment->body}}</p>
                </div>  
            @endforeach
            <br>
                <form method="POST" action="{{route('comments.store')}}">
                    @csrf
                <input type="hidden" name="post_id" value="{{$post->id}}">
                    <div class="form-group">
                        <label for="body">Your comment: </label>
                        <textarea name="body" id="body" style="width: 100%"></textarea>
                    </div>
                        <button  class="btn btn-primary float-right">Add Comment</button>    
                </form>
            </div> 
        </div>
        
        
</div>
@endsection