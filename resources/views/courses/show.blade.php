@extends('layouts.app-learn')

@section('content')

<div class="container pt-5">
    <div class="row">
        
        <div class="col-md-8 text-center"><h1>{{$course->title}}</h1></div>
        <div class="col-md-4">
            @auth  
                <a class="float-right btn btn-success @if(Auth::user()->courses()->where('course_id', $course->id)->exists()) disabled @endif" href="{{ url('/courses/'.$course->id.'/enroll')}}">Enroll now</a>  
            @endauth
            @guest
                <a class="float-right btn btn-success" href="/register">Register To Enroll</a>
            @endguest  
        </div>
        <div class="col-md-1 mt-5">
            <img style="width:100%" class="rounded-circle img-thumbnail float-left" src="{{ url('/storage/avatars/'.$course->user->avatar) }}"><br>
        </div>
        <div class="col-md-7 pt-4 mt-5">
            <h6 class="float-left pr-2">by {{$course->user->name}}</h6>
            <h6> on {{date('d. M Y.', strtotime($course->created_at))}}</h6>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8">
            <div class="col-md-12 border-top my-2 py-2 ">
                <div class="card my-2">
                    <div class="card-header pb-0">
                        <p>Description</p>
                    </div>
                    <div class="card-body pb-0">
                        <p> {{$course->description}}
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-12 border-top my-2 py-2 ">
                <div class="accordion my-2" id="accordionExample">
                    <div class="card">
                      <div class="card-header" id="headingOne">
                        <p class="mb-0">
                            Course Content
                        </p>
                      </div>
                    </div>
                    @for ($i = 0; $i < $course->lessons->count(); $i++)
                      <div class="card">
                      <div class="card-header" id="headingTwo">
                        <h2 class="mb-0">
                          <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            Lesson {{$i+1}}: {{$course->lessons[$i]->title}}
                          </button>
                        </h2>
                      </div>
                      <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                        <div class="card-body">
                          {{$course->lessons[$i]->description}}
                        </div>
                      </div>
                    </div>  
                    @endfor
                    @if ($course->test()->count() > 0)
                      <div class="card">
                        <div class="card-header" id="headingThree">
                          <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                              Test: {{$course->test->title}}
                            </button>
                          </h2>
                        </div>
                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                          <div class="card-body">
                              {{$course->test->description}}
                          </div>
                        </div>
                      </div> 
                    @endif
                    
                  </div>
            </div>
            <div class="col-md-12 border-top my-2 py-2 ">
                <div class="card my-2">
                    <div class="card-header pb-0">
                        <p>About Author</p>
                    </div>
                    <div class="card-body pb-0">
                        <p> {{$course->user->description}}
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4  my-2 py-2 ">
            <div class="col-md-12  my-2 mb-4">
            <img src="{{ url('/storage/images/'.$course->cover_image) }}" width="100%" height="100%" alt="">
           </div>
          
           @if ($course->users->contains(Auth::id()) && (count($course->lessons) > 0))
              <div class="col-md-12  my-2 mb-4">
                <a href="{{ url('/courses/'.$course->id.'/0') }}" class="btn btn-block btn-success">Start Learning</a>
            </div> 
           @endif
            <p>Progress: 
              @if($percent == 100)
                @if($result > 70) <span class="badge badge-success">Completed with test result of: {{$result}}% </span>  
                @else  <span class="badge badge-danger"> Failed to complete. Test Result: {{$result}}% </span>
                @endif
              @endif
            </p>
            <div class="progress">
              <div class="progress-bar bg-success" role="progressbar" style="width: {{$percent}}%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <div class="card my-4">
                <div class="card-header pb-0">
                    <p>About Course</p>
                </div>
                <div class="card-body pb-0">
                    <label style="width: 170px" >Number Of Students: </label>  {{ $course->users()->count() }} <br>
                    <label style="width: 170px">Number of Reviews: </label> {{ $course->reviews()->count() }} <br>
                    <label style="width: 170px">Avarage Rating: </label>  {{ (5 + $course->reviews->sum('rate')) / (1 + $course->reviews->count())}}
                </div>
            </div>
            
            <div class="col-md-12">
                <p>Reviews: </p>
                @foreach ($course->reviews as $review)
                <div class="card mb-1">
                    <div class="card-header mb-1 pb-0">
                        <img src="" alt="">
                        <p class="float-left font-weight-bold">{{ App\User::where('id', $review->user_id)->first()->name}}: <br>
                        <small>{{date('d M Y H:m', strtotime($review->created_at))}}</small></p> 
                        <p class="float-right">{{$review->rate}} <i class="fas fa-star"></i></p>
                    </div>
                    <p class="p-2">{{$review->body}}</p>
                </div>  
                @endforeach
            </div>
        </div>
    </div>
    

        
    </div>

        
            
@endsection