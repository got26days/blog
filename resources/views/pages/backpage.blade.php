@extends('pages.master')

@section('content')

<div class="container solo-page">
        <overload :ops="{{ $ops }}" :postid="{{ $solo->id }}"></overload>
</div>

@endsection