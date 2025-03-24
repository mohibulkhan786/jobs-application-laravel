@php AdminBar::setIsDisplay(false); @endphp
<!-- START COMING-SOON -->
<section class="bg-coming-soon bg-auth">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="text-center">
                    @if ($shortcode->image)
                        <div class="mb-4 pb-3">
                            <img src="{{ RvMedia::getImageUrl($shortcode->image) }}" alt="image" height="150" class="mg-fluid">
                        </div>
                    @endif
                    <h1>{!! BaseHelper::clean($shortcode->title) !!}</h1>
                    <p class="text-muted mb-4 pb-3">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                    @if ($shortcode->date && $shortcode->time)
                        @php
                            $date = $shortcode->date . ' ' . (Str::length($shortcode->time) == 5 ? $shortcode->time . ':00' : $shortcode->time);
                            $date = Carbon\Carbon::createFromFormat(config('core.base.general.date_format.date_time'), $date);
                        @endphp
                        @if ($date)
                            <div id="countdown" class="d-flex" data-datetime="{{ $date->format('Y-m-d H:i:s') }}"></div>
                        @endif
                    @endif
                    @if (is_plugin_active('newsletter') && $shortcode->show_newsletter != 'no')
                        <form class="coming-soon-subscribe mt-4 newsletter-form" method="post" action="{{ route('public.newsletter.subscribe') }}">
                            @csrf
                            <div class="input-group mb-3">
                                <input type="email" name="email" class="form-control text-dark" placeholder="{{ __('Enter your email') }}">
                                <button class="btn btn-primary" type="submit">{{ __('Subscribe') }}</button>
                            </div>
                            @if (setting('enable_captcha') && is_plugin_active('captcha'))
                                <div class="input-group mb-3 mt-3">
                                    {!! Captcha::display() !!}
                                </div>
                            @endif
                        </form>
                    @endif
                </div>
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section>
<!-- END COMING-SOON -->

