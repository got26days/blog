@extends('pages.master')

@section('content')

<div class="container solo-page">
    <div class="row padder-main-row ">
        <div class="col-sm-12 col-md-6 col-lg-5 contnet secondary-main">
            <div class="news-solo target">
                <img src="{{Voyager::image($solo->thumbnail('medium','image'))}}">
                <div class="news-solo__teaser">
                    <h3>
                        {{ $solo->title }}
                    </h3>
                </div>
                <div class="teasers">
                    <div class="teaser">
                        @isset($area9[3])
                        <div class="teaser-title">
                            <div class="container title-area">
                                <a href="{{ $area9[3]['link'] }}" class="title-area" style="text-decoration: none;"
                                    target="_blank" onclick="ym(54175381, 'reachGoal', 'LAND')">
                                    <img src="{{Voyager::image($area9[3]->thumbnail('cropped','image'))}}">
                                    <div>
                                        {{ $area9[3]['title'] }}
                                    </div>
                                    <div class="iconwatch">
                                        @if($area9[3]['teaser1'])
                                        <i class="fas fa-eye"></i> <span>{{ $area9[3]['teaser1'] }}</span>
                                        @endif
                                    </div>
                                </a>
                            </div>
                        </div>
                        @endisset
                        @isset($solo->body1)
                        <div class="container">
                            {!! $solo->body1 !!}
                        </div>
                        @endisset
                    </div>
                    <div class="teaser">
                        @isset($area9[4])
                        <div class="teaser-title">
                            <div class="container title-area">
                                <a href="{{ $area9[4]['link'] }}" class="title-area" style="text-decoration: none;"
                                    target="_blank" onclick="ym(54175381, 'reachGoal', 'LAND')">
                                    <img src="{{Voyager::image($area9[4]->thumbnail('cropped','image'))}}">
                                    <div>
                                        {{ $area9[4]['title'] }}
                                    </div>
                                    <div class="iconwatch">
                                        @if($area9[4]['teaser1'])
                                        <i class="fas fa-eye"></i> <span>{{ $area9[4]['teaser1'] }}</span>
                                        @endif
                                    </div>
                                </a>
                            </div>
                        </div>
                        @endisset
                        @isset($solo->body2)
                        <div class="container">

                            {!! $solo->body2 !!}

                        </div>
                        @endisset
                    </div>
                    <div class="teaser">
                        @isset($area9[5])
                        <div class="teaser-title">
                            <div class="container title-area">
                                <a href="{{ $area9[5]['link'] }}" class="title-area" style="text-decoration: none;"
                                    target="_blank" onclick="ym(54175381, 'reachGoal', 'LAND')">
                                    <img src="{{Voyager::image($area9[5]->thumbnail('cropped','image'))}}" alt="image">
                                    <div>
                                        {{ $area9[5]['title'] }}
                                    </div>
                                    <div class="iconwatch">
                                        @if($area9[5]['teaser1'])
                                        <i class="fas fa-eye"></i> <span>{{ $area9[5]['teaser1'] }}</span>
                                        @endif
                                    </div>
                                </a>
                            </div>
                        </div>
                        @endisset
                        @isset($solo->body3)
                        <div class="container">

                            {!! $solo->body3 !!}

                        </div>
                        @endisset
                    </div>

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
                                    <div class="area-watch2">
                                        <a class="btn " href="{{ $link['link'] }}" role="button"
                                            onclick="ym(54175381, 'reachGoal', 'LAND')">Подробнее</a>
                                        <div class="iconwatch5">
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
                        <a href="{{ $link['link'] }}" target="_blank" onclick="ym(54175381, 'reachGoal', 'LAND')">
                            <div class="width-card" style="display: flex;">

                                <img src="{{Voyager::image($link->thumbnail('small','image'))}}" style="height: 90px;">

                                <div class=wc-content>

                                    {{ $link->title }}

                                    <div class="area-watch">
                                        <button class="btn " href="{{ $link['link'] }}" role="button"
                                            target="_blank">Подробнее</button>
                                        <div class="iconwatch2">
                                            @if($link['teaser1'])
                                            <i class="fas fa-eye"></i> <span>{{ $link['teaser1'] }}</span>
                                            @endif
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </a>
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
                                    <button class="btn " href="{{ $link['link'] }}" role="button"
                                        target="_blank">Подробнее</button>
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
                                    <button href="{{ $link['link'] }}" role="button" class="btn"
                                        target="_blank">Подробнее</button>
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
                        <a href="{{ $link['link'] }}" target="_blank" onclick="ym(54175381, 'reachGoal', 'LAND')">
                            <div class="yllow-card">

                                <img src="/storage/{{ $link->image }}">

                                <div class="area-watch">

                                    {{ $link->title }}

                                    <div class="iconwatch3">
                                        @if($link['teaser1'])
                                        <i class="fas fa-eye"></i> <span>{{ $link['teaser1'] }}</span>
                                        @endif
                                    </div>
                                </div>

                            </div>
                        </a>
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

                                <img src="/storage/{{ $link->image }}">

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
                    @endforeach
                    @endif
                </div>
            </div>
        </div>


        <overload :postid="{{ $solo->id }}"></overload>

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
