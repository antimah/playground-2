@extends('layout')

@section('content')
@include('posts._header')
<main class="max-w-6xl mx-auto mt-6 lg:mt-20 space-y-6">
  @if($posts->count())
  <x-posts-grid :posts="$posts" />
  
  {{  $posts->links() }}
{{-- 
    <div class="lg:grid lg:grid-cols-3">
      <x-post-card />
      <x-post-card />
      <x-post-card />
    </div> --}}
    @else
      <p class="text-center">No posts yet. Please come back later.</p>
    @endif
</main>
@endsection
