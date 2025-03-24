@php
    SeoHelper::setTitle(__('404 - Not found'));
    Theme::fireEventGlobalAssets();
    AdminBar::setIsDisplay(false);
@endphp

{!! Theme::partial('header', ['withoutNavbar' => true]) !!}

<!-- START ERROR -->
<section class="bg-error bg-auth text-dark">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="text-center">
                    @if (theme_option('404_page_image'))
                        <img src="{{ RvMedia::getImageUrl(theme_option('404_page_image')) }}" alt="404" class="img-fluid">
                    @else
                        <img src="{{ Theme::asset()->url('images/404.png') }}" alt="404" class="img-fluid">
                    @endif
                    <div class="mt-5">
                        <h4 class="text-uppercase mt-3">{{ __('Sorry, page not found') }}</h4>
                        <p class="text-muted">{{ __('It will be as simple as Occidental in fact, it will be Occidental') }}</p>
                        <div class="mt-4">
                            <a class="btn btn-primary waves-effect waves-light" href="{{ route('public.index') }}">
                                <i class="mdi mdi-home"></i>
                                <span>{{ __('Back to Home') }}</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section>
<!-- END ERROR -->
{!! Theme::partial('footer', ['withoutNavbar' => true]) !!}
