<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
    <head>
        {!! Theme::partial('theme-meta') !!}

        {!! Theme::header() !!}
    </head>

    <body @if (BaseHelper::siteLanguageDirection() == 'rtl') dir="rtl" @endif>
        <div id="alert-container"></div>

        @if (theme_option('preloader_enabled', 'yes') == 'yes')
            {!! Theme::partial('preloader') !!}
        @endif
        <!-- Begin page -->
        <div>
            <div class="main-content">
                <div class="page-content">
                    {!! Theme::content() !!}
                </div>
                <!-- End Page-content -->
            </div>
            <!-- end main content-->
        </div>
        <!-- END layout-wrapper -->
        {!! Theme::footer() !!}

        <script>
            'use strict';
            window.siteConfig = {
                countdown: {
                    days   : "{{ __('Days') }}",
                    hours  : "{{ __('Hours') }}",
                    minutes: "{{ __('Minutes') }}",
                    seconds: "{{ __('Seconds') }}",
                    ended  : "{{ __('The countdown has ended!') }}"
                }
            };
        </script>

        <script src="{{ Theme::asset()->url('js/coming-soon.js') }}"></script>
    </body>
</html>
