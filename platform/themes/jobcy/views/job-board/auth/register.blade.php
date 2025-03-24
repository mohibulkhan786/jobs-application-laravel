@php
    Theme::layout('without-navbar');
@endphp

<!-- START SIGN-UP -->
<section class="bg-auth">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12">
                <div class="card auth-box">
                    <div class="row align-items-center">
                        <div class="col-lg-6 text-center">
                            <div class="card-body p-4">
                                @if (theme_option('logo'))
                                    <a href="{{ route('public.index') }}">
                                        <img src="{{ RvMedia::getImageUrl(theme_option('logo')) }}"
                                            alt="{{ theme_option('site_title') }}" class="logo-dark" />
                                    </a>
                                @endif
                                <div class="mt-5">
                                    @if (theme_option('sign_up_page_image'))
                                        <img src="{{ RvMedia::getImageUrl(theme_option('sign_up_page_image')) }}" alt="background" class="img-fluid">
                                    @else
                                        <img src="{{ Theme::asset()->url('images/auth/sign-up.png') }}" alt="background" class="img-fluid">
                                    @endif
                                </div>
                            </div>
                        </div><!--end col-->
                        <div class="col-lg-6">
                            <div class="auth-content card-body p-5 text-white">
                                <div class="w-100">
                                    <div class="text-center">
                                        <h5>{{ __("Let's Get Started") }}</h5>
                                        <p class="text-white-70">{{ __('Sign Up to get access to all our features') }}</p>
                                    </div>
                                    @include(Theme::getThemeNamespace('views.job-board.auth.register-form'))
                                </div>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end auth-box-->
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section>
<!-- END SIGN-UP -->
