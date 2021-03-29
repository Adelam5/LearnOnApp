<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;

class PaymentController extends Controller
{
   /*  public function payment(){
        $user = Auth::user();
        $title = 'Subscription';
        return view('pages.payment')->with([
            'title' => $title,
            'intent' => $user->createSetupIntent()
        ]);
    }
 */
    function __construct()
    {
        $this->middleware('auth');
    }

    public function payment()
    {
        $title = 'Subscription';
        $availablePlans =[
           'price_1HdtwoED8dpSHnI3zH40cnhb' => "Yearly",
        ];
        $data = [
            'title' => $title,
            'intent' => auth()->user()->createSetupIntent(),
            'plans'=> $availablePlans
        ];
        return view('pages.payment')->with($data);
    }

    public function subscribe(Request $request)
    {
        $user = auth()->user();
        $paymentMethod = $request->payment_method;

        $planId = $request->plan;
        $user->newSubscription('main', $planId)->create($paymentMethod);

        return response([
            'success_url'=> redirect()->intended('/')->getTargetUrl(),
            'message'=>'success'
        ]);

    }
}
