<?php

return [
    'name' => 'Job Board',
    'settings' => 'Settings',
    'emails' => [
        'title' => 'Job Board',
        'description' => 'Job Board email configuration',
        'templates' => [
            'admin_new_job_application_title' => 'New job application (to admin users)',
            'admin_new_job_application_description' => 'Email template to send notice to administrators when system get new job application',
            'employer_new_job_application_title' => 'New job application (to employer and colleagues)',
            'employer_new_job_application_description' => 'Email template to send notice to employer and colleagues when system get new job application',
        ],
    ],
    'company_settings' => 'Company settings',
    'company_settings_description' => 'Settings Company information for invoicing',
    'other_settings' => 'Other settings',
    'other_settings_description' => 'Settings for Job Board',
    'setting' => [
        'thousands_separator' => 'Thousands separator',
        'decimal_separator' => 'Decimal separator',
        'separator_period' => 'Period (.)',
        'separator_comma' => 'Comma (,)',
        'separator_space' => 'Space ( )',
        'job_expired_after_days' => 'Job Expired Time (days)',
        'enable_post_approval' => 'Enable post approval?',
        'enable_credits_system' => 'Enable credits system (employers need to buy credits to post their jobs)',
        'display_views_count_in_detail_page' => 'Display views count in the detail page?',
        'enable_recaptcha_in_register_page' => 'Enable Recaptcha in the registration page?',
        'enable_recaptcha_in_pages_description' => 'Need to setup Captcha in Admin -> Settings -> General first.',
        'verify_account_email' => 'Verify account\'s email?',
        'verify_account_created_company' => 'Verify account\'s created company?',
        'enabled_register_as_employer' => 'Allow visitors to register as employer and post their jobs?',
        'enable_recaptcha_in_apply_job' => 'Enable Recaptcha in the apply job?',
        'add_space_between_price_and_currency' => 'Add a space between price and currency?',
        'enable_guest_apply' => 'Enable guest apply?',
        'enable_review_feature' => 'Enable review feature?',
        'default_account_avatar' => 'Default account avatar',
        'default_account_avatar_helper' => "It's used in case users don't have an avatar.",
        'invoicing' => [
            'company_name' => 'Company name',
            'company_address' => 'Company address',
            'company_email' => 'Company email',
            'company_phone' => 'Company phone',
            'company_logo' => 'Company logo',
        ],
        'using_custom_font_for_invoice' => 'Using custom font for invoice?',
        'invoice_font_family' => 'Invoice font family (Only work for Latin language)',
        'enable_invoice_stamp' => 'Enable invoice stamp?',
        'invoice_support_arabic_language' => 'Support Arabic language in invoice?',
        'invoice_code_prefix' => 'Invoice code prefix',
        'job_location_display' => 'Job location display?',
        'state_and_country' => 'State & Country',
        'city_and_state' => 'City & State',
        'city_state_and_country' => 'City, State & Country',
        'disabled_public_profile' => 'Disable public profile?',
        'enable_zip_code' => 'Enable zip code (postal code)?',
        'hide_company_email' => 'Hide company email?',
    ],
    'job-attributes' => 'Job Attributes',
    'theme_options' => [
        'name' => 'Job Board',
        'description' => 'Theme options for Job Board',
        'logo_employer_dashboard' => 'Logo in the employer dashboard (Default is the main logo)',
        'default_company_cover_image' => 'Default company cover image',
        'default_company_logo' => 'Default company logo (Default is the main logo)',
        'job_companies_page_id' => 'Job companies page',
        'job_categories_page_id' => 'Job categories page',
        'job_candidates_page_id' => 'Job candidates page',
        'job_list_page_id' => 'Job list page',
    ],
    'jobs_page' => 'Jobs Page',
    'categories_page' => 'Job Categories Page',
    'companies_page' => 'Job Companies Page',
    'candidates_page' => 'Job Candidates Page',
];
