<?php

use Illuminate\Support\Facades\Route;
use App\Models\Post;
use App\Models\User;
use App\Models\Category;
use App\Http\Controllers\PostController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\SessionController;
use App\Http\Controllers\CommentController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', [PostController::class,'index'])->name('home');

Route::get('posts/{post:title}', [PostController::class,'show'])->name('show');
Route::post('/posts/{post:title}/comments',[CommentController::class,'store'])->middleware('auth');
Route::get('post/create', [PostController::class,'create']);
Route::post('/posts',[PostController::class,'store'])->middleware('auth');



Route::get('register',[RegisterController::class,'create'])->middleware('guest'); 
Route::post('register',[RegisterController::class,'store'])->middleware('guest');

Route::post('logout',[SessionController::class,'destroy'])->middleware('auth');
Route::get('login',[SessionController::class,'create'])->middleware('guest');
Route::post('login',[SessionController::class,'store'])->middleware('guest');

// testing



  // cache()-remember("posts.{$slug}", 15, function() use ($path){
  // use caching for faster loading.

/*Route::get('categories/{category:name}', function(Category $category){

  return view('posts.index', [
  //  'posts' => Category::with('posts')->get()
    'posts' => $category->posts->load(['category','author']),
    'currentCategory' => $category,
    'categories'=> Category::all()
  ]);
})->name('category'); */
/*
Route::get('authors/{author:username}', function(User $author){
  //dd($author);
  return view('posts.index', [
    'posts' => $author->posts->load(['category','author']),
    'categories'=> Category::all()
  ]);
});
*/
