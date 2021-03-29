@extends('layouts.app-learn')

@section('content')

<div class="container">
    <div class="row mt-4">
        <div class="col-md-12">
            <form method="POST" action="{{route('courses.store')}}" enctype="multipart/form-data"> 
                @csrf
                <div class="form-group row">
                    <label for="title" class="col-md-2 col-form-label text-md-right">Course Title</label>

                    <div class="col-md-8">
                        <input id="title" type="text" class="form-control" name="title" required>
                    </div>
                </div>   
                <div class="form-group row">
                    <label for="description" class="col-md-2 col-form-label text-md-right">Course Description</label>
    
                    <div class="col-md-8">
                        <textarea name="description" id="description" class="form-control" cols="30" rows="10"></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="cover_image" class="col-md-2 col-form-label text-md-right">Chose cover image:</label>
                    <div class="col-md-8">
                        <input type="file" id="cover_image" name="cover_image" accept="image/png, image/jpeg, image/jpg"><br>
                        <small>Recomanded image ratio is 5:2. Image can not be wither then 1900px and higher then 900px.</small>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="status" class="col-md-2 col-form-label text-md-right">Status:</label>
                    <div class="col-md-8">
                        <div>
                           <input type="radio"  value="1" name="status">
                            <label for="1" class="form-check-label" value="1">Active Course</label> 
                        </div>
                        <div>
                            <input type="radio" value="0" name="status">
                            <label for="0" class="form-check-label" value="0">Archive</label> 
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="submit" class="col-md-2 col-form-label text-md-right"></label>

                    <div class="col-md-8">
                        <button name="submit" class="btn btn-success">Publish</button>
                        <a href="{{ url()->previous() }}" class="btn btn-danger">Cancel</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>



@endsection