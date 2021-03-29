<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Mail;

class ContactMessageController extends Controller
{
    public function create(){
        $title = 'Contact';
        return view('pages.contact')->with('title', $title);
    }

    public function store(Request $request){
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email',
            'message' => 'required'
        ]);
        
        Mail::send('emails.contact-message', [
            'email' => $request->email,
            'name' => $request->name,
            'subject' => $request->subject,
            'messages' => $request->message
        ], function($mail) use($request) {
            $mail->from($request->email, $request->name);
            $mail->to('merdzanicadela@gmail.com');
        });

        return redirect()->back()->with('success', 'Message sent');
    }
}
