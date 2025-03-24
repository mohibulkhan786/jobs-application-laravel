@if (is_plugin_active('newsletter'))
    <section class="bg-subscribe">
        <div class="container">
            <div class="row justify-content-between align-items-center">
                <div class="col-lg-6">
                    <div class="text-center text-lg-start">
                        <h2 class="text-white h4">{{ $config['title'] }}</h2>
                        <p class="text-white-50 mb-0">{{ $config['subtitle'] }}</p>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="mt-4 mt-lg-0">
                        <form class="subscribe-form newsletter-form" method="post" action="{{ route('public.newsletter.subscribe') }}">
                            @csrf
                            <div class="input-group justify-content-center justify-content-lg-end">
                                <input type="email" name="email" class="form-control" placeholder="{{ __('Enter your email') }}">
                                <button class="btn btn-primary" type="submit">{{ __('Subscribe') }}</button>
                            </div>
                            @if (setting('enable_captcha') && is_plugin_active('captcha'))
                                <div class="input-group justify-content-center justify-content-lg-end mt-3">
                                    {!! Captcha::display() !!}
                                </div>
                            @endif
                        </form>
                    </div>
                </div>
                <!--end col-->
            </div>
            <!--end row-->
        </div>
        <!--end container-->
        @if ($config['image'])
            <div class="email-img d-none d-lg-block text-end" style="max-width: 30%">
                <img src="{{ RvMedia::getImageUrl($config['image']) }}" alt="image" class="img-fluid">
            </div>
        @endif
    </section>
@endif

