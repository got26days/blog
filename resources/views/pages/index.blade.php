@extends('pages.master')

@section('content')

<div class="container">
    <div class="row padder-main-row">
        <div class="col-sm-12 col-md-12 col-lg-9"> 
           <section class="top-news">
               <div class="row">
                    @foreach($mainnews as $mainnew)
                    <div class="col-sm-12 col-md-6 col-lg-6">
                         <div class="teaser_image">                                
                             <a href="/post{{  $mainnew->id }}" class="top-images">
                                <img src="{{Voyager::image($mainnew->thumbnail('new', 'image'))}}" alt="images">
                            </a>
                             <a href="/post{{  $mainnew->id }}" class="utm_links click_link utm_loaded" target="_blank">
                                 <div class="teaser_text"> {{  $mainnew->id }} {{  $mainnew->title }}</div>
                             </a>
                         </div>
                    </div>   
                    @endforeach
               </div>    
           </section>
           <section>
           <loaditem :option="{{ $position }}" :lastop="{{ $lastop }}"></loaditem>
           </section>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-3 display-mobile"> 
            @include('pages.component.mainleft')
        </div>
    </div>
</div>

@endsection
