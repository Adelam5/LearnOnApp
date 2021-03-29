@extends('layouts.app')

@section('content')

<div class="jumbotron2 jumbotron">
    <div class="overlay"></div>
    <div class="inner text-center">
        <h1 class="display-3 py-5">{{$title}}</h1>
        @guest
          <a class="btn btn-join btn-lg  my-5" href="/register" role="button">Join Us</a>              
        @endguest
    </div>
</div>

<div class="row mt-5">
    <div class="col-md-6">
        <h3 class="text-center">Contact Us</h3><br>
        <form method="POST" action="{{route('contact.store')}}" >
            @csrf
            <div class="form-group row">
                <label for="name" class="col-md-3 col-form-label text-md-right">Your Name</label>
        
                <div class="col-md-8">
                    <input id="name" type="text" class="form-control" name="name" required>
                    @if ($errors->has('name'))
                        <small class="form-text invalid-feedback">{{ $errors->first('name') }}</small>
                    @endif
                    
                </div>
            </div>
            <div class="form-group row">
                <label for="email" class="col-md-3 col-form-label text-md-right">Your E-mail</label>
        
                <div class="col-md-8">
                    <input id="email" type="email" class="form-control" name="email" required>
                    @if ($errors->has('email'))
                        <small class="form-text invalid-feedback">{{ $errors->first('email') }}</small>
                    @endif
                </div>
            </div>
            <div class="form-group row">
                <label for="subject" class="col-md-3 col-form-label text-md-right">Subject</label>
        
                <div class="col-md-8">
                    <input id="subject" type="text" class="form-control" name="subject">
                </div>
            </div>
            <div class="form-group row">
                <label for="message" class="col-md-3 col-form-label text-md-right">Message</label>
        
                <div class="col-md-8">
                    <textarea name="message" id="message" class="form-control" cols="30" rows="10"></textarea>
                    @if ($errors->has('message'))
                        <small class="form-text invalid-feedback">{{ $errors->first('message') }}</small>
                    @endif
                </div>
            </div>
            <div class="form-group row">
                <label for="submit" class="col-md-3 col-form-label text-md-right"></label>
        
                <div class="col-md-8">
                    <button name="submit" class="btn btn-success">Send</button>
                </div>
            </div>
        </form>
    </div>
    <div class="col-md-5 mt-5">
        <div class="mapouter"><div class="gmap_canvas"><iframe width="100%" height="400" id="gmap_canvas" src="https://maps.google.com/maps?q=sarajevo&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://www.embedgooglemap.net">google map generator</a></div><style>.mapouter{position:relative;text-align:right;height:400px;width:100%;}.gmap_canvas {overflow:hidden;background:none!important;height:450px;width:100%;}</style></div>
    </div>
</div>

<div class="row my-5">
    <div class="col-md-12 text-center">
    <h3>Contact Information</h3><br>
        <p> <strong>LearnOn Society</strong> </p> 
        <p><i class="fas fa-phone-alt"></i> Phone: 555 555-555</p>    
        <p><i class="fas fa-map-marker-alt"></i> Address: Moon Lane 55</p> 
        <p><i class="fas fa-at"></i> E-mail: learnon@exemple.com</p>   
    </div>
</div>

@endsection