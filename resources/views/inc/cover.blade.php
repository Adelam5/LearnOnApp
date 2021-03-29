<div class="jumbotron jumbotron1">
    <div class="overlay"></div>
    <div class="inner text-center">
        <h1 class="display-3">
            @if ($title == 'Posts')
                Blog
            @else
                {{ $title }}
            @endif
            </h1>
        @guest
          <a class="btn btn-join btn-lg" href="/register" role="button">Join Us</a>  
        @endguest
        </p>
    </div>
</div>