@php
    Arr::set($attributes, 'class', Arr::get($attributes, 'class') . ' icon-select');
    Arr::set($attributes, 'data-empty-value', Arr::get($attributes, 'empty_value'));
    Arr::set($attributes, 'data-check-initialized', 'true');
@endphp

{!! Form::customSelect($name, [$value => $value], $value, $attributes) !!}

@once
    @if (request()->ajax())
        <link media="all" type="text/css" rel="stylesheet" href="{{ Theme::asset()->url('css/icons.css') }}">
        <script src="{{ Theme::asset()->url('js/icons-field.js') }}?v=1.0.2"></script>
    @else
        @push('header')
            <link media="all" type="text/css" rel="stylesheet" href="{{ Theme::asset()->url('css/icons.css') }}">
            <script src="{{ Theme::asset()->url('js/icons-field.js') }}?v=1.0.2"></script>
        @endpush
    @endif
@endonce
