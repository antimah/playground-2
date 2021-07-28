<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Category;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class PostController extends Controller
{
    //
    public function index(){
        
        return view('posts.index', [
         // 'posts' => Post::latest()->with('category','author')->get(),
          'posts'=>Post::latest()->with('category','author')
          ->filter(request(['search','category','author']))->paginate(6)->withQueryString(),
          'categories'=> Category::all(),
          'currentCategory' => Category::firstWhere('name',request('category'))

          //  'posts' => Post::all()
        ]);
      //return abort(404);
    }
    
    public function show(Post $post){
        return view('posts.show' , [
            'post' => Post::findOrFail($post->id)
        ]);
    }
    
    public function create(){
        if(auth()->guest()){
            abort(403);
        }

        return view('posts.create');
    }

    public function store(){


        $attributes = request()->validate([
            'title'=>['required',Rule::unique('posts','title')],
            'excerpt'=>['required'],
            'body'=>['required'],
            'category_id'=>['required',Rule::exists('categories','id')],
        ]);

        $attributes['user_id'] = auth()->id();

        Post::create($attributes);

        return redirect('/'); //or redirect to the newly created post. 
    }
}
