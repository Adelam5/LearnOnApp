@extends('layouts.app-users')
@section('main')

<div class="container">
@if($user->comments->count() > 0)
@foreach ($user->comments as $comment) 
    <div class="card">
        <ul class="list-group">    
            <li class="list-group-item">Comment for post: <a href="/posts/{{$comment->post['id']}}">{{$comment->post['title']}}</a> on {{date('d. M y.', strtotime($comment->created_at))}}</li>
            <li class="list-group-item">{{$comment->body}}</li>
        </ul>
    </div><br>
@endforeach
@endif
</div>


@endsection