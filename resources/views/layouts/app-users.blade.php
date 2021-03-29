@extends('layouts.app-learn')
@section('content')

<div class="container my-5">
  
    <div class="row">

    <div class="col-md-3">
      <div class="list-group">
        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>User Options</span>
          <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h6>
          <a class="{{ (request()->is('profile')) ? 'list-group-item list-group-item-action active' : 'list-group-item list-group-item-action' }}" href="/profile">
            <i style="width: 30px" class="far fa-lg fa-id-badge"></i>
             My Profile
          </a>
          <a class="{{ (request()->is('profile/*/edit')) ? 'list-group-item list-group-item-action active' : 'list-group-item list-group-item-action' }}" href="{{ route('profile.edit', $user->id) }}">
            <i style="width: 30px" class="fas fa-lg fa-edit"></i>
             Edit Profile
          </a>
          <a class="{{ (request()->is('profile/myposts')) ? 'list-group-item list-group-item-action active' : 'list-group-item list-group-item-action' }}" href="/profile/myposts">
            <i style="width: 30px" class="fas fa-lg fa-newspaper"></i>
             My Posts
          </a>
          <a class="{{ (request()->is('comments')) ? 'list-group-item list-group-item-action active' : 'list-group-item list-group-item-action' }}" href="/comments">
            <i style="width: 30px" class="far fa-lg fa-comments"></i>
             My Comments
          </a>
          <a class="{{ (request()->is('mycourses')) ? 'list-group-item list-group-item-action active' : 'list-group-item list-group-item-action' }}" href="/mycourses">
            <i style="width: 30px" class="fas fa-lg fa-graduation-cap"></i>
             My Courses
          </a>
          <a class="{{ (request()->is('tests')) ? 'list-group-item list-group-item-action active' : 'list-group-item list-group-item-action' }}" href="/tests">
            <i style="width: 30px" class="fas fa-lg fa-tasks"></i>
             My Tests
          </a>

          @if (Auth::user()->hasRole('author'))
            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span>Author Options</span>
              <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
                <span data-feather="plus-circle"></span>
              </a>
            </h6>
            <a class="{{ (request()->is('posts_management')) ? 'list-group-item list-group-item-action active' : 'list-group-item list-group-item-action' }}" href="{{ url('posts_management')}}">
              <i style="width: 30px" class="fas fa-lg fa-copy"></i>
              Posts Management
            </a>
            <a class="{{ (request()->is('courses_management')) ? 'list-group-item list-group-item-action active' : 'list-group-item list-group-item-action' }}" href="{{ url('courses_management')}}">
              <i style="width: 30px" class="fas fa-lg fa-chalkboard-teacher"></i>
              Courses Management
            </a>
            <a class="{{ (request()->is('tests_management')) ? 'list-group-item list-group-item-action active' : 'list-group-item list-group-item-action' }}" href="{{ url('tests_management')}}">
              <i style="width: 30px" class="fas fa-lg fa-tasks"></i>
              Test Revisions
            </a>
          @endif

          @if (Auth::user()->hasRole('admin'))
            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span>Admin Options</span>
              <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
                <span data-feather="plus-circle"></span>
              </a>
            </h6>
            <a class="{{ (request()->is('admin.users.index')) ? 'list-group-item list-group-item-action active' : 'list-group-item list-group-item-action' }}" href="{{ route('admin.users.index') }}">
              <i style="width: 30px" class="fas fa-lg fa-user-cog"></i>
              Users Management
            </a>
            <a class="{{ (request()->is('posts_management')) ? 'list-group-item list-group-item-action active' : 'list-group-item list-group-item-action' }}" href="{{ url('posts_management')}}">
              <i style="width: 30px" class="fas fa-lg fa-copy"></i>
              Posts Management
            </a>
            <a class="{{ (request()->is('courses_management')) ? 'list-group-item list-group-item-action active' : 'list-group-item list-group-item-action' }}" href="{{ url('courses_management')}}">
              <i style="width: 30px" class="fas fa-lg fa-chalkboard-teacher"></i>
              Courses Management
            </a>
            <a class="{{ (request()->is('tests_management')) ? 'list-group-item list-group-item-action active' : 'list-group-item list-group-item-action' }}" href="{{ url('tests_management')}}">
              <i style="width: 30px" class="fas fa-lg fa-tasks"></i>
              Test Revisions
            </a>
            <a class="{{ (request()->is('admin/subscriptions_management')) ? 'list-group-item list-group-item-action active' : 'list-group-item list-group-item-action' }}" href="{{ url('admin/subscriptions_management')}}">
              <i style="width: 30px" class="fas fa-lg fa-file-signature"></i>
              Subscriptions
            </a> 
          @endif
      
      </div>
    </div>

          <div class="col-md-9 col-lg-9 bg-light">

            <div class="row">
              <div class="col-md-4">
                <div class="col-md-12">
                  <img src="{{ url('/storage/avatars/'.Auth::user()->avatar) }}" class="rounded-circle px-5" style="width: 100%">
                </div>
              </div>
              <div class="col-md-5 mt-5">
                <h1>Welcome, {{Auth::user()->name}}</h1>
              </div>
            </div>
             <hr>
            
            

            @yield('main')
                            
          </div>
    </div>

</div>

@endsection