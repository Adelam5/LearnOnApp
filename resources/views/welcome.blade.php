
@extends('layouts.app')

@section('content')

    
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron2 jumbotron">
      <div class="overlay"></div>
      <div class="inner text-center px-5">
          <h1 class="display-3 pb-3">{{ config('app.name', 'Learn On') }}</h1>
          <h1>ONLINE EDUCATION PLATFORM</h1><br>
          <p class="px-5">LearnOn is web application which contains information about association or company (landing page, about us, contact), 
            blog with categories (activities, education and posts), online course platform, user profile page and admin panel. 
            Every visitor can read posts and see the list of archived courses. All registred users can attend archived courses 
            and write posts (blog category). All members can write posts (in blog category) and attend all courses. 
            Only administrator and authors can write posts in activities and education categories, and write courses. 
          </p>
          <p>On our LearnOn Platform you can attend courses and test your knowledge.</p>
          @guest
            <a class="btn btn-join btn-lg mt-3" href="/register" role="button">Join Us</a>              
          @endguest
      </div>
  </div>

  <div class="container">
    <!-- Example row of columns -->
    <div class="row my-5">
      <div class="col-md-4">
        <h2>Education</h2>
        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
        <p><a class="btn btn-secondary" href="/posts/category/education" role="button">Read More &raquo;</a></p>
      </div>
      <div class="col-md-4">
        <h2>Activities</h2>
        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
        <p><a class="btn btn-secondary" href="/posts/category/activities" role="button">Read More &raquo;</a></p>
      </div>
      <div class="col-md-4">
        <h2>Blog</h2>
        <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        <p><a class="btn btn-secondary" href="/posts/category/posts" role="button">Read More &raquo;</a></p>
      </div>
    </div></div>

@endsection
