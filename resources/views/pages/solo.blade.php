@extends('pages.master')

@section('content')

<div class="container solo-page">

    <div class="row padder-main-row">

        <div class="col-sm-12 col-md-6 col-lg-5 contnet">
            <div class="news-solo target">
                <img src="{{ $solo['image'] }} ">
                <div class="news-solo__teaser">
                    <h3>
                        {{ $solo->title }}
                    </h3>
                </div>
                <div class="teasers">
                    <div class="teaser">
                        @isset($teaser1)
                        <div class="teaser-title">
                            <div class="container title-area">
                                <img src="{{ $teaser1['image'] }}">
                                <div>
                                    {{ $teaser1['title'] }}
                                </div>
                            </div>
                        </div>
                        @endisset
                        <div class="container">
                            <p>
                                {!! $solo->body1 !!}
                            </p>
                        </div>
                    </div>
                    <div class="teaser">
                        @isset($teaser1)
                        <div class="teaser-title">
                            <div class="container title-area">
                                <img src="{{ $teaser1['image'] }}">
                                <div>
                                    {{ $teaser1['title'] }}
                                </div>
                            </div>
                        </div>
                        @endisset
                        <div class="container">
                            <p>
                                {!! $solo->body2 !!}
                            </p>
                        </div>
                    </div>
                    <div class="teaser">
                        <div class="teaser-title">
                            <div class="container title-area">
                                <img src="{{ $teaser1['image'] }}" alt="image">
                                <div>
                                    {{ $teaser1['title'] }}
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <p>
                                {!! $solo->body3 !!}
                            </p>
                        </div>
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
                                <img src="{{ $link->image }}">
                                <div class="more-read__solo-area">
                                    <a href="/post/{{ $link->id }}">{{ $link->title }}</a>
                                    <a class="btn btn-primary" href="/post/{{ $link->id }}" role="button">Подробнее</a>
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
                @foreach($area3 as $link)
                <div class="col-sm-6 col-md-6 col-lg-4">
                    <a href="/post/{{ $link->id }}">
                        <div class="lefar-card">
                            <img src="{{ $link->image }}" style="min-height: 155px;">

                            <p>
                                {{ $link->title }}
                            </p>

                            <a href="/post/{{ $link->id }}" role="button" class="btn btn-primary">Подробнее</a>
                        </div>
                    </a>
                </div>
                @endforeach
                @endif
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-8">
                    @if (count($area4) > 0)
                    @foreach($area4 as $link)
                    <div class="width-card">
                        <img src="{{ $link->image }}">
                        <div class=wc-content>
                            <a href="/post/{{ $link->id }}">
                                {{ $link->title }}
                            </a>
                            <a class="btn btn-primary" href="/post/{{ $link->id }}" role="button">Подробнее</a>
                        </div>
                    </div>
                    @endforeach
                    @endif


                </div>

                @if (count($area5) > 0)
                <div class="col-sm-12 col-md-12 col-lg-4">
                    @foreach($area5 as $link)
                    <div class="lk-revelation">
                        <a href="/post/{{ $link->id }}">
                            <img src="{{ $link->image }}">
                            <div class="lk-revelation__title">
                                {{ $link->title }}
                            </div>
                            <a class="btn btn-primary" href="/post/{{ $link->id }}" role="button">Подробнее</a>
                        </a>
                    </div>
                    @endforeach
                </div>
                @endif
            </div>
        </div>

    </div>
    <div class="new-srow ">

        @if (count($area6) > 4)
        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-5">
                <div class="row newsupx">
                    @foreach($area6->slice(0, 2) as $link)
                    <div class="col-sm-12 col-md-12 col-lg-6">
                        <a href="/post/{{ $link->id }}">
                            <div class="lefar-card">
                                <img src="{{ $link->image }}">

                                <p>
                                    {{ $link->title }}
                                </p>

                                <a href="/post/{{ $link->id }}" role="button" class="btn btn-primary">Подробнее</a>
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
                        <a href="/post/{{ $link->id }}">
                            <div class="lefar-card">
                                <img src="{{ $link->image }}">

                                <p>
                                    {{ $link->title }}
                                </p>

                                <a href="/post/{{ $link->id }}" role="button" class="btn btn-primary">Подробнее</a>
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
                                <a href="/post/{{ $link->id }}">
                                    <img src="{{ $link->image }}">
                                </a>
                                <a href="/">
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
                                <a href="/post/{{ $link->id }}">
                                    <div class="lefar-card">
                                        <img src="{{ $link->image }}">

                                        <p>
                                            {{ $link->title }}
                                        </p>

                                        <a href="/post/{{ $link->id }}" role="button" class="btn btn-primary">Подробнее</a>
                                    </div>
                                </a>
                            </div>
                        @endforeach
                    @endif
                </div>
            </div>
        </div>
        <overload></overload>

    </div>

</div>

@endsection
