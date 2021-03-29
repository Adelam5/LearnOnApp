@extends('layouts.app')

@section('content')
<div class="container my-5">
            @if (session('status'))
                <div class="" role="alert">
                    {{ session('status') }}
                </div>
            @endif

            <div class="card bg-light p-5">

                <div class="card-header">
                    <h3>Subscription</h3>
                </div>

                <div class="card-body">

                    <!-- If user is not subscribed to a plan, show them the payment form -->
                    @if($user->isSubscribed())

                        <div class="bg-blue-100 border-l-4 border-blue-500 text-blue-700 p-4 mt-8" role="alert">
                            <p class="font-bold mb-2">Thanks for joining us!</p>
                        </div>

                    <!-- Otherwise if the user is subscribed, show them a success message -->
                    @else
                    
                    @if(session('error_message'))
                    <div role="alert" class="mb-4">
                        <div class="">
                            Payment Failed
                        </div>
                        <div class="">
                            <p>{{ session('error_message') }}</p>
                        </div>
                    </div>
                @endif

                <div>
                    <div class="mb-3" role="alert">
                        <strong class="card-title alert alert-danger">You are not a subscribed to a plan</strong> <br><br>
                        <h5>To become a subscriber choose a plan and enter your billing info below:</h5>
                    </div>
                    
                    <form id="signup-form" action="{{ route('billing') }}" method="post">
                        @csrf
                        @foreach($plans as $plan)                           
                            <div class="pl-5 subscription-option">
                                <input type="radio" id="plan-silver" name="plan" value='{{$plan->id}}'>
                                <label for="plan-silver">
                                    <span class="plan-price">{{number_format((float)($plan->amount/100), 2, '.', '')}}<small>$/{{$plan->interval}}</small></span>
                                    <span class="plan-name">{{$plan->product->name}}</span>
                                </label>
                            </div>                   
                        @endforeach    
                        <div class="">
                                <label for="card-element" class="">
                                    Name on Card
                                </label>
                                <input type="text" name="name" id="name" class="shadow appearance-none border rounded ml-3 focus:outline-none focus:shadow-outline">
                        </div>
                        <div class="">
                            <label for="card-element" class="">
                                Credit Card Info
                            </label>
                            <!-- Stripe Elements Placeholder -->
                            <div id="card-element" class="shadow appearance-none border rounded py-2 px-3 focus:outline-none focus:shadow-outline"></div>
                            <div id="card-errors" class="text-danger font-weight-bold mt-2"></div>
                        </div>
                        
                        <button type="submit" id="card-button" data-secret="{{ $intent->client_secret }}" class="btn btn-block btn-success">
                            Subscribe
                        </button>
                    </form>
                </div>

                    @endif
                </div>
            </div>
    </div>
@endsection

@section('javascript')
@if(!$user->isSubscribed())
        <script src="https://js.stripe.com/v3/"></script>

        <script>
            const stripe = Stripe('{{ env("STRIPE_KEY") }}');

            const elements = stripe.elements();
            const cardElement = elements.create('card');

            cardElement.mount('#card-element');

            const cardHolderName = document.getElementById('name');
            const cardButton = document.getElementById('card-button');
            const clientSecret = cardButton.dataset.secret;
            const cardError = document.getElementById('card-errors');

            cardElement.addEventListener('change', function(event) {
                if (event.error) {
                    cardError.textContent = event.error.message;
                } else {
                    cardError.textContent = '';
                }
            });

            var form = document.getElementById('signup-form');

            form.addEventListener('submit', async (e) => {
                e.preventDefault();

                const { setupIntent, error } = await stripe.handleCardSetup(
                    clientSecret, cardElement, {
                        payment_method_data: {
                            billing_details: { name: cardHolderName.value }
                        }
                    }
                );

                if (error) {
                    // Display "error.message" to the user...
                    console.log(error);
                } else {
                    // The card has been verified successfully...
                    var hiddenInput = document.createElement('input');
                    hiddenInput.setAttribute('type', 'hidden');
                    hiddenInput.setAttribute('name', 'payment_method');
                    hiddenInput.setAttribute('value', setupIntent.payment_method);
                    form.appendChild(hiddenInput);
                    // Submit the form
                    form.submit();
                }
            });
        
        </script>
    @endif
@endsection
