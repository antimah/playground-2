<?php

namespace App\Http\Controllers;

use Illuminate\Auth\Middleware\Authenticate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SessionController extends Controller
{
    //
    public function destroy(){
        Auth::logout();

        session()->flash('success','Goodbye!');
        return redirect('/');
    }

    public function create(){
        return view('sessions.create');
    }

    public function store(){
         $attributes = request()->validate([
             'email' => ['required','email','exists:users,email'],
             'password' => ['required']
         ]);
        
         if(Auth::attempt($attributes)){
             session()->flash('success','Welcome back!');
             return redirect('/');
         }
         
         return back()->withErrors(['email'=>'Your provided credentials could not be verified']);


    }
}
