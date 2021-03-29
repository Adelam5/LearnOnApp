@extends('layouts.app')

@section('content')
@include('inc.cover')
<div class="container">
    <div class="card">
        <div class="card-header">
            Edit Post: {{$post->title}}
        </div>
        <div class="card-body">
            <form method="POST" action="{{ route('posts.update', [$post->id]) }}" enctype="multipart/form-data">
                <input name="_method" type="hidden" value="PUT">
                @csrf
                <div class="form-group row">
                    <label for="title" class="col-md-2 col-form-label text-md-right">Post Title</label>

                    <div class="col-md-8">
                        <input id="title" type="text" class="form-control" name="title" value="{{$post->title}}" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="body" class="col-md-2 col-form-label text-md-right">Post Text</label>

                    <div class="col-md-8">
                        <textarea name="body" id="body" class="form-control" cols="30" rows="10">{{$post->body}}</textarea>
                    </div>
                </div>
                @if( Auth::user()->hasRole('admin'))
                <div class="form-group row">
                    <label for="categories[]" class="col-md-2 col-form-label text-md-right">Categories</label>
                @foreach ($categories as $category)
                    <div class="form-check">
                        <input type="checkbox" name="categories[]" value="{{ $category->id }}"
                        @if($post->categories->pluck('id')->contains($category->id)) checked @endif>
                        <label>{{ $category->name }}</label>
                    </div>
                @endforeach
                </div>
                @endif
                <div class="form-group row">
                    <label for="cover_image" class="col-md-2 col-form-label text-md-right">Chose cover image:</label>
                    <div class="col-md-8">
                        <input type="file" id="cover_image" name="cover_image" accept="image/png, image/jpeg, image/jpg">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="submit" class="col-md-2 col-form-label text-md-right"></label>

                    <div class="col-md-8">
                        <button name="submit" class="btn btn-success">Publish</button>
                        <a href="/posts" class="btn btn-danger">Cancel</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection