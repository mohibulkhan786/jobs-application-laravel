<div class="form-group">
    <label class="control-label">{{ __('Title') }}</label>
    <input type="text" name="title" value="{{ Arr::get($attributes, 'title') }}" class="form-control" placeholder="{{ __('Title') }}">
</div>

<div class="form-group">
    <label class="control-label">{{ __('Subtitle') }}</label>
    <input type="text" name="subtitle" value="{{ Arr::get($attributes, 'subtitle') }}" class="form-control" placeholder="{{ __('Subtitle') }}">
</div>

<hr>

@for ($i = 1; $i <= 5; $i++)
    <div style="border: 1px solid #cac6c6; padding: 15px 10px; margin-bottom: 20px;">
        <div class="form-group">
            <label class="control-label">{{ __('Step :number title', ['number' => $i]) }}</label>
            <input type="text" name="step_{{ $i }}_title" value="{{ Arr::get($attributes, 'step_' . $i . '_title') }}" class="form-control" placeholder="{{ __('Step :number title', ['number' => $i]) }}">
        </div>
        <div class="form-group">
            <label class="control-label">{{ __('Step :number description', ['number' => $i]) }}</label>
            <input type="text" name="step_{{ $i }}_description" value="{{ Arr::get($attributes, 'step_' . $i . '_description') }}" class="form-control" placeholder="{{ __('Step :number description', ['number' => $i]) }}">
        </div>
        <div class="form-group">
            <label class="control-label">{{ __('Step :number image', ['number' => $i]) }}</label>
            {!! Form::mediaImage('step_' . $i . '_image', Arr::get($attributes, 'step_' . $i . '_image')) !!}
        </div>
    </div>
@endfor
