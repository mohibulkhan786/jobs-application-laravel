<div class="form-group">
    <label class="control-label">{{ __('Title') }}</label>
    <input type="text" name="title" value="{{ Arr::get($attributes, 'title') }}" class="form-control" placeholder="{{ __('Title') }}">
</div>

<div class="form-group">
    <label class="control-label">{{ __('Subtitle') }}</label>
    <input type="text" name="subtitle" value="{{ Arr::get($attributes, 'subtitle') }}" class="form-control" placeholder="{{ __('Subtitle') }}">
</div>

<div class="form-group">
    <label class="control-label">{{ __('Button 1 Icon') }}</label>
    {!! Form::themeIcon('button_1_icon', Arr::get($attributes, 'button_1_icon')) !!}
</div>

<div class="form-group">
    <label class="control-label">{{ __('Button 1 Text') }}</label>
    <input type="text" name="button_1_text" value="{{ Arr::get($attributes, 'button_1_text') }}" class="form-control" placeholder="{{ __('Button 1 Text') }}">
</div>

<div class="form-group">
    <label class="control-label">{{ __('Button 1 URL') }}</label>
    <input type="text" name="button_1_url" value="{{ Arr::get($attributes, 'button_1_url') }}" class="form-control" placeholder="{{ __('Button 1 URL') }}">
</div>

<div class="form-group">
    <label class="control-label">{{ __('Button 2 Icon') }}</label>
    {!! Form::themeIcon('button_2_icon', Arr::get($attributes, 'button_2_icon')) !!}
</div>

<div class="form-group">
    <label class="control-label">{{ __('Button 2 Text') }}</label>
    <input type="text" name="button_2_text" value="{{ Arr::get($attributes, 'button_2_text') }}" class="form-control" placeholder="{{ __('Button 2 Text') }}">
</div>

<div class="form-group">
    <label class="control-label">{{ __('Button 2 URL') }}</label>
    <input type="text" name="button_2_url" value="{{ Arr::get($attributes, 'button_2_url') }}" class="form-control" placeholder="{{ __('Button 2 URL') }}">
</div>
