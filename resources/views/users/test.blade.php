@extends('layouts.app-users')
@section('main')

<div class="card">
    <div class="card-header">{{$test->title}} <small>test done by {{$testUser->user->name}}</small></div>
    <div class="card-body">
       Result: {{$testUser->result}}
       @foreach($testUser->answers as $qa)
           <br> Question: {{$qa->question->question}}
            Answer: {{$qa->answer}} @if($qa->correct) <i class="fas fa-check"></i> @else <i class="fas fa-times"></i> @endif<br> 
       @endforeach
    </div>
</div>

@endsection