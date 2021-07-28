<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    protected $guarded = [];
    //or fillable with specifications.
    public function category(){
      return $this->belongsTo(Category::class);
    }

    public function author(){
      return $this->belongsTo(User::class,'user_id');
    }

    public function comments(){
      return $this->hasMany(Comment::class);
    }

    public function scopeFilter($query, array $filters){

      if(isset($filters['search'])){
        $query->where(fn($query)=>
         $query->where('title','like','%'.$filters['search'].'%')
        ->orWhere('body','like','%'.$filters['search']));
      }

      if(isset($filters['category'])){
        $query->whereExists(fn($query)=>
          $query->from('categories')
          ->whereColumn('categories.id','posts.category_id')
          ->where('categories.name',$filters['category']));
      }

      if(isset($filters['author'])){
        $query->whereExists(fn($query)=>
          $query->from('users')
          ->whereColumn('users.id','posts.id')
          ->where('users.username',$filters['author']));
      }

    }
}
