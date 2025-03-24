<?php

use Carbon\Carbon;

app()->booted(function () {
    theme_option()
        ->setField([
            'id' => 'preloader_enabled',
            'section_id' => 'opt-text-subsection-general',
            'type' => 'customSelect',
            'label' => __('Enable Preloader?'),
            'attributes' => [
                'name' => 'preloader_enabled',
                'list' => [
                    'yes' => trans('core/base::base.yes'),
                    'no' => trans('core/base::base.no'),
                ],
                'value' => 'yes',
            ],
        ])
        ->setField([
            'id' => 'copyright',
            'section_id' => 'opt-text-subsection-general',
            'type' => 'text',
            'label' => __('Copyright'),
            'attributes' => [
                'name' => 'copyright',
                'value' => __('© :year Your Company. All right reserved.', ['year' => Carbon::now()->format('Y')]),
                'options' => [
                    'class' => 'form-control',
                    'placeholder' => __('Change copyright'),
                    'data-counter' => 250,
                ],
            ],
            'helper' => __('Copyright on footer of site'),
        ])
        ->setField([
            'id' => 'hotline',
            'section_id' => 'opt-text-subsection-general',
            'type' => 'text',
            'label' => __('Hotline'),
            'attributes' => [
                'name' => 'hotline',
                'value' => null,
                'options' => [
                    'class' => 'form-control',
                    'data-counter' => 25,
                ],
            ],
        ])
        ->setField([
            'id' => 'email',
            'section_id' => 'opt-text-subsection-general',
            'type' => 'email',
            'label' => __('Email'),
            'attributes' => [
                'name' => 'email',
                'value' => null,
                'options' => [
                    'class' => 'form-control',
                    'data-counter' => 120,
                ],
            ],
        ])
        ->setField([
            'id' => '404_page_image',
            'section_id' => 'opt-text-subsection-page',
            'type' => 'mediaImage',
            'label' => __('404 page image'),
            'attributes' => [
                'name' => '404_page_image',
                'value' => '',
            ],
        ])
        ->setField([
            'id' => 'sign_in_page_image',
            'section_id' => 'opt-text-subsection-page',
            'type' => 'mediaImage',
            'label' => __('Sign in page image'),
            'attributes' => [
                'name' => 'sign_in_page_image',
                'value' => '',
            ],
        ])
        ->setField([
            'id' => 'sign_up_page_image',
            'section_id' => 'opt-text-subsection-page',
            'type' => 'mediaImage',
            'label' => __('Sign up page image'),
            'attributes' => [
                'name' => 'sign_up_page_image',
                'value' => '',
            ],
        ])
        ->setSection([
            'title' => __('Social links'),
            'desc' => __('Social links'),
            'id' => 'opt-text-subsection-social-links',
            'subsection' => true,
            'icon' => 'fa fa-share-alt',
        ])
        ->setField([
            'id' => 'social_links',
            'section_id' => 'opt-text-subsection-social-links',
            'type' => 'repeater',
            'label' => __('Social links'),
            'attributes' => [
                'name' => 'social_links',
                'value' => null,
                'fields' => [
                    [
                        'type' => 'text',
                        'label' => __('Name'),
                        'attributes' => [
                            'name' => 'social-name',
                            'value' => null,
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                    [
                        'type' => 'themeIcon',
                        'label' => __('Icon'),
                        'attributes' => [
                            'name' => 'social-icon',
                            'value' => null,
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                    [
                        'type' => 'text',
                        'label' => __('URL'),
                        'attributes' => [
                            'name' => 'social-url',
                            'value' => null,
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                ],
            ],
        ])
        ->setSection([
            'title' => __('Style'),
            'desc' => __('Style of theme'),
            'id' => 'opt-text-subsection-style',
            'subsection' => true,
            'icon' => 'fa fa-bars',
        ])

        ->setField([
            'id' => 'primary_font',
            'section_id' => 'opt-text-subsection-style',
            'type' => 'googleFonts',
            'label' => __('Primary font'),
            'attributes' => [
                'name' => 'primary_font',
                'value' => 'Inter',
            ],
        ])
        ->setField([
            'id' => 'secondary_font',
            'section_id' => 'opt-text-subsection-style',
            'type' => 'googleFonts',
            'label' => __('Secondary font'),
            'attributes' => [
                'name' => 'secondary_font',
                'value' => 'Dancing Script',
            ],
        ])
        ->setField([
            'id' => 'primary_color',
            'section_id' => 'opt-text-subsection-style',
            'type' => 'customColor',
            'label' => __('Primary color'),
            'attributes' => [
                'name' => 'primary_color',
                'value' => '#766df4',
            ],
        ]);
});
