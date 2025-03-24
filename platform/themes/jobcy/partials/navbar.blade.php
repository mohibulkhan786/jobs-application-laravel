<!-- Begin page -->
<div>
    <!-- START TOP-BAR -->
    <div class="top-bar">
        <div class="container-fluid custom-container">
            <div class="row g-0 align-items-center">
                <div class="col-md-7">
                    <ul class="list-inline mb-0 text-center text-md-start">
                        @if (theme_option('hotline'))
                            <li class="list-inline-item">
                                <p class="fs-13 mb-0">
                                    <i class="mdi mdi-map-marker"></i>
                                    {{ __('Hotline') }}: <a href="tel:{{ theme_option('hotline') }}" class="text-dark">
                                        {{ theme_option('hotline') }}
                                    </a>
                                </p>
                            </li>
                        @endif
                        @if ($socialLinks = json_decode(theme_option('social_links'), true))
                            <li class="list-inline-item">
                                <ul class="topbar-social-menu list-inline mb-0">
                                    @foreach ($socialLinks as $socialLink)
                                        @if (count($socialLink) == 3)
                                            <li class="list-inline-item">
                                                <a title="{{ Arr::get($socialLink, '0.value') }}" href="{{ Arr::get($socialLink, '2.value') }}" target="_blank" class="social-link">
                                                    <i class="{{ Arr::get($socialLink, '1.value') }}"></i>
                                                </a>
                                            </li>
                                        @endif
                                    @endforeach
                                </ul>
                            </li>
                        @endif
                    </ul>
                </div>
                <!--end col-->
                <div class="col-md-5">
                    <ul class="list-inline mb-0 text-center text-md-end">
                        @if (is_plugin_active('job-board'))
                            @if (!auth('account')->check())
                                <li class="list-inline-item py-2 me-3 align-middle">
                                    <a href="{{ route('public.account.login') }}" class="text-dark fw-medium fs-13">
                                        <i class="uil uil-user"></i> {{ __('Sign In') }}
                                    </a>
                                </li>

                                <li class="list-inline-item py-2 me-3 align-middle">
                                    <a href="#signupModal" class="text-dark fw-medium fs-13" data-bs-toggle="modal">
                                        <i class="uil uil-lock"></i> {{ __('Sign Up') }}
                                    </a>
                                </li>
                            @elseif ($account = auth('account')->user())
                                <li class="list-inline-item py-2 align-middle me-3 dropdown">
                                    <a href="javascript:void(0)" data-bs-toggle="dropdown"
                                       aria-expanded="false" style="color: #314047;">
                                        <img src="{{ $account->avatar_url }}" alt="{{ $account->name }}" width="30" height="30" class="rounded-circle me-1">
                                        <span class="d-none d-md-inline-block fw-medium">{{ __('Hi, :name', ['name' => Str::limit($account->name, 15)]) }}</span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        @if ($account->isEmployer())
                                            <li><a class="dropdown-item" href="{{ route('public.account.dashboard') }}">{{ __('Employer Dashboard') }}</a></li>
                                        @else
                                            <li><a class="dropdown-item" href="{{ route('public.account.jobs.saved') }}">{{ __('Saved Jobs') }}</a></li>
                                            <li><a class="dropdown-item" href="{{ route('public.account.jobs.applied-jobs') }}">{{ __('Applied Jobs') }}</a></li>
                                        @endif
                                        <li><a class="dropdown-item" href="{{ route('public.account.settings') }}">{{ __('Account Settings') }}</a></li>
                                        <li>
                                            <a class="dropdown-item" onclick="event.preventDefault(); document.getElementById('logout-form').submit();" href="#">{{ __('Logout') }}</a>
                                            <form id="logout-form" action="{{ route('public.account.logout') }}" method="POST" style="display: none;">
                                                @csrf
                                            </form>
                                        </li>
                                    </ul>
                                </li>
                            @endif

                            @php $currencies = get_all_currencies(); @endphp

                            @if (count($currencies) > 1)
                                <li class="list-inline-item py-2 align-middle me-3">
                                    <div class="dropdown d-inline-block language-switch">
                                        <button type="button" class="btn" data-bs-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">
                                            {{ get_application_currency()->title }}
                                            <i class="mdi mdi-chevron-down"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-end">
                                            @foreach ($currencies as $currency)
                                                <a href="{{ route('public.change-currency', $currency->title) }}" class="dropdown-item notify-item language"><span>{{ $currency->title }}</span></a>
                                            @endforeach
                                        </div>
                                    </div>
                                </li>
                            @endif
                        @endif
                        @if (is_plugin_active('language'))
                            {!! Theme::partial('language-switcher') !!}
                        @endif
                    </ul>
                </div>
                <!--end col-->
            </div>
            <!--end row-->
        </div>
        <!--end container-->
    </div>
    <!-- END TOP-BAR -->

    <!--Navbar Start-->
    <nav class="navbar navbar-expand-lg fixed-top sticky" id="navbar">
        <div class="container-fluid custom-container">
            @if (theme_option('logo'))
                <a class="navbar-brand text-dark fw-bold me-auto" href="{{ route('public.index') }}">
                    <img src="{{ RvMedia::getImageUrl(theme_option('logo')) }}"
                        alt="{{ theme_option('site_title') }}" class="logo-dark" />
                </a>
            @endif
            <div class="collapse navbar-collapse" id="navbarCollapse">
                {!!
                    Menu::renderMenuLocation('main-menu', [
                        'options' => ['class' => 'navbar-nav mx-auto navbar-center'],
                        'view'    => 'main-menu',
                    ])
                !!}
                <ul class="navbar-nav mx-auto navbar-center extra-menu-items">
                    @if (is_plugin_active('job-board'))
                        @if (!auth('account')->check())
                            <li class="nav-item dropdown dropdown-hover">
                                <a href="{{ route('public.account.login') }}" class="text-dark fw-medium fs-13">
                                    <i class="uil uil-user"></i> {{ __('Sign In') }}
                                </a>
                            </li>

                            <li class="nav-item dropdown dropdown-hover">
                                <a href="#signupModal" class="text-dark fw-medium fs-13" data-bs-toggle="modal">
                                    <i class="uil uil-lock"></i> {{ __('Sign Up') }}
                                </a>
                            </li>
                        @endif

                        @if (count($currencies) > 1)
                            <li class="list-inline-item py-2 align-middle">
                                <div class="dropdown d-inline-block language-switch">
                                    <button type="button" class="btn" data-bs-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                        {{ get_application_currency()->title }}
                                        <i class="mdi mdi-chevron-down"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-end">
                                        @foreach ($currencies as $currency)
                                            <a href="{{ route('public.change-currency', $currency->title) }}" class="dropdown-item notify-item language"><span>{{ $currency->title }}</span></a>
                                        @endforeach
                                    </div>
                                </div>
                            </li>
                        @endif
                    @endif
                    @if (is_plugin_active('language'))
                        {!! Theme::partial('language-switcher') !!}
                    @endif
                </ul>
            </div>
            @if (is_plugin_active('job-board'))
                <ul class="header-menu list-inline d-flex align-items-center mb-0">
                    {!! apply_filters('theme-header-right-nav', null) !!}
                    <a href="{{ route('public.account.jobs.create') }}" class="btn btn-primary me-2 d-none d-md-block"><i class="mdi mdi-plus"></i> {{ __('Post a job') }}</a>
                    @if (auth('account')->check() && $account = auth('account')->user())
                        <li class="list-inline-item dropdown d-block d-md-none">
                            <a href="javascript:void(0)" class="header-item" id="userdropdown" data-bs-toggle="dropdown"
                               aria-expanded="false">
                                <img src="{{ $account->avatar_url }}" alt="{{ $account->name }}" width="35" height="35" class="rounded-circle me-1">
                                <span class="d-none d-md-inline-block fw-medium">{{ __('Hi, :name', ['name' => Str::limit($account->name, 15)]) }}</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userdropdown">
                                @if ($account->isEmployer())
                                    <li><a class="dropdown-item" href="{{ route('public.account.dashboard') }}">{{ __('Employer Dashboard') }}</a></li>
                                @else
                                    <li><a class="dropdown-item" href="{{ route('public.account.jobs.saved') }}">{{ __('Saved Jobs') }}</a></li>
                                    <li><a class="dropdown-item" href="{{ route('public.account.jobs.applied-jobs') }}">{{ __('Applied Jobs') }}</a></li>
                                @endif
                                <li><a class="dropdown-item" href="{{ route('public.account.settings') }}">{{ __('Account Settings') }}</a></li>
                                <li>
                                    <a class="dropdown-item" onclick="event.preventDefault(); document.getElementById('logout-form').submit();" href="#">{{ __('Logout') }}</a>
                                </li>
                            </ul>
                        </li>
                    @endif
                </ul><!--end header-menu-->
            @endif
            <div>
                <button class="navbar-toggler me-3 align-bottom" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-label="Toggle navigation">
                    <i class="mdi mdi-menu"></i>
                </button>
            </div>
        </div>
        <!--end container-->
    </nav>
    <!-- Navbar End -->

    @if (is_plugin_active('job-board') && !auth('account')->check())
        <div class="modal fade" id="signupModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body p-5">
                        <div class="position-absolute end-0 top-0 p-3">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="auth-content">
                            <div class="w-100">
                                <div class="text-center mb-4">
                                    <h5>{{ __('Sign Up') }}</h5>
                                    <p class="text-muted">{{ __('Sign Up and get access to all the features.') }}</p>
                                </div>
                                @include(Theme::getThemeNamespace('views.job-board.auth.register-form'))
                            </div>
                        </div>
                    </div><!--end modal-body-->
                </div><!--end modal-content-->
            </div><!--end modal-dialog-->
        </div>
    @endif
