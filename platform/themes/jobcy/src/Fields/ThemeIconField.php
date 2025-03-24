<?php

namespace Theme\Jobcy\Fields;

use Botble\Base\Facades\Assets;
use Botble\Base\Forms\FormField;
use Botble\Theme\Facades\Theme;

class ThemeIconField extends FormField
{
    protected function getTemplate(): string
    {
        Assets::addScriptsDirectly(Theme::asset()->url('js/icons-field.js'))
            ->addStylesDirectly(Theme::asset()->url('css/icons.css'));

        return Theme::getThemeNamespace() . '::partials.fields.icons-field';
    }
}
