<div class="right-area">

    @if(count($pos0) > 0)

    <div class="ra__title">
        <a href="/">
            <h3>Шоу-бизнес</h3>
        </a>
    </div>
    <div class="ra__body">

        @foreach($pos0 as $pos)
        <div class="ra__card">
            <a href="/post{{ $pos->id }}" target="_blank">
                <div class="img-wrap">
                    <img src="/storage/{{ $pos->image }}" width="100px">
                </div>
                <div class="ra_cardtext">{{ $pos->title }}</div>
            </a>
        </div>
        @endforeach
    </div>
    @endif

    @if(count($pos1) > 0)
        <div class="ra__title">
            <a href="/">
                <h3>Политика</h3>
            </a>
        </div>
        <div class="ra__body">
            @foreach($pos1 as $pos)
            <div class="ra__card">
                <a href="/post{{ $pos->id }}" target="_blank">
                    <div class="img-wrap">
                        <img src="/storage/{{ $pos->image }}" width="100px">
                    </div>
                    <div class="ra_cardtext">{{ $pos->title }}</div>
                </a>
            </div>
            @endforeach
        </div>
    @endif

    @if(count($pos2) > 0)
    <div class="ra__title">
        <a href="/">
            <h3>Новости</h3>
        </a>
    </div>
    <div class="ra__body">
        @foreach($pos2 as $pos)
        <div class="ra__card">
            <a href="/post{{ $pos->id }}" target="_blank">
                <div class="img-wrap">
                    <img src="/storage/{{ $pos->image }}" width="100px">
                </div>
                <div class="ra_cardtext">{{ $pos->title }}</div>
            </a>
        </div>
        @endforeach
    </div>
    @endif

    @if(count($pos3) > 0)
    <div class="ra__title">
        <a href="/">
            <h3>Оборона</h3>
        </a>
    </div>
    <div class="ra__body">
        @foreach($pos3 as $pos)
        <div class="ra__card">
            <a href="/post{{ $pos->id }}" target="_blank">
                <div class="img-wrap">
                    <img src="/storage/{{ $pos->image }}" width="100px">
                </div>
                <div class="ra_cardtext">{{ $pos->title }}</div>
            </a>
        </div>
        @endforeach
    </div>
    @endif

    @if(count($pos4) > 0)
    <div class="ra__title">
        <a href="/">
            <h3>Здоровье</h3>
        </a>
    </div>
    <div class="ra__body">
        @foreach($pos4 as $pos)
        <div class="ra__card">
            <a href="/post{{ $pos->id }}" target="_blank">
                <div class="img-wrap">
                    <img src="/storage/{{ $pos->image }}" width="100px">
                </div>
                <div class="ra_cardtext">{{ $pos->title }}</div>
            </a>
        </div>
        @endforeach
    </div>
    @endif
    @if(count($pos5) > 0)
    <div class="ra__title">
        <a href="/">
            <h3>Кухня</h3>
        </a>
    </div>
    <div class="ra__body">
            @foreach($pos5 as $pos)
            <div class="ra__card">
                <a href="/post{{ $pos->id }}" target="_blank">
                    <div class="img-wrap">
                        <img src="/storage/{{ $pos->image }}" width="100px">
                    </div>
                    <div class="ra_cardtext">{{ $pos->title }}</div>
                </a>
            </div>
            @endforeach
    </div>
    @endif
</div>
