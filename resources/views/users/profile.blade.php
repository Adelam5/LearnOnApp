@extends('layouts.app-users')
@section('main')

<div class="row ml-5">
  <div class="col-md-12">
    <div class="card">
      <div class="card-header">
        <h5>Your Profile Data</h5><br>
      </div>
      <div class="card-body">
        <label style="width:130px;">Name: </label>{{$user->name}} <br>
        <label style="width:130px;">Email: </label>{{$user->email}}<br>
        <label style="width:130px;">Joined: </label>{{ date('d M Y', strtotime($user->created_at))}}<br>
        <label style="width:130px;">My Roles: </label> 
        
        @if($user->isSubscribed()) 
        member @if($user->subscription('main')->onGracePeriod()) until the end of this subscription period 
        
        @else 
        <form method="post" action="{{ route('cancelSubscription') }}">
          @csrf
          <button type="submit" class="btn btn-outline-danger mx-2">Cancel Subscription</button>
      </form>
        @endif
        
        @else {{ implode(', ', $user->roles()->get()->pluck('name')->toArray()) }}
         <a href="/join" class="btn btn-success float-right">Become a member</a> 
        @endif
        <br>
        <label style="width:130px;">Courses enrolled: </label>{{$user->courses->count()}}<br>
        <label style="width:130px;">Courses written: </label>{{$user->authors->count()}}<br>
        <label style="width:130px;">Reviews written:  </label>{{$user->reviews()->count()}}<br>
        <label style="width:130px;">Posts written:  </label>{{$user->posts()->count()}}<br>
        <label style="width:130px;">Comments written:  </label>{{$user->comments()->count()}}<br>
      </div>
    </div>
  </div>
</div>

@endsection