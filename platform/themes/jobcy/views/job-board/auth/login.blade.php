@php
    Theme::layout('without-navbar');
@endphp

<!-- START SIGN-IN -->
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
                                    @if (theme_option('sign_in_page_image'))
                                        <img src="{{ RvMedia::getImageUrl(theme_option('sign_in_page_image')) }}" alt="background" class="img-fluid">
                                    @else
                                        <img src="{{ Theme::asset()->url('images/auth/sign-in.png') }}" alt="background" class="img-fluid">
                                    @endif
                                </div>
                            </div>
                        </div><!--end col-->
                        <div class="col-lg-6">
                            <div class="auth-content card-body p-5 h-100 text-white">
                                <div class="w-100">
                                    <div class="text-center mb-4">
                                        <h5>{{ __('Welcome Back !') }}</h5>
                                        <p class="text-white-70">{{ __('Sign in to continue.') }}</p>
                                    </div>
                                    {!! Form::open(['route' => 'public.account.login', 'class' => 'auth-form']) !!}
                                        <div class="mb-3">
                                            <label for="email" class="form-label">{{ __('Email') }}</label>
                                            <input type="email" name="email" class="form-control @if($errors->has('email'))  is-invalid @endif"
                                                id="email" placeholder="{{ __('Email') }}" autocomplete="email" value="{{ old('email') }}">
                                            @if ($errors->has('email'))
                                                <span class="invalid-feedback">
                                                    <strong>{{ $errors->first('email') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                        <div class="mb-3">
                                            <label for="password" class="form-label">{{ __('Password') }}</label>
                                            <input type="password" name="password" class="form-control @if($errors->has('password')) is-invalid @endif"
                                                id="password" placeholder="{{ __('Password') }}" autocomplete="password">
                                            @if ($errors->has('password'))
                                                <span class="invalid-feedback">
                                                    <strong>{{ $errors->first('password') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                        <div class="mb-4">
                                            <div class="form-check">
                                                <input name="remember" class="form-check-input" type="checkbox" id="remember-me" @if (old('remember') == 1) checked="checked" @endif>
                                                <a href="{{ route('public.account.password.request') }}" class="float-end text-white">{{ __('Forgot Password?') }}</a>
                                                <label class="form-check-label" for="remember-me">{{ __('Remember me?') }}</label>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <button type="submit" class="btn btn-white btn-hover w-100">{{ __('Sign In') }}</button>
                                        </div>
                                    {!! Form::close() !!}
                                    <div class="mt-4 text-center">
                                        <p class="mb-0">
                                            <span>{{ __("Don't have an account?") }}</span>
                                            <a href="{{ route('public.account.register') }}" class="fw-medium text-white text-decoration-underline">{{ __('Sign Up') }}</a>
                                        </p>
                                    </div>

                                    <div class="mt-3">
                                        {!! apply_filters(BASE_FILTER_AFTER_LOGIN_OR_REGISTER_FORM, null, \Botble\JobBoard\Models\Account::class) !!}
                                    </div>
                                </div>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end auth-box-->
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section>
<!-- END SIGN-IN -->
