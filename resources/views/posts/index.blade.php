@extends('layouts.app')

@section('content')
@include('inc.cover')
<div class="container">   
    <div class="card">
        <div class="card-header row px-0 py-2 m-0">
            <div class="col-md-8">
                <h3>Latest @if ($title == 'Education') Educations
                @else {{$title}} @endif </h3>
            </div>
            <div class="col-md-4">
                @if (Auth::guest()) 
                <h5 class="float-right">To write a post, please login</h5>
                @else
                    @if (( Auth::user()->hasRole('admin')) || ($title == 'Posts'))
                        <a href="/posts/create" class="btn btn-lg btn-outline-success float-right">Add new post</a>
                    @endif 
                @endif
            </div>
        </div>
    </div>
        

    <div class="row mt-5">
        @if(count($posts) > 0)
        @foreach ($posts as $post)
        <div class="col-md-4">    
            <div class="card mb-4 shadow-sm">
                <a href="/posts/{{$post->id}}"  class="text-dark text-decoration-none">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet"  x="0"   y="0" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
                    <image href="{{ url('/storage/images/'.$post->cover_image) }}" width="100%"/>
                </svg>  
                <div class="card-header text-center">{{ Str::upper($post->title) }}</div>
                </a>

                <div class="card-body">
                    <p class="card-text text-muted">{{ Str::limit($post->body, 120) }}</p> 
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-between">
                        <div>
                            <small class="text-muted">
                                Author: 
                                <a href="/posts/byUser/{{$post->user->id}}">{{$post->user->name}}</a> 
                                <br>
                                {{ date('d. M y.', strtotime($post->created_at)) }}
                            </small>
                        </div>
                        <div>
                            <small class="text-muted">
                                Category: 
                                @foreach ($post->categories as $category)
                                    <a href="/posts/category/{{($category->name)}}">{{($category->name)}}, </a>
                                @endforeach 
                                <br>
                                @if ($post->comments->count()>0)
                                    <p class="float-right">Comments: {{$post->comments->count()}}</p>
                                @endif
                            </small>
                        </div>
                    </div>
                </div>
            </div>
        </div>     
        @endforeach
    </div>
  
    
            <div class="text-center">{{$posts->links()}}</div>
            
            @else
                <p>No posts found</p>
            @endif
        </div>
</div>
</div>
@endsection