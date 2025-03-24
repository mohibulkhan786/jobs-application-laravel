<?php

use Botble\Base\Facades\Form;
use Botble\Base\Facades\MetaBox;
use Botble\Base\Forms\FormAbstract;
use Botble\Base\Forms\FormHelper;
use Botble\Base\Models\MetaBox as MetaBoxModel;
use Botble\JobBoard\Models\Category;
use Botble\Media\Facades\RvMedia;
use Botble\Theme\Facades\Theme;
use Theme\Jobcy\Fields\ThemeIconField;

register_page_template([
    'default' => 'Default',
    'homepage' => 'Homepage',
    'static' => 'Static',
    'coming-soon' => 'Coming Soon',
]);

register_sidebar([
    'id' => 'pre_footer_sidebar',
    'name' => __('Pre footer sidebar'),
    'description' => __('Widgets at the bottom of the page.'),
]);

register_sidebar([
    'id' => 'footer_sidebar',
    'name' => __('Footer sidebar'),
    'description' => __('Widgets in footer of page'),
]);

RvMedia::addSize('small', 500, 300)->addSize('medium', 740, 416);

RvMedia::setUploadPathAndURLToPublic();

Form::component('themeIcon', Theme::getThemeNamespace() . '::partials.forms.fields.icons-field', [
    'name',
    'value' => null,
    'attributes' => [],
]);

add_filter('form_custom_fields', function (FormAbstract $form, FormHelper $formHelper) {
    if (! $formHelper->hasCustomField('themeIcon')) {
        $form->addCustomField('themeIcon', ThemeIconField::class);
    }

    return $form;
}, 29, 2);

if (is_plugin_active('job-board')) {
    app()->booted(function () {
        Category::resolveRelationUsing('icon', function ($model) {
            return $model->morphOne(MetaBoxModel::class, 'reference')->where('meta_key', 'icon');
        });
    });

    add_action(BASE_ACTION_META_BOXES, function ($context, $object) {
        if (get_class($object) === Category::class && $context == 'advanced') {
            MetaBox::addMetaBox('additional_job_category_fields', __('Addition Information'), function () {
                $icon = null;
                $iconImage = null;
                $args = func_get_args();
                if (! empty($args[0])) {
                    $icon = MetaBox::getMetaData($args[0], 'icon', true);
                    $iconImage = MetaBox::getMetaData($args[0], 'icon_image', true);
                }

                return Theme::partial('job-category-fields', compact('icon', 'iconImage'));
            }, get_class($object), $context);
        }
    }, 75, 2);

    add_action([BASE_ACTION_AFTER_CREATE_CONTENT, BASE_ACTION_AFTER_UPDATE_CONTENT], function ($type, $request, $object) {
        if (get_class($object) === Category::class) {
            if ($request->has('icon')) {
                MetaBox::saveMetaBoxData($object, 'icon', $request->input('icon'));
            }

            if ($request->has('icon_image')) {
                MetaBox::saveMetaBoxData($object, 'icon_image', $request->input('icon_image'));
            }
        }
    }, 75, 3);
}
