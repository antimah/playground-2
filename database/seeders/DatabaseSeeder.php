<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Category;
use App\Models\Post;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $user = User::factory()->create([
        //   //'name' => 'John Doe'
        // ]);
        
        Post::factory(15)->create([
          //'user_id' => $user->id
        ]);


      /*   $user = User::factory()->create();

         $personal = Category::create([
           'name' => 'Personal'
         ]);

         $family = Category::create([
           'name' => 'Family'
         ]);

         $work = Category::create([
           'name' => 'Work'
         ]);

         Post::create([
           'user_id' => $user->id,
           'category_id' => $personal->id,
           'title' => 'My personalz Post',
           'excerpt' => 'Some excerpt i dunno',
           'body' => 'This is the body of the post'
         ]);


         Post::create([
           'user_id' => $user->id,
           'category_id' => $family->id,
           'title' => 'My Familyzz Post',
           'excerpt' => 'Some excerpt i dunno',
           'body' => 'This is the body of the post'
         ]);

         Post::create([
           'user_id' => $user->id,
           'category_id' => $work->id,
           'title' => 'My workz Post',
           'excerpt' => 'Some excerpt i dunno',
           'body' => 'This is the body of the post'
         ]);

         */
    }
}
