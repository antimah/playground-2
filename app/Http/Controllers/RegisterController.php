<?php

namespace App\Http\Controllers;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RegisterController extends Controller
{
    //
    public function create(){
        return view('register.create');
    }

    public function store(){
        $attributes = request()->validate([
            'name' => ['required','min:1','max:255'],
            'username'=>['required','unique:users,username'],
            'email'=>['required','email','max:255','unique:users,email'],
            'password'=> ['required']
        ]);

        $attributes['password'] = bcrypt($attributes['password']);

        $user = User::create($attributes);

        //auth()->login($user);
        Auth::login($user);

        session()->flash('success','Your account has been created!');

        return redirect('/');
    }
}
