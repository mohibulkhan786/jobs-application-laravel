<?php

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Blog\Repositories\Interfaces\PostInterface;
use Botble\Faq\Repositories\Interfaces\FaqCategoryInterface;
use Botble\JobBoard\Enums\JobStatusEnum;
use Botble\JobBoard\Facades\JobBoardHelper;
use Botble\JobBoard\Models\Company;
use Botble\JobBoard\Models\Job;
use Botble\JobBoard\Repositories\Interfaces\CategoryInterface;
use Botble\JobBoard\Repositories\Interfaces\CompanyInterface;
use Botble\JobBoard\Repositories\Interfaces\JobExperienceInterface;
use Botble\JobBoard\Repositories\Interfaces\JobInterface;
use Botble\JobBoard\Repositories\Interfaces\JobSkillInterface;
use Botble\JobBoard\Repositories\Interfaces\JobTypeInterface;
use Botble\Location\Facades\Location;
use Botble\Page\Repositories\Interfaces\PageInterface;
use Botble\Shortcode\Compilers\Shortcode;
use Botble\Testimonial\Models\Testimonial;
use Botble\Theme\Facades\Theme;
use Botble\Theme\Supports\ThemeSupport;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\DB;

app()->booted(function () {
    ThemeSupport::registerGoogleMapsShortcode();
    ThemeSupport::registerYoutubeShortcode();

    add_shortcode('search-box', __('Search box'), __('The big search box'), function (Shortcode $shortcode) {
        return Theme::partial('shortcodes.search-box', compact('shortcode'));
    });

    shortcode()->setAdminConfig('search-box', function (array $attributes) {
        return Theme::partial('shortcodes.search-box-admin-config', compact('attributes'));
    });

    add_shortcode('how-it-work', __('How it work'), __('How it work'), function (Shortcode $shortcode) {
        return Theme::partial('shortcodes.how-it-work', compact('shortcode'));
    });

    shortcode()->setAdminConfig('how-it-work', function (array $attributes) {
        return Theme::partial('shortcodes.how-it-work-admin-config', compact('attributes'));
    });

    add_shortcode('start-working', __('Start working'), __('Start working'), function (Shortcode $shortcode) {
        return Theme::partial('shortcodes.start-working', compact('shortcode'));
    });

    shortcode()->setAdminConfig('start-working', function (array $attributes) {
        return Theme::partial('shortcodes.start-working-admin-config', compact('attributes'));
    });

    add_shortcode('coming-soon', __('Coming Soon'), __('Coming Soon'), function (Shortcode $shortcode) {
        return Theme::partial('shortcodes.coming-soon', compact('shortcode'));
    });

    shortcode()->setAdminConfig('coming-soon', function (array $attributes) {
        return Theme::partial('shortcodes.coming-soon-admin-config', compact('attributes'));
    });

    if (is_plugin_active('job-board')) {
        add_shortcode('job-list', __('Job list'), __('Show job list'), function (Shortcode $shortcode) {
            $requestQuery = JobBoardHelper::getJobFilters(request()->input());

            $jobs = app(JobInterface::class)->getJobs(
                $requestQuery,
                [
                    'order_by' => [
                        'jb_jobs.created_at' => 'desc',
                        'jb_jobs.is_featured' => 'desc',
                    ],
                    'paginate' => [
                        'per_page' => $requestQuery['per_page'] ?: 10,
                        'current_paged' => $requestQuery['page'] ?: 1,
                    ],
                ],
            );

            $jobCategories = app(CategoryInterface::class)
                ->advancedGet(
                    [
                        'withCount' => ['jobs'],
                        'condition' => [
                            'status' => BaseStatusEnum::PUBLISHED,
                        ],
                    ]
                );

            $jobFeaturedCategories = $jobCategories->where('is_featured')
                ->loadCount([
                    'jobs' => function ($query) {
                        $query
                            ->where('jb_jobs.status', JobStatusEnum::PUBLISHED)
                            ->notExpired();
                    },
                ]);

            $jobTypes = app(JobTypeInterface::class)
                ->advancedGet([
                    'withCount' => ['jobs' => function ($query) {
                        $query->where(JobBoardHelper::getJobDisplayQueryConditions());
                    }],
                    'condition' => [
                        'status' => BaseStatusEnum::PUBLISHED,
                    ],
                ]);

            $jobExperiences = app(JobExperienceInterface::class)
                ->advancedGet([
                    'withCount' => ['jobs'],
                    'condition' => [
                        'status' => BaseStatusEnum::PUBLISHED,
                    ],
                ]);

            $jobSkills = app(JobSkillInterface::class)
                ->advancedGet([
                    'withCount' => ['jobs'],
                    'condition' => [
                        'status' => BaseStatusEnum::PUBLISHED,
                    ],
                ]);

            if (theme_option('show_map_on_jobs_page', 'yes') == 'yes') {
                Theme::asset()->usePath()->add('leaflet-css', 'libs/leaflet/leaflet.css');
                Theme::asset()->container('footer')->usePath()->add('leaflet-js', 'libs/leaflet/leaflet.js');
                Theme::asset()->container('footer')->usePath()->add('markercluster-src-js', 'libs/leaflet/leaflet.markercluster-src.js');
            }

            return Theme::partial('shortcodes.job-list', compact(
                'shortcode',
                'jobs',
                'jobCategories',
                'jobTypes',
                'jobExperiences',
                'jobSkills',
                'jobFeaturedCategories'
            ));
        });

        shortcode()->setAdminConfig('job-list', function (array $attributes) {
            return Theme::partial('shortcodes.job-list-admin-config', compact('attributes'));
        });

        add_shortcode('featured-job-categories', __('Featured job categories'), __('Featured job categories'), function (Shortcode $shortcode) {
            $categories = app(CategoryInterface::class)->getFeaturedCategories();
            $page = null;
            if ($pageId = theme_option('job_categories_page_id')) {
                $page = app(PageInterface::class)->getFirstBy([
                    'id' => $pageId,
                    'status' => BaseStatusEnum::PUBLISHED,
                ], ['id', 'name'], ['slugable']);
            }

            return Theme::partial('shortcodes.featured-job-categories', compact('shortcode', 'categories', 'page'));
        });

        shortcode()->setAdminConfig('featured-job-categories', function (array $attributes) {
            return Theme::partial('shortcodes.featured-job-categories-admin-config', compact('attributes'));
        });

        add_shortcode('job-categories', __('Job categories'), __('Job categories'), function (Shortcode $shortcode) {
            $categories = app(CategoryInterface::class)->getCategories();

            return Theme::partial('shortcodes.job-categories', compact('shortcode', 'categories'));
        });

        shortcode()->setAdminConfig('job-categories', function (array $attributes) {
            return Theme::partial('shortcodes.job-categories-admin-config', compact('attributes'));
        });

        add_shortcode('job-companies', __('Job companies'), __('Job companies'), function (Shortcode $shortcode) {
            $with = ['slugable'];
            if (is_plugin_active('location')) {
                $with[] = 'state';
            }
            $companies = app(CompanyInterface::class)->getModel()
                ->select(['jb_companies.*'])
                ->where('jb_companies.status', BaseStatusEnum::PUBLISHED)
                ->with($with)
                ->withCount([
                    'jobs' => function (Builder $query) {
                        // @phpstan-ignore-next-line
                        $query
                            ->where([
                                    'jb_jobs.hide_company' => false,
                                ] + JobBoardHelper::getJobDisplayQueryConditions())
                            ->notExpired();
                    },
                    'reviews',
                    'reviews as reviews_avg' => function (Builder $query) {
                        $query->select(DB::raw('AVG(star)'));
                    },
                ]);

            $latestJob = app(JobInterface::class)->getModel()
                ->whereColumn('jb_jobs.company_id', 'jb_companies.id')
                ->where([
                        'jb_jobs.hide_company' => false,
                    ] + JobBoardHelper::getJobDisplayQueryConditions())
                ->notExpired();

            $orderBy = request()->input('order_by');

            switch ($orderBy) {
                case 'newest':
                    $latestJob = $latestJob->selectRaw('MAX(jb_jobs.created_at)');
                    $companies = $companies->selectSub($latestJob, 'job_created_at')
                        ->orderByRaw('ISNULL(job_created_at) ASC, job_created_at DESC');

                    break;
                case 'oldest':
                    $latestJob = $latestJob->selectRaw('MIN(jb_jobs.created_at)');
                    $companies = $companies->selectSub($latestJob, 'job_created_at')
                        ->orderByRaw('ISNULL(job_created_at) ASC, job_created_at ASC');

                    break;
                case 'jobs':
                    $companies = $companies->orderBy('jobs_count', 'DESC');

                    break;
                default:
                    break;
            }

            $companies = $companies->paginate($shortcode->number_per_page ?? 9);

            return Theme::partial('shortcodes.job-companies', compact('shortcode', 'companies'));
        });

        shortcode()->setAdminConfig('job-companies', function (array $attributes) {
            return Theme::partial('shortcodes.job-companies-admin-config', compact('attributes'));
        });

        add_shortcode('job-candidates', __('Candidate list'), __('Candidate list'), function (Shortcode $shortcode) {
            request()->merge(['per_page' => $shortcode->number_per_page ?? 9]);

            $candidates = JobBoardHelper::filterCandidates(request()->input());

            return Theme::partial('shortcodes.job-candidates', compact('shortcode', 'candidates'));
        });

        shortcode()->setAdminConfig('job-candidates', function (array $attributes) {
            return Theme::partial('shortcodes.job-candidates-admin-config', compact('attributes'));
        });

        add_shortcode('job-tabs', __('Job tabs'), __('Job tabs'), function (Shortcode $shortcode) {
            $with = [
                'slugable',
                'jobTypes',
                'company',
                'company.slugable',
                'tags',
                'tags.slugable',
                'jobExperience',
            ];

            if (is_plugin_active('location')) {
                $with = array_merge($with, array_keys(Location::getSupported(Job::class)));
            }

            $featuredJobs = app(JobInterface::class)->getFeaturedJobs(10, $with);
            $recentJobs = app(JobInterface::class)->getRecentJobs(10, $with);
            $popularJobs = app(JobInterface::class)->getPopularJobs(10, $with);

            return Theme::partial('shortcodes.job-tabs', compact('shortcode', 'featuredJobs', 'recentJobs', 'popularJobs'));
        });

        shortcode()->setAdminConfig('job-tabs', function (array $attributes) {
            return Theme::partial('shortcodes.job-tabs-admin-config', compact('attributes'));
        });

        add_shortcode('featured-companies', __('Featured companies'), __('Featured companies'), function (Shortcode $shortcode) {
            $companyIds = [];
            $images = [];
            $attributes = $shortcode->toArray();

            for ($i = 1; $i < 7; $i++) {
                if (! empty($attributes['company_id_' . $i])) {
                    $companyIds[] = $attributes['company_id_' . $i];

                    $images[$attributes['company_id_' . $i]] = Arr::get($attributes, 'image_' . $i);
                }
            }

            $companyIds = array_filter($companyIds);

            $companies = Company::query()
                ->where([
                    'status' => BaseStatusEnum::PUBLISHED,
                    'is_featured' => 1,
                ])
                ->whereIn('id', $companyIds)
                ->orderBy('created_at', 'desc')
                ->with(['slugable'])
                ->get();

            if (count($images)) {
                foreach ($companies as &$company) {
                    if (! empty($images[$company->id])) {
                        $company->logo = $images[$company->id];
                    }
                }
            }

            return Theme::partial('shortcodes.featured-companies', compact('shortcode', 'companies'));
        });

        shortcode()->setAdminConfig('featured-companies', function (array $attributes) {
            $companies = app(CompanyInterface::class)->allBy(['status' => BaseStatusEnum::PUBLISHED]);

            return Theme::partial('shortcodes.featured-companies-admin-config', compact('attributes', 'companies'));
        });

        add_shortcode('post-a-job', __('Post a job'), __('Post a job'), function (Shortcode $shortcode) {
            return Theme::partial('shortcodes.post-a-job', compact('shortcode'));
        });

        shortcode()->setAdminConfig('post-a-job', function (array $attributes) {
            return Theme::partial('shortcodes.post-a-job-admin-config', compact('attributes'));
        });
    }

    if (is_plugin_active('testimonial')) {
        add_shortcode('testimonials', __('Testimonials'), __('Testimonials'), function (Shortcode $shortcode) {
            $testimonials = Testimonial::query()->where(['status' => BaseStatusEnum::PUBLISHED])->get();

            return Theme::partial('shortcodes.testimonials', compact('shortcode', 'testimonials'));
        });

        shortcode()->setAdminConfig('testimonials', function (array $attributes) {
            return Theme::partial('shortcodes.testimonials-admin-config', compact('attributes'));
        });
    }

    if (is_plugin_active('blog')) {
        add_shortcode('featured-news', __('Featured news'), __('Featured news'), function (Shortcode $shortcode) {
            $posts = app(PostInterface::class)->getFeatured(3, ['author']);

            return Theme::partial('shortcodes.featured-news', compact('shortcode', 'posts'));
        });

        shortcode()->setAdminConfig('featured-news', function (array $attributes) {
            return Theme::partial('shortcodes.featured-news-admin-config', compact('attributes'));
        });
    }

    if (is_plugin_active('contact')) {
        add_filter(CONTACT_FORM_TEMPLATE_VIEW, function () {
            return Theme::getThemeNamespace() . '::partials.shortcodes.contact-form';
        }, 120);

        shortcode()->setAdminConfig('contact-form', function (array $attributes) {
            return Theme::partial('shortcodes.contact-admin-config', compact('attributes'));
        });
    }

    if (is_plugin_active('faq')) {
        add_shortcode('faq', __('FAQs'), __('FAQs'), function (Shortcode $shortcode) {
            $categories = app(FaqCategoryInterface::class)
                ->advancedGet([
                    'condition' => [
                        'status' => BaseStatusEnum::PUBLISHED,
                    ],
                    'with' => [
                        'faqs' => function ($query) {
                            $query->where('status', BaseStatusEnum::PUBLISHED);
                        },
                    ],
                    'order_by' => [
                        'faq_categories.order' => 'ASC',
                        'faq_categories.created_at' => 'DESC',
                    ],
                ]);

            return Theme::partial('shortcodes.faq', compact('shortcode', 'categories'));
        });

        shortcode()->setAdminConfig('faq', function (array $attributes) {
            return Theme::partial('shortcodes.faq-admin-config', compact('attributes'));
        });
    }
});
