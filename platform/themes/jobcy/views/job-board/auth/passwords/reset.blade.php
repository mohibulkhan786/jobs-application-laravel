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
                                {!! Form::open(['url' => route('public.account.password.reset.update'), 'class' => 'auth-form text-white w-100']) !!}
                                    <input type="hidden" name="token" value="{{ $token }}">
                                    <div class="mb-3">
                                        <label class="form-label" for="email">{{ __('Email') }}</label>
                                        <input class="form-control @if ($errors->has('email')) is-invalid @endif" type="text" required="" placeholder="{{ __('Email address') }}"
                                            name="email" autocomplete="email" value="{{ old('email') }}">
                                        @if ($errors->has('email'))
                                            <span class="invalid-feedback">{{ $errors->first('email') }}</span>
                                        @endif
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="password">{{ __('Password') }}</label>
                                        <input class="form-control @if ($errors->has('password')) is-invalid @endif" type="password" required="" placeholder="{{ __('Password') }}"
                                            name="password" value="">
                                        @if ($errors->has('password'))
                                            <span class="invalid-feedback">{{ $errors->first('password') }}</span>
                                        @endif
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="password_confirmation">{{ __('Password confirmation') }}</label>
                                        <input class="form-control @if ($errors->has('password_confirmation')) is-invalid @endif" type="password" required placeholder="{{ __('Password confirmation') }}"
                                            name="password_confirmation" value="">
                                        @if ($errors->has('password_confirmation'))
                                            <span class="invalid-feedback">{{ $errors->first('password_confirmation') }}</span>
                                        @endif
                                    </div>
                                    <div class="mt-3">
                                        <button type="submit" class="btn btn-white w-100">{{ __('Submit') }}</button>
                                    </div>
                                {!! Form::close() !!}
                                <!-- end form -->

                                @if (session('status'))
                                    <div class="text-success">
                                        {{ session('status') }}
                                    </div>
                                @endif

                                @if (session('success_msg'))
                                    <div class="text-success">
                                        {{ session('success_msg') }}
                                    </div>
                                @endif

                                @if (session('error_msg'))
                                    <div class="text-danger">
                                        {{ session('error_msg') }}
                                    </div>
                                @endif

                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end auth-box-->
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section>
<!-- END RESET-PASSWORD -->
