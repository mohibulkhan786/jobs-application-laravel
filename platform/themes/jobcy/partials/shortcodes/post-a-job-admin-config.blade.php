<div class="form-group">
    <label class="control-label">{{ __('Title') }}</label>
    <input type="text" name="title" value="{{ Arr::get($attributes, 'title') }}" class="form-control" placeholder="{{ __('Title') }}">
</div>

<div class="form-group">
    <label class="control-label">{{ __('Highlight text in title') }}</label>
    <input type="text" name="highlight_text" value="{{ Arr::get($attributes, 'highlight_text') }}" class="form-control" placeholder="{{ __('Highlight text in title') }}">
</div>

<div class="form-group">
    <label class="control-label">{{ __('Subtitle') }}</label>
    <input type="text" name="subtitle" value="{{ Arr::get($attributes, 'subtitle') }}" class="form-control" placeholder="{{ __('Subtitle') }}">
</div>

<div class="form-group">
    <label class="control-label">{{ __('Button text') }}</label>
    <input type="text" name="button_text" value="{{ Arr::get($attributes, 'button_text') }}" class="form-control" placeholder="{{ __('Button text') }}">
</div>
