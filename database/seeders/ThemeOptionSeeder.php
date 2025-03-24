<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Setting\Facades\Setting;
use Botble\Theme\Facades\Theme;
use Carbon\Carbon;

class ThemeOptionSeeder extends BaseSeeder
{
    public function run(): void
    {
        $this->uploadFiles('general');

        $theme = Theme::getThemeName();

        $settingPrefix = 'theme-' . $theme . '-';

        Setting::newQuery()->where('key', 'LIKE', $settingPrefix . '%')->delete();

        $data = [
            'site_title' => 'Jobcy - Laravel Job Board Script',
            'seo_description' => 'Jobcy – is a modern job board Laravel script designed to connect people looking for a job with work hunting employers. This script represents simple design to help build the website for advertising vacancies, finding suitable staff, receiving employer’s resumes and CV',
            'copyright' => '©' . Carbon::now()->format('Y') . ' Botble Technologies. All right reserved.',
            'favicon' => 'general/favicon.png',
            'logo' => 'general/logo.png',
            'hotline' => '+(123) 345-6789',
            'cookie_consent_message' => 'Your experience on this site will be improved by allowing cookies ',
            'cookie_consent_learn_more_url' => '/cookie-policy',
            'cookie_consent_learn_more_text' => 'Cookie Policy',
            'homepage_id' => '1',
            'blog_page_id' => '2',
            'preloader_enabled' => 'no',
            'job_categories_page_id' => '10',
            'job_companies_page_id' => '11',
            'job_candidates_page_id' => '15',
            'job_list_page_id' => '17',
            'default_company_cover_image' => 'general/cover-image.jpg',
            'email' => 'contact@jobcy.com',
            '404_page_image' => 'general/404.png',
        ];

        foreach ($data as $options) {
            $options = collect($options)
                ->mapWithKeys(function (string $value, string $key) use ($settingPrefix) {
                    return [$settingPrefix . $key => $value];
                })
                ->all();

            Setting::set($options);
        }

        $socialLinks = [
            [
                [
                    'key' => 'social-name',
                    'value' => 'Whatsapp',
                ],
                [
                    'key' => 'social-icon',
                    'value' => 'uil uil-whatsapp',
                ],
                [
                    'key' => 'social-url',
                    'value' => 'https://whatsapp.com',
                ],
            ],
            [
                [
                    'key' => 'social-name',
                    'value' => 'Facebook messenger',
                ],
                [
                    'key' => 'social-icon',
                    'value' => 'uil uil-facebook-messenger-alt',
                ],
                [
                    'key' => 'social-url',
                    'value' => 'https://messenger.com',
                ],
            ],
            [
                [
                    'key' => 'social-name',
                    'value' => 'Instagram',
                ],
                [
                    'key' => 'social-icon',
                    'value' => 'uil uil-instagram',
                ],
                [
                    'key' => 'social-url',
                    'value' => 'https://instagram.com',
                ],
            ],
            [
                [
                    'key' => 'social-name',
                    'value' => 'Email',
                ],
                [
                    'key' => 'social-icon',
                    'value' => 'uil uil-envelope',
                ],
                [
                    'key' => 'social-url',
                    'value' => 'mailto:support@botble.com',
                ],
            ],
            [
                [
                    'key' => 'social-name',
                    'value' => 'Twitter',
                ],
                [
                    'key' => 'social-icon',
                    'value' => 'uil uil-twitter-alt',
                ],
                [
                    'key' => 'social-url',
                    'value' => 'https://twitter.com',
                ],
            ],
        ];

        Setting::set($settingPrefix . 'social_links', json_encode($socialLinks));

        Setting::save();
    }
}
