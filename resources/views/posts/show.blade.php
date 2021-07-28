@extends('layout')

@section('content')
    <section class="px-6 py-8">

        <main class="max-w-6xl mx-auto mt-10 lg:mt-20 space-y-6">
            <article class="max-w-4xl mx-auto lg:grid lg:grid-cols-12 gap-x-10">
                <div class="col-span-4 lg:text-center lg:pt-14 mb-10">
                    <img src="/images/illustration-1.png" alt="" class="rounded-xl">

                    <p class="mt-4 block text-gray-400 text-xs">
                        Published <time>{{ $post->created_at->diffForHumans() }} </time>
                    </p>

                    <div class="flex items-center lg:justify-center text-sm mt-4">
                        <img src="/images/lary-avatar.svg" alt="Lary avatar">
                        <div class="ml-3 text-left">
                            <a href="/?author={{$post->author->username}}">
                                <h5 class="font-bold">{{ $post->author->name }}</h5>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-span-8">
                    <div class="hidden lg:flex justify-between mb-6">
                        <a href="/"
                            class="transition-colors duration-300 relative inline-flex items-center text-lg hover:text-blue-500">
                            <svg width="22" height="22" viewBox="0 0 22 22" class="mr-2">
                                <g fill="none" fill-rule="evenodd">
                                    <path stroke="#000" stroke-opacity=".012" stroke-width=".5" d="M21 1v20.16H.84V1z">
                                    </path>
                                    <path class="fill-current"
                                        d="M13.854 7.224l-3.847 3.856 3.847 3.856-1.184 1.184-5.04-5.04 5.04-5.04z">
                                    </path>
                                </g>
                            </svg>

                            Back to Posts
                        </a>

                        <div class="space-x-2">
                            <a href="/?category={{ $post->category->name }}"
                                class="px-3 py-1 border border-blue-300 rounded-full text-blue-300 text-xs uppercase font-semibold"
                                style="font-size: 10px">{{ $post->category->name }}</a>
                        </div>
                    </div>

                    <h1 class="font-bold text-3xl lg:text-4xl mb-10">
                        {{ $post->title }}
                    </h1>

                    <div class="space-y-4 lg:text-lg leading-loose">
                        {{ $post->body }}
                    </div>
                </div>

                <section class="col-span-8 col-start-5 mt-10 space-y-6">
                    @auth
                    <form method="POST" action="/posts/{{$post->title}}/comments" class="border border-gray-200 p-6 rounded-xl">
                        @csrf
                        <header class="flex items-center">
                            <img src="https://i.pravatar.cc/40?u={{ auth()->id()}}" width="40" height="40" class="rounded-full" alt="">
                            <h2 class="ml-4">Want to participate?</h2>
                        </header>
                        <div class="mt-6">
                            <textarea class="w-full text-sm focus:outline-none focus:ring" 
                            name="body" 
                            placeholder="Quick, think of something to say!" 
                            id="" 
                            cols="30" 
                            rows="6"
                            required></textarea>
                            @error('body')
                                <span class="text-xs text-red-500">{{$message}}</span>
                            @enderror
                        </div>
                        <div class="flex justify-end mt-6 border-t border-gray-200 pt-6">
                            <button class="bg-blue-500 text-white uppercase font-semibold text-xs py-2 px-10 rounded-2xl hover:bg-blue-600">Submit</button>
                        </div>
                    </form>
                    @foreach($post->comments as $comment)
                        <article class="flex bg-gray-100 p-6 rounded-xl border border-gray-200 space-x-4">
                            <div class="flex-shrink-0">
                                <img src="https://i.pravatar.cc//60?u={{$comment->user_id}}" width="60" height="60" class="rounded-xl"  alt="">
                            </div>
                            <div>
                                <header class="mb-4">
                                    <h3 class="font-bold">{{$comment->author->username}}</h3>
                                    <p class="text-xs">Posted <time>{{$comment->created_at->format("F j, Y, g:i a")}}</time></p>
                                </header>
                                <p>{{$comment->body}}</p>
                            </div>
                        </article>
                    @endforeach
                    @else 
                    @foreach($post->comments as $comment)
                    <article class="flex bg-gray-100 p-6 rounded-xl border border-gray-200 space-x-4">
                        <div class="flex-shrink-0">
                            <img src="https://i.pravatar.cc//60?u={{$comment->user_id}}" width="60" height="60" class="rounded-xl"  alt="">
                        </div>
                        <div>
                            <header class="mb-4">
                                <h3 class="font-bold">{{$comment->author->username}}</h3>
                                <p class="text-xs">Posted <time>{{$comment->created_at->format("F j, Y, g:i a")}}</time></p>
                            </header>
                            <p>{{$comment->body}}</p>
                        </div>
                    </article>
                @endforeach
                
                        <p class="font-semibold"> 
                         <a href="/register" class="hover:underline">Register or <a href="/login" class="hover:underline"> Log in to leave a comment></a>
                        </p> 
                    @endauth
                </section>

                
            </article>
        </main>

    </section>
@endsection
