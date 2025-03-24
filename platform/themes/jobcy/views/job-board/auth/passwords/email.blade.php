@php
    Theme::layout('without-navbar');
@endphp

<!-- START RESET-PASSWORD -->
<section class="bg-auth">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12">
                <div class="card auth-box">
                    <div class="row g-0">
                        <div class="col-lg-6 text-center">
                            <div class="card-body p-4">
                                @if (theme_option('logo'))
                                    <a href="{{ route('public.index') }}">
                                        <img src="{{ RvMedia::getImageUrl(theme_option('logo')) }}"
                                            alt="{{ theme_option('site_title') }}" class="logo-dark" />
                                    </a>
                                @endif
                                <div class="mt-5">
                                    <img src="{{ Theme::asset()->url('images/auth/reset-password.png') }}" alt="background" class="img-fluid">
                                </div>
                            </div>
                        </div><!--end col-->
                        <div class="col-lg-6">
                            <div class="auth-content card-body p-5 h-100 text-white">
                                <div class="text-center mb-4">
                                    <h5>{{ SeoHelper::getTitle() }}</h5>
                                    <p class="text-white-50">{{ __('Reset your password.') }}</p>
                                </div>
                                {!! Form::open(['url' => route('public.account.password.email'), 'class' => 'auth-form text-white']) !!}
                                    <div class="alert alert-warning text-center mb-4" role="alert">{{ __('Enter your email and instructions will be sent to you!') }}</div>
                                    <div class="mb-4">
                                        <label class="form-label" for="email">{{ __('Email') }}</label>
                                        <input type="email" name="email" class="form-control" id="email" placeholder="{{ __('Enter username or email') }}">
                                    </div>
                                    <div class="mt-3">
                                        <button type="submit" class="btn btn-white w-100">{{ __('Send Request') }}</button>
                                    </div>
                                {!! Form::close() !!}<!-- end form -->

                                <div class="mt-5 text-center text-white-50">
                                    <p>
                                        <span>{{ __('Remembered It?') }}</span>
                                        <a href="{{ route('public.account.login') }}" class="fw-medium text-white text-decoration-underline"> {{ __('Go to login') }} </a>
                                    </p>
                                </div>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end auth-box-->
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section>
<!-- END RESET-PASSWORD -->
