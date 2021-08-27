@extends('layout')

@section('content')
    <section class="max-w-md mx-auto py-8 ">
        <h1 class="text-lg font-bold mb-4">
            Publish New Post
        </h1>
        <form method="POST" action="/posts" enctype="multipart/form-data" class="border border-gray-200 p-6 rounded-xl">
            @csrf
            <div class="mb-6 ">
                <label for="title" class="block mb-2 uppercase font-bold text-xs text-gray-700">Title</label>

                <input type="text" name="title" id="title" class="border border-gray-400 p-2 w-full" value="{{ old('title') }}">

                @error('title')
                    <p class="text-red-500 text-xs mt-2">{{ $message }}</p>
                @enderror
            </div>

            <div class="mb-6 ">
                <label for="excerpt" class="block mb-2 uppercase font-bold text-xs text-gray-700">Excerpt</label>

                <input type="text" name="excerpt" id="excerpt" class="border border-gray-400 p-2 w-full" value="{{ old('excerpt') }}">

                @error('excerpt')
                    <p class="text-red-500 text-xs mt-2">{{ $message }}</p>
                @enderror
            </div>

            <div class="mb-6 ">
                <label for="thumbnail" class="block mb-2 uppercase font-bold text-xs text-gray-700">Thumbnail</label>

                <input type="file" name="thumbnail" id="thumbnail" class="border border-gray-400 p-2 w-full" value="{{ old('thumbnail') }}">

                @error('thumbnail')
                    <p class="text-red-500 text-xs mt-2">{{ $message }}</p>
                @enderror
            </div>

            <div class="mb-6 ">
                <label for="body" class="block mb-2 uppercase font-bold text-xs text-gray-700">Body</label>

                <input type="text" name="body" id="body" class="border border-gray-400 p-2 w-full" value="{{ old('body') }}">

                @error('body')
                    <p class="text-red-500 text-xs mt-2">{{ $message }}</p>
                @enderror   
            </div>

            <div class="mb-6 ">
                <label for="Category" class="block mb-2 uppercase font-bold text-xs text-gray-700">Category</label>

                <select name="category_id"> 
                    @php
                        $categories = \App\Models\Category::all();
                    @endphp
                    
                    @foreach ($categories as $category)
                        <option value="{{ $category->id }}" {{ old('category_id') == $category->id ? 'selected' : "" }}>
                            {{ ucwords($category->name) }}
                        </option>
                    @endforeach
                </select>

                @error('category_id')
                    <p class="text-red-500 text-xs mt-2">{{ $message }}</p>
                @enderror
            </div>

            <button type="submit" 
            class="bg-blue-500 text-white uppercase font-semibold text-xs py-2 px-10 rounded-2xl hover:bg-blue-600">Publish</button>

        </form>
    </section>
@endsection