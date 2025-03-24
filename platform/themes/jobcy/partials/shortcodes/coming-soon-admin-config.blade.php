<div class="form-group">
    <label class="control-label">{{ __('Title') }}</label>
    <input type="text" name="title" value="{{ Arr::get($attributes, 'title') }}" class="form-control" placeholder="{{ __('Title') }}">
</div>

<div class="form-group">
    <label class="control-label">{{ __('Subtitle') }}</label>
    <input type="text" name="subtitle" value="{{ Arr::get($attributes, 'subtitle') }}" class="form-control" placeholder="{{ __('Subtitle') }}">
</div>
<div class="form-group">
    <label class="control-label">{{ __('Date') }}</label>
    <input type="text" name="date" value="{{ Arr::get($attributes, 'date') }}" class="form-control" placeholder="{{ BaseHelper::formatDate(now()->addMonths(1)) }}">
    <span class="help-block">{{ __('Please use format :format', ['format' => config('core.base.general.date_format.date')]) }}</span>
</div>
<div class="form-group">
    <label class="control-label">{{ __('Time') }}</label>
    <input type="time" name="time" value="{{ Arr::get($attributes, 'time') }}" class="form-control" placeholder="{{ __('Time') }}">
</div>

<div class="form-group">
    <label class="control-label">{{ __('Image') }}</label>
    {!! Form::mediaImage('image', Arr::get($attributes, 'image')) !!}
</div>
@if (is_plugin_active('newsletter'))
    <div class="form-group">
        <label class="control-label">{{ __('Show newsletter form') }}</label>
        {!! Form::customSelect('show_newsletter', ['yes' => __('Yes'), 'no' => __('No')], Arr::get($attributes, 'show_newsletter', 'yes')) !!}
    </div>
@endif
