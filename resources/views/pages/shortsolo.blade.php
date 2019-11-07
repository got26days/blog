@extends('pages.master')

@section('content')

<div class="container solo-page">
    <div class="row padder-main-row ">
        <div class="col-sm-12 col-md-6 col-lg-5 contnet secondary-main">
            <div class="news-solo target">
                
                    <div class="prenews">
                    <img src="/storage/{{ $solo['image']}}" alt="">
                        <div class="titletoppreviewmain">
                            {{ $solo['title'] }}
                            <div class="area-watch">
                                <a class="btn btn-primary" href="{{ $solo['link'] }}" role="button"
                                    style="max-width: 190px;">Читать
                                    полностью</a>
                                <div class="iconwatch2">
                                    @if($solo['teaser1'])
                                    <i class="fas fa-eye"></i> <span>{{ $solo['teaser1'] }}</span>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                
                <div class="teasers">

                    @if (count($area2) > 0)
                    <div class="more-read">
                        <h5>ЧИТАЙТЕ ТАКЖЕ:</h5>

                        @foreach($area2 as $link)
                        <div class="more-read__solo">
                            <div class="container">
                                <a href="{{ $link['link'] }}" onclick="ym(54175381, 'reachGoal', 'LAND')">
                                    <img src="{{Voyager::image($link->thumbnail('cropped','image'))}}">
                                </a>
                                <div class="more-read__solo-area">
                                    <a href="{{ $link['link'] }}"
                                        onclick="ym(54175381, 'reachGoal', 'LAND')">{{ $link->title }}</a>
                                    <div class="area-watch">
                                        <a class="btn " href="{{ $link['link'] }}" role="button"
                                            onclick="ym(54175381, 'reachGoal', 'LAND')">Подробнее</a>
                                        <div class="iconwatch2">
                                                @if($link['teaser1'])
                                            <i class="fas fa-eye"></i> <span>{{ $link['teaser1'] }}</span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                    @endif
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-7 secondary__aside">
            <div id="sidebar" class="fixed-box">
                <div class="row">
                    @if (count($area3) > 0)
                    @foreach($area3 as $key=>$link)
                    @if($key == 4)
                    <div class="col-sm-6 col-md-6 col-lg-4">
                        <a href="{{ $link['link'] }}" target="_blank">
                            <div class="lefar-card lefar-card__secgrey">
                                <img src="{{Voyager::image($link->thumbnail('small','image'))}}"
                                    style="min-height: 155px;">

                                <p>
                                    {{ $link->title }}
                                </p>
                                <div class="area-watch">
                                    <a href="{{ $link['link'] }}" role="button" class="btn" target="_blank"
                                        onclick="ym(54175381, 'reachGoal', 'LAND')">Подробнее</a>
                                    <div class="iconwatch2">
                                            @if($link['teaser1'])
                                        <i class="fas fa-eye"></i> <span>{{ $link['teaser1'] }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    @else
                    <div class="col-sm-6 col-md-6 col-lg-4">
                        <a href="{{ $link['link'] }}" target="_blank">
                            <div class="lefar-card">
                                <img src="{{Voyager::image($link->thumbnail('small','image'))}}"
                                    style="min-height: 155px;">

                                <p>
                                    {{ $link->title }}
                                </p>
                                <div class="area-watch">
                                    <button href="{{ $link['link'] }}" role="button" class="btn" target="_blank"
                                        onclick="ym(54175381, 'reachGoal', 'LAND')">Подробнее</button>
                                    <div class="iconwatch2">
                                            @if($link['teaser1'])
                                        <i class="fas fa-eye"></i> <span>{{ $link['teaser1'] }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    @endif
                    @endforeach
                    @endif
                </div>
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-8">
                        @if (count($area4) > 0)
                        @foreach($area4 as $link)
                        <div class="width-card">
                            <a href="{{ $link['link'] }}" target="_blank" onclick="ym(54175381, 'reachGoal', 'LAND')">
                                <img src="{{Voyager::image($link->thumbnail('small','image'))}}" style="height: 90px;">
                            </a>
                            <div class=wc-content>
                                <a href="{{ $link['link'] }}" target="_blank"
                                    onclick="ym(54175381, 'reachGoal', 'LAND')">
                                    {{ $link->title }}
                                </a>
                                <div class="area-watch">
                                    <a class="btn " href="{{ $link['link'] }}" role="button"
                                        target="_blank">Подробнее</a>
                                    <div class="iconwatch2">
                                            @if($link['teaser1'])
                                        <i class="fas fa-eye"></i> <span>{{ $link['teaser1'] }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                        @endif


                    </div>

                    @if (count($area5) > 0)
                    <div class="col-sm-12 col-md-12 col-lg-4">
                        @foreach($area5 as $link)
                        <div class="lk-revelation">
                            <a href="{{ $link['link'] }}" target="_blank" onclick="ym(54175381, 'reachGoal', 'LAND')">
                                <img src="/storage/{{ $link->image }}">
                                <div class="lk-revelation__title">
                                    {{ $link->title }}
                                </div>
                                <div class="area-watch">
                                    <a class="btn " href="{{ $link['link'] }}" role="button"
                                        target="_blank">Подробнее</a>
                                    <div class="iconwatch2">
                                            @if($link['teaser1'])
                                        <i class="fas fa-eye"></i> <span>{{ $link['teaser1'] }}</span>
                                        @endif
                                    </div>
                                </div>
                            </a>
                        </div>
                        @endforeach
                    </div>
                    @endif
                </div>
            </div>
        </div>

    </div>
    <div class="new-srow ">

        @if (count($area6) > 4)
        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-5 ">
                <div class="row newsupx">
                    @foreach($area6->slice(0, 2) as $link)
                    <div class="col-sm-12 col-md-12 col-lg-6">
                        <a href="{{ $link['link'] }}" target="_blank" target="_blank"
                            onclick="ym(54175381, 'reachGoal', 'LAND')">
                            <div class="lefar-card {{ $link->color }}">
                                <img src="/storage/{{ $link->image }}">

                                <p>
                                    {{ $link->title }}
                                </p>
                                <div class="area-watch">
                                    <a href="{{ $link['link'] }}" role="button" class="btn"
                                        target="_blank">Подробнее</a>
                                    <div class="iconwatch2">
                                            @if($link['teaser1'])
                                        <i class="fas fa-eye"></i> <span>{{ $link['teaser1'] }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    @endforeach
                </div>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-7">
                <div class="row newsupx">
                    @foreach($area6->slice(2, 5) as $link)
                    <div class="col-sm-12 col-md-12 col-lg-4">
                        <a href="{{ $link['link'] }}" target="_blank" onclick="ym(54175381, 'reachGoal', 'LAND')">
                            <div class="lefar-card {{ $link->color }}">
                                <img src="/storage/{{ $link->image }}">

                                <p class="prod-element">
                                    {{ $link->title }}
                                </p>
                                <div class="area-watch">
                                    <a href="{{ $link['link'] }}" role="button" class="btn" target="_blank"
                                        onclick="ym(54175381, 'reachGoal', 'LAND')">Подробнее</a>
                                    <div class="iconwatch2">
                                            @if($link['teaser1'])
                                        <i class="fas fa-eye"></i> <span>{{ $link['teaser1'] }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
        @endif


        <div class="row new-srow__back">
            <div class="col-sm-12 col-md-12 col-lg-5">
                <div class="yllow-area">
                    <div class="row">

                        @if (count($area7) > 0)
                        @foreach($area7 as $link)
                        <div class="yllow-card">
                            <a href="{{ $link['link'] }}" target="_blank" onclick="ym(54175381, 'reachGoal', 'LAND')">
                                <img src="/storage/{{ $link->image }}">
                            </a>
                            <div class="area-watch">
                                <a href="{{ $link['link'] }}" target="_blank">
                                    {{ $link->title }}
                                </a>
                                <div class="iconwatch3">
                                    @if($link['teaser1'])
                                    <i class="fas fa-eye"></i> <span>{{ $link['teaser1'] }}</span>
                                    @endif
                                </div>
                            </div>
                        </div>
                        @endforeach
                        @endif



                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-7">
                <div class="row newsupx">
                    @if (count($area8) > 0)
                    @foreach($area8 as $link)
                    <div class="col-sm-12 col-md-6 col-lg-4">
                        <a href="{{ $link['link'] }}">
                            <div class="lefar-card {{ $link->color }}">
                                <a href="{{ $link['link'] }}" target="_blank"
                                    onclick="ym(54175381, 'reachGoal', 'LAND')">
                                    <img src="/storage/{{ $link->image }}">
                                </a>
                                <p>
                                    {{ $link->title }}
                                </p>
                                <div class="area-watch">
                                    <a href="{{ $link['link'] }}" role="button" class="btn" target="_blank"
                                        onclick="ym(54175381, 'reachGoal', 'LAND')">Подробнее</a>
                                    <div class="iconwatch2">
                                        @if($link['teaser1'])
                                        <i class="fas fa-eye"></i> <span>{{ $link['teaser1'] }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    @endforeach
                    @endif
                </div>
            </div>
        </div>


        <overload :postid="{{ $solo->id }}" :short="true"></overload>

    </div>

</div>

@endsection


@section('scripts')

<script>
    $(document).ready(function () {

        if (window.matchMedia("(min-width: 992px)").matches) {

            var dstatic = $('.secondary-main');
            var fixed = $('.fixed-box');
            var wrapper = $('.secondary__aside');

            if (dstatic.outerHeight(true) > fixed.outerHeight(true)) {
                $(window).scroll(function () {
                    var nsc = $(document).scrollTop();
                    var bp1 = wrapper.offset().top;
                    var bp2 = bp1 + wrapper.outerHeight() - fixed.height();

                    if (nsc > bp1) {
                        fixed.css('position', 'fixed');
                    } else {
                        fixed.css('position', 'relative');
                    }
                    if (nsc > bp2) {
                        fixed.css('top', bp2 - nsc);
                    } else {
                        fixed.css('top', '0');
                    }
                });
            }


        }

    });


    function adjustWidth() {
        var parentwidth = $(".secondary__aside").width();
        $(".fixed-box").width(parentwidth);
    }

    $(function () {

        $(window).resize(
            function () {
                adjustWidth();
            })

    })

    $(window).scroll(function () {
        adjustWidth();
    });

</script>

@endsection
