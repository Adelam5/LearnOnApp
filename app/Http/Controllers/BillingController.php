<?php

namespace App\Http\Controllers;

use Auth;
use Stripe\SetupIntent;
use Laravel\Cashier\Cashier;
use Illuminate\Http\Request;
use App\Subscription;
use Laravel\Cashier\Exceptions\IncompletePayment;

class BillingController extends Controller
{

    public function retrievePlans() {
        $key = \config('services.stripe.secret');
        $stripe = new \Stripe\StripeClient($key);
        $plansraw = $stripe->plans->all(['product' => 'prod_Il9nswaWzwDz19']);
        $plans = $plansraw->data;
        
        foreach($plans as $plan) {
            $prod = $stripe->products->retrieve(
                $plan->product,[]
            );
            $plan->product = $prod;
        }
        return $plans;
    }   

    public function subscriptions_management(){
        $user = Auth::user();
        $subscriptions = Subscription::all();
        $plans = ([
            'price_1IJG6ZED8dpSHnI3BAIvHwQf' => 'Daily',
            'price_1I9dU0ED8dpSHnI3Dgzjt6SP' => 'Monthly',
            'price_1I9dU0ED8dpSHnI3I1CXIKFw' => 'Yearly'
        ]);
        return view('admin.users.subscriptions')->with([
            'user' => $user,
            'subscriptions' => $subscriptions,
            'plans' => $plans
        ]);
    }
    
    public function showJoin() {       
        
        $intent = SetupIntent::create(
            [], Cashier::stripeOptions()
        );
        $plans = $this->retrievePlans();
        $user = Auth::user();
        
        return view('join', [
            compact('intent'),
            'user'=>$user,
            'intent' => $user->createSetupIntent(),
            'plans' => $plans
        ]);
    } 


    public function index (Request $request) {
        $user = auth()->user();
        $planId = $request->plan;
        try {
            $newSubscription = $user->newSubscription('main', $planId)->create($request->payment_method, ['email' => $user->email]);
        } catch ( IncompletePayment $exception ){
            return redirect()->route(
                'cashier.payment',
                [$exception->payment->id, 'redirect' => route('home')]
            );

            //route('cashier.payment', $subscription->latestPayment()->id)
        }
        

        return redirect()->back();
    }

    public function reprocess(Request $request){
        return $this->newSubscription($request->payment_method);
    }

    public function newSubscription($paymentMethod){
        $user = auth()->user();
        $planId = $request->plan;
        try {
            $newSubscription = $user->newSubscription('main', $planId)->create($paymentMethod, ['email' => $user->email]);
        } catch ( IncompletePayment $exception ){
            return redirect()->route(
                'cashier.payment',
                [$exception->payment->id, 'redirect' => route('home')]
            );

            //route('cashier.payment', $subscription->latestPayment()->id)
        }        

        return redirect()->back();
    }

    public function cancelSubscription(){
        $user = auth()->user();
        $user->subscription('main')->cancel();
        return redirect()->back();
    }

}
