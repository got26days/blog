@extends('pages.master')

@section('content')

<div class="container solo-page">
        <overload :ops="{{ $ops }}" :postid="{{ $solo->id }}"></overload>
</div>

@endsection

@section('scripts')

<script type="text/javascript">

        history.pushState(null, null, location.href);
                window.onpopstate = function () {
                history.go(1);
        };
        
</script>

@endsection