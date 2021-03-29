@if(session('success'))
    <div class="alert alert-success container" role="alert">
        {{  session('success')  }}
    </div>
@endif

@if(session('warning'))
    <div class="alert alert-warning container" role="alert">
        {{  session('warning')  }}
    </div>
@endif

@if(session('error'))
    <div class="alert alert-danger container" role="alert">
        {{  session('error')  }}
    </div>
@endif

