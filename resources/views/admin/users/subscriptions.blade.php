@extends('layouts.app-users')
@section('main')

<div class="card">
    <div class="card-header">Subscriptions</div>
    <div class="card-body">
        <div>
            <input class="form-control" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by author">
        </div><br>
        <table id="myTable" class="table table-striped table-sm">
            <tr class="text-center">
                <th onclick="sortTable(0)">Title</th>
                <th onclick="sortTable(1)">User</th>
                <th onclick="sortTable(2)">Started</th>
                <th onclick="sortTable(3)">Ends</th>
                <th onclick="sortTable(4)">Status</th>

            </tr>
            @foreach ($subscriptions as $subscription)
              <tr class="text-center">
                <td><a href="/posts/{{$subscription->id}}">{{$plans[$subscription->stripe_plan]}}</a></td>
                <td>{{ $subscription->user['name'] }}</td>
                <td>{{ date('d M y', strtotime($subscription->created_at))}}</td>
                <td> @if(is_null($subscription->ends_at)) - @else {{date('d M y', strtotime($subscription->ends_at))}} @endif</td>
                <td>{{ $subscription->stripe_status }}</td>
            </tr>  
            @endforeach
            
        </table>
    </div>
</div>

@endsection