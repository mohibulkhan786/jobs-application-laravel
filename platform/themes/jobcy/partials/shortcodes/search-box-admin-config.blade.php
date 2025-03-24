<div class="form-group">
    <label class="control-label">{{ __('Subtitle') }}</label>
    <input type="text" name="subtitle" value="{{ Arr::get($attributes, 'subtitle') }}" class="form-control" placeholder="{{ __('Subtitle') }}">
</div>

<div class="form-group">
    <label class="control-label">{{ __('Title') }}</label>
    <input type="text" name="title" value="{{ Arr::get($attributes, 'title') }}" class="form-control" placeholder="{{ __('Title') }}">
</div>

<div class="form-group">
    <label class="control-label">{{ __('Highlight text in title') }}</label>
    <input type="text" name="highlight_text" value="{{ Arr::get($attributes, 'highlight_text') }}" class="form-control" placeholder="{{ __('Highlight text in title') }}">
</div>

<div class="form-group">
    <label class="control-label">{{ __('Description') }}</label>
    <textarea name="description" class="form-control" rows="3" placeholder="{{ __('Description') }}">{{ Arr::get($attributes, 'description') }}</textarea>
</div>

<div class="form-group">
    <label class="control-label">{{ __('Image') }}</label>
    {!! Form::mediaImage('image', Arr::get($attributes, 'image')) !!}
</div>

@php
    $random = Str::random(20);
@endphp

<div class="form-group">
    <label class="control-label">{{ __('Style') }}</label>
    {!! Form::customSelect('style', [
            'style-1' => __('Style 1'),
            'style-2' => __('Style 2'),
            'style-3' => __('Style 3'),
        ], Arr::get($attributes, 'style'), ['id' => 'style_' . $random]) !!}
</div>

<div class="form-group search-box-style-shortcode" @if (Arr::get($attributes, 'style') != 'style-3') style="display: none" @endif>
    <label class="control-label">{{ __('Images') }}</label>
    {!! Form::mediaImages('images', explode(',', Arr::get($attributes, 'images', '')), ['allow_thumb' => false]) !!}
</div>

<div class="form-group search-box-keyword-shortcode" @if (Arr::get($attributes, 'style') != 'style-2') style="display: none" @endif>
    <label class="control-label">{{ __('Trending Keywords') }}</label>
    <input type="text" name="trending_keywords" value="{{ Arr::get($attributes, 'trending_keywords') }}"
        class="form-control" placeholder="{{ __('Trending keywords (comma separated)') }}">
</div>

<script>
    'use strict';

    $('#style_{{ $random }}').on('change', function() {
        if ('style-3' === $(this).val()) {
            $('.search-box-style-shortcode').show();
        } else {
            $('.search-box-style-shortcode').hide();
        }

        if ('style-2' === $(this).val()) {
            $('.search-box-keyword-shortcode').show();
        } else {
            $('.search-box-keyword-shortcode').hide();
        }
    });
</script>
