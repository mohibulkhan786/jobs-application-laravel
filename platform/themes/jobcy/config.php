<?php

use Botble\Base\Facades\BaseHelper;
use Botble\JobBoard\Models\Account;
use Botble\Shortcode\View\View;
use Botble\Theme\Theme;

return [

    /*
    |--------------------------------------------------------------------------
    | Inherit from another theme
    |--------------------------------------------------------------------------
    |
    | Set up inherit from another if the file is not exists,
    | this is work with "layouts", "partials" and "views"
    |
    | [Notice] assets cannot inherit.
    |
    */

    'inherit' => null, //default

    /*
    |--------------------------------------------------------------------------
    | Listener from events
    |--------------------------------------------------------------------------
    |
    | You can hook a theme when event fired on activities
    | this is cool feature to set up a title, meta, default styles and scripts.
    |
    | [Notice] these events can be overridden by package config.
    |
    */

    'events' => [

        // Before event inherit from package config and the theme that call before,
        // you can use this event to set meta, breadcrumb template or anything
        // you want inheriting.
        'before' => function ($theme) {
            // You can remove this line anytime.
        },

        // Listen on event before render a theme,
        // this event should call to assign some assets,
        // breadcrumb template.
        'beforeRenderTheme' => function (Theme $theme) {
            // Partial composer.
            $account = null;

            if (is_plugin_active('job-board')) {
                $account = auth('account')->check() ? auth('account')->user() : new Account();
            }

            $theme->partialComposer('footer', function ($view) use ($account) {
                $view->with('account', $account);
            });

            $version = get_cms_version();

            // You may use this event to set up your assets.
            $theme->asset()->usePath()->add('choices-css', 'libs/choices.js/choices.min.css');
            $theme->asset()->usePath()->add('swiper-css', 'libs/swiper/swiper-bundle.min.css');
            if (BaseHelper::siteLanguageDirection() == 'rtl') {
                $theme->asset()->usePath()->add('app-css', 'css/app-rtl.css', [], [], $version);
            } else {
                $theme->asset()->usePath()->add('app-css', 'css/app.css', [], [], $version);
            }

            $theme->asset()->container('footer')->usePath()->add('jquery', 'libs/jquery.min.js');
            $theme->asset()->container('footer')->usePath()->add('bootstrap-js', 'libs/bootstrap/js/bootstrap.bundle.min.js');
            $theme->asset()->container('footer')->usePath()->add('monochrome', 'libs/monochrome.js');
            $theme->asset()->container('footer')->usePath()->add('choices-js', 'libs/choices.js/choices.min.js');
            $theme->asset()->container('footer')->usePath()->add('swiper-js', 'libs/swiper/swiper-bundle.min.js');
            $theme->asset()->container('footer')->usePath()->add('scripts-js', 'js/scripts.js', [], [], $version);
            $theme->asset()->container('footer')->usePath()->add('backend-js', 'js/backend.js', [], [], $version);

            if (is_plugin_active('social-login')) {
                $theme->asset()
                    ->usePath(false)
                    ->add(
                        'social-login-css',
                        asset('vendor/core/plugins/social-login/css/social-login.css'),
                        [],
                        [],
                        '1.1.0'
                    );
            }

            if (function_exists('shortcode')) {
                $theme->composer(['page', 'post', 'job-board.*'], function (View $view) {
                    $view->withShortcodes();
                });
            }
        },

        // Listen on event before render a layout,
        // this should call to assign style, script for a layout.
        'beforeRenderLayout' => [

            'default' => function ($theme) {
                // $theme->asset()->usePath()->add('ipad', 'css/layouts/ipad.css');
            },
        ],
    ],
];
