@for ($i = 1; $i < 7; $i++)
    <div class="form-group">
        <label class="control-label">{{ __('Select company :count', ['count' => $i]) }}</label>
        <div class="ui-select-wrapper form-group">
            <select name="company_id_{{ $i }}" class="ui-select">
                <option value="">{{ __('-- select --') }}</option>
                @foreach ($companies as $company)
                    <option value="{{ $company->id }}" @if ($company->id == Arr::get($attributes, 'company_id_' . $i)) selected @endif>{{ $company->name }}</option>
                @endforeach
            </select>
            <svg class="svg-next-icon svg-next-icon-size-16">
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#select-chevron"></use>
            </svg>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label">{{ __('Select image :count (optional)', ['count' => $i]) }}</label>
        {!! Form::mediaImage('image_' . $i, Arr::get($attributes, 'image_' . $i)) !!}
    </div>
@endfor
