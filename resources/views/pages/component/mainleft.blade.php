<div class="right-area">


    @foreach($pos as $key => $card)

    @if(count($card) > 0)

    <div class="ra__title">
        <a href="/">
            @if($key === 0) 
            <h3>Финансы</h3>
            @endif
            @if($key === 1) 
            <h3>Политика</h3>
            @endif
            @if($key === 2) 
            <h3>Шоу бизнес</h3>
            @endif
            @if($key === 3) 
            <h3>Здоровье</h3>
            @endif
            @if($key === 4) 
            <h3>Астрология</h3>
            @endif
        </a>
    </div>
    <div class="ra__body">
    @foreach($card as $pos)
        <div class="ra__card">
            <a href="{{ $pos['link'] }}" target="_blank">
                <div class="img-wrap">
                    <img src="/storage/{{ $pos->image }}" width="100px">
                </div>
                <div class="ra_cardtext">{{ $pos->title }}</div>
            </a>
        </div>
        @endforeach
    </div>
    @endif

    @endforeach


</div>
