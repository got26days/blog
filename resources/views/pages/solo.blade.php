@extends('pages.master')

@section('content')

<div class="container solo-page">

    {{App::environment()}}

    123123

    {{ env('APP_ENV') }}

    <div class="row padder-main-row">

        <div class="col-sm-12 col-md-6 col-lg-5 contnet">
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
                                <a href="{{ $area9[3]['link'] }}" class="title-area" style="text-decoration: none;" target="_blank">
                                    <img src="{{Voyager::image($area9[3]->thumbnail('cropped','image'))}}">
                                    <div>
                                        {{ $area9[3]['title'] }}
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
                                <a href="{{ $area9[4]['link'] }}" class="title-area" style="text-decoration: none;" target="_blank">
                                    <img src="{{Voyager::image($area9[4]->thumbnail('cropped','image'))}}">
                                    <div>
                                        {{ $area9[4]['title'] }}
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
                                <a href="{{ $area9[5]['link'] }}" class="title-area" style="text-decoration: none;" target="_blank">
                                    <img src="{{Voyager::image($area9[5]->thumbnail('cropped','image'))}}" alt="image">
                                    <div>
                                        {{ $area9[5]['title'] }}
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
                    <div class="social-area container">
                        <div class="social-link">
                            <a class="icon-fromsolo vk-icon" href="/">
                                <i class="fab fa-vk"></i>
                            </a>
                            <a class="icon-fromsolo ok-icon" href="/">
                                <i class="fab fa-odnoklassniki"></i>
                            </a>
                            <a class="icon-fromsolo fb-icon" href="/">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a class="icon-fromsolo viber-icon" href="/">
                                <i class="fab fa-viber"></i>
                            </a>
                            <a class="icon-fromsolo whats-icon" href="/">
                                <i class="fab fa-whatsapp"></i>
                            </a>
                            <a class="icon-fromsolo telegram-icon" href="/">
                                <i class="fab fa-telegram-plane"></i>
                            </a>
                            <a class="icon-fromsolo twitter-icon" href="/">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a class="icon-fromsolo skype-icon" href="/">
                                <i class="fab fa-skype"></i>
                            </a>
                        </div>
                    </div>
                    @if (count($area2) > 0)
                    <div class="more-read">
                        <h5>ЧИТАЙТЕ ТАКЖЕ:</h5>

                        @foreach($area2 as $link)
                        <div class="more-read__solo">
                            <div class="container">
                                <a href="{{ $link['link'] }}">
                                    <img src="{{Voyager::image($link->thumbnail('cropped','image'))}}">
                                </a>
                                <div class="more-read__solo-area">
                                    <a href="{{ $link['link'] }}">{{ $link->title }}</a>
                                    <a class="btn " href="{{ $link['link'] }}" role="button">Подробнее</a>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                    @endif
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-7 sidebar">
            <div class="row">
                @if (count($area3) > 0)
                @foreach($area3 as $key=>$link)
                @if($key == 4)
                <div class="col-sm-6 col-md-6 col-lg-4">
                    <a href="{{ $link['link'] }}" target="_blank">
                        <div class="lefar-card lefar-card__secgrey">
                            <img src="{{Voyager::image($link->thumbnail('small','image'))}}" style="min-height: 155px;">

                            <p>
                                {{ $link->title }}
                            </p>

                            <a href="{{ $link['link'] }}" role="button" class="btn" target="_blank">Подробнее</a>
                        </div>
                    </a>
                </div>
                @else
                <div class="col-sm-6 col-md-6 col-lg-4">
                    <a href="{{ $link['link'] }}" target="_blank">
                        <div class="lefar-card">
                            <img src="{{Voyager::image($link->thumbnail('small','image'))}}" style="min-height: 155px;">

                            <p>
                                {{ $link->title }}
                            </p>

                            <a href="{{ $link['link'] }}" role="button" class="btn" target="_blank">Подробнее</a>
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
                        <a href="{{ $link['link'] }}" target="_blank">
                            <img src="{{Voyager::image($link->thumbnail('small','image'))}}" style="height: 90px;">
                        </a>
                        <div class=wc-content>
                            <a href="{{ $link['link'] }}" target="_blank">
                                {{ $link->title }}
                            </a>
                            <a class="btn " href="{{ $link['link'] }}" role="button" target="_blank">Подробнее</a>
                        </div>
                    </div>
                    @endforeach
                    @endif


                </div>

                @if (count($area5) > 0)
                <div class="col-sm-12 col-md-12 col-lg-4">
                    @foreach($area5 as $link)
                    <div class="lk-revelation">
                        <a href="{{ $link['link'] }}" target="_blank">
                            <img src="/storage/{{ $link->image }}">
                            <div class="lk-revelation__title">
                                {{ $link->title }}
                            </div>
                            <a class="btn " href="{{ $link['link'] }}" role="button" target="_blank">Подробнее</a>
                        </a>
                    </div>
                    @endforeach
                </div>
                @endif
            </div>
        </div>

    </div>
    <div class="new-srow ">
123123213
        @if (count($area6) > 4)
        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-5">
                <div class="row newsupx">
                    @foreach($area6->slice(0, 2) as $link)
                    <div class="col-sm-12 col-md-12 col-lg-6">
                        <a href="{{ $link['link'] }}" target="_blank" target="_blank">
                            <div class="lefar-card {{ $link->color }}">
                                <img src="/storage/{{ $link->image }}">

                                <p>
                                    {{ $link->title }}
                                </p>

                                <a href="{{ $link['link'] }}" role="button" class="btn" target="_blank">Подробнее</a>
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
                        <a href="{{ $link['link'] }}" target="_blank">
                            <div class="lefar-card {{ $link->color }}">
                                <img src="/storage/{{ $link->image }}">

                                <p class="prod-element">
                                    {{ $link->title }}
                                </p>

                                <a href="{{ $link['link'] }}" role="button" class="btn" target="_blank">Подробнее</a>
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
                            <a href="{{ $link['link'] }}" target="_blank">
                                <img src="/storage/{{ $link->image }}">
                            </a>
                            <a href="{{ $link['link'] }}" target="_blank">
                                {{ $link->title }}
                            </a>
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
                                <a href="{{ $link['link'] }}" target="_blank">
                                    <img src="/storage/{{ $link->image }}">
                                </a>
                                <p>
                                    {{ $link->title }}
                                </p>

                                <a href="{{ $link['link'] }}" role="button" class="btn" target="_blank">Подробнее</a>
                            </div>
                        </a>
                    </div>
                    @endforeach
                    @endif
                </div>
            </div>
        </div>
    <overload :ops="{{ $ops }}" :postid="{{ $solo->id }}"></overload>

    </div>

</div>

@endsection
