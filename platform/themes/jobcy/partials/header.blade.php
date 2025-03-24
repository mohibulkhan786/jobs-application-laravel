<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=5, user-scalable=1" name="viewport"/>
        <meta name="csrf-token" content="{{ csrf_token() }}">

        {!! Theme::partial('theme-meta') !!}

        {!! Theme::header() !!}

        <style>
            :root {
                --bs-primary: {{ theme_option('primary_color', '#766df4') }};
                --bs-primary-rgb: {{ implode(', ', BaseHelper::hexToRgb(theme_option('primary_color', '#766df4'))) }};
            }
        </style>
    </head>
    <body @if (BaseHelper::siteLanguageDirection() == 'rtl') dir="rtl" @endif>
        {!! apply_filters(THEME_FRONT_BODY, null) !!}
        <div id="alert-container"></div>

        @if (theme_option('preloader_enabled', 'yes') == 'yes')
            {!! Theme::partial('preloader') !!}
        @endif

        @if (empty($withoutNavbar))
            {!! Theme::partial('navbar') !!}
        @endempty
