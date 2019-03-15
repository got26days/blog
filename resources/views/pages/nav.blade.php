<nav class="navbar navbar-expand-lg navbar-dark navbar__bluecolor">
  <div class="container">
        <div class="logo-area">
          <div class="logo-area__first">
              {{-- <img src="/images/logo.png" alt="logo"> --}}
              <a href="{{ route('manepage') }}">
                <span>НОВОСТИ</span> <span class="logotime">24</span>
              </a>
              
          </div>
          {{-- <div class="logo-area__second">
              МОСКВА<br />
              <span>
                  07.03.2019, 08:13
              </span>
          </div> --}}
        </div>


        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
          
        </button>
      
        <div class="collapse navbar-collapse new-flex-m" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto new-flex-m">
            <li class="nav-item active">
              <a class="nav-link" href="{{ route('manepage') }}">Финансы <span class="sr-only">(current)</span></a>
            </li>
            <li class="delim"> | </li>
            <li class="nav-item">
              <a class="nav-link" href="{{ route('politika') }}">Политика</a>
            </li>
            <li class="delim"> | </li>
            <li class="nav-item">
              <a class="nav-link" href="{{ route('shou-biznes') }}">Шоу бизнес</a>
            </li>
            <li class="delim"> | </li>
            <li class="nav-item">
              <a class="nav-link" href="{{ route('zdorove') }}">Здоровье</a>
            </li>
            <li class="delim"> | </li>
            <li class="nav-item">
              <a class="nav-link" href="{{ route('astrologiya') }}">Астрология</a>
            </li>
          </ul>

        </div>
  </div>
</nav>
