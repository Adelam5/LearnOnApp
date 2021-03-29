@extends('layouts.app')

@section('content')

<div class="jumbotron2 jumbotron">
    <div class="overlay"></div>
    <div class="inner text-center">
        <h1 class="display-3 py-5">{{$title}}</h1>
        @guest
          <a class="btn btn-join btn-lg my-5" href="/register" role="button">Join Us</a>              
        @endguest
    </div>
</div>

<div class="container">
    <div class="row mt-4">
        <div class="col-md-6">
            <div class="card p-4 about">
                <h4>Who are we?</h4><hr>
                <p>Phasellus metus nisl, elementum quis elementum nec, fermentum quis mauris. In imperdiet, nibh vitae dignissim vehicula, 
                    neque lectus aliquet sem, vel sagittis erat ipsum a lacus. Morbi nec nibh sed libero accumsan fringilla vitae et urna. 
                    Donec sit amet semper ipsum. Mauris et finibus arcu. Nullam tempor semper justo, vitae tempus elit faucibus aliquet. 
                    Curabitur et magna non mi fermentum ultricies in ut metus. Nullam euismod venenatis magna et tristique. Praesent ac nibh posuere, 
                    condimentum lacus eu, tincidunt ligula. Nullam tempor sodales rutrum. Etiam vel commodo sem, ut ullamcorper turpis. 
                    Nulla tempor imperdiet elit, imperdiet tristique sapien porttitor eget. Nulla facilisi. </p>
            </div>
        </div>
        <div class="col-md-6">
            <img src="{{url("/storage/images/about.jpg")}}" class="about" style="width:100%" alt="">
        </div>
    </div>

    <div class="row my-4">
        <div class="col-md-6">
            <div class="card p-4 about">
                <h4>Services</h4><hr>
                <p>Phasellus metus nisl, elementum quis elementum nec, fermentum quis mauris. In imperdiet, nibh vitae dignissim vehicula, 
                    neque lectus aliquet sem, vel sagittis erat ipsum a lacus. Morbi nec nibh sed libero accumsan fringilla vitae et urna. 
                    Donec sit amet semper ipsum. Mauris et finibus arcu. Nullam tempor semper justo, vitae tempus elit faucibus aliquet. 
                    Curabitur et magna non mi fermentum ultricies in ut metus. Nullam euismod venenatis magna et tristique. Praesent ac nibh posuere, 
                    condimentum lacus eu, tincidunt ligula. Nullam tempor sodales rutrum. Etiam vel commodo sem, ut ullamcorper turpis. 
                    Nulla tempor imperdiet elit, imperdiet tristique sapien porttitor eget. Nulla facilisi. </p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card p-4 about">
                <h4>Courses</h4><hr>
                <p>Phasellus metus nisl, elementum quis elementum nec, fermentum quis mauris. In imperdiet, nibh vitae dignissim vehicula, 
                    neque lectus aliquet sem, vel sagittis erat ipsum a lacus. Morbi nec nibh sed libero accumsan fringilla vitae et urna. 
                    Donec sit amet semper ipsum. Mauris et finibus arcu. Nullam tempor semper justo, vitae tempus elit faucibus aliquet. 
                    Curabitur et magna non mi fermentum ultricies in ut metus. Nullam euismod venenatis magna et tristique. Praesent ac nibh posuere, 
                    condimentum lacus eu, tincidunt ligula. Nullam tempor sodales rutrum. Etiam vel commodo sem, ut ullamcorper turpis. 
                    Nulla tempor imperdiet elit, imperdiet tristique sapien porttitor eget. Nulla facilisi. </p>
            </div>
        </div>
    </div>
</div>



@endsection