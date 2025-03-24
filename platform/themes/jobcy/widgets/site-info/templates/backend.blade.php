<div class="form-group">
    <label>{{ trans('core/base::forms.name') }}</label>
    <input type="text" class="form-control" name="name" value="{{ $config['name'] }}">
</div>

<div class="form-group">
    <label>{{ trans('core/base::forms.description') }}</label>
    <textarea class="form-control" rows="3" name="about">{{ $config['about'] }}</textarea>
</div>

<div class="form-group">
    <label>{{ __('Follow us heading') }}</label>
    <input type="text" class="form-control" name="follow_us_heading" value="{{ $config['follow_us_heading'] }}">
</div>

<div class="form-group">
    <label>{{ __('Social links') }}</label>
    {!! Form::repeater('social_links', is_array($config['social_links']) ? json_encode($config['social_links']) : $config['social_links'], [
        [
            'type'       => 'text',
            'label'      => __('URL'),
            'label_attr' => ['class' => 'control-label'],
            'attributes' => [
                'name'    => 'url',
                'value'   => null,
                'options' => [
                    'class'        => 'form-control',
                    'data-counter' => 300,
                ],
            ],
        ],
        [
            'type'       => 'themeIcon',
            'label'      => __('Icon'),
            'label_attr' => ['class' => 'control-label'],
            'attributes' => [
                'name'    => 'icon',
                'value'   => null,
                'options' => [
                    'class'        => 'form-control',
                    'data-counter' => 300,
                    'empty_value' => __('-- None --'),
                ],
            ],
        ],
    ]) !!}
</div>
