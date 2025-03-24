<?php

namespace Botble\JobBoard\Providers;

use Botble\Api\Facades\ApiHelper;
use Botble\Base\Facades\EmailHandler;
use Botble\Base\Facades\Form;
use Botble\Base\Facades\MacroableModels;
use Botble\Base\Models\BaseModel;
use Botble\Base\Supports\Helper;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\JobBoard\Commands\CheckExpiredJobsSoonCommand;
use Botble\JobBoard\Commands\RenewJobsCommand;
use Botble\JobBoard\Enums\AccountTypeEnum;
use Botble\JobBoard\Facades\JobBoardHelper;
use Botble\JobBoard\Http\Middleware\EnabledCreditsSystem;
use Botble\JobBoard\Http\Middleware\RedirectIfAccount;
use Botble\JobBoard\Http\Middleware\RedirectIfNotAccount;
use Botble\JobBoard\Models\Account;
use Botble\JobBoard\Models\AccountActivityLog;
use Botble\JobBoard\Models\Analytics;
use Botble\JobBoard\Models\CareerLevel;
use Botble\JobBoard\Models\Category;
use Botble\JobBoard\Models\Company;
use Botble\JobBoard\Models\Currency;
use Botble\JobBoard\Models\CustomField;
use Botble\JobBoard\Models\CustomFieldOption;
use Botble\JobBoard\Models\CustomFieldValue;
use Botble\JobBoard\Models\DegreeLevel;
use Botble\JobBoard\Models\DegreeType;
use Botble\JobBoard\Models\FunctionalArea;
use Botble\JobBoard\Models\Invoice;
use Botble\JobBoard\Models\Job;
use Botble\JobBoard\Models\JobApplication;
use Botble\JobBoard\Models\JobExperience;
use Botble\JobBoard\Models\JobShift;
use Botble\JobBoard\Models\JobSkill;
use Botble\JobBoard\Models\JobType;
use Botble\JobBoard\Models\LanguageLevel;
use Botble\JobBoard\Models\Package;
use Botble\JobBoard\Models\Review;
use Botble\JobBoard\Models\Tag;
use Botble\JobBoard\Models\Transaction;
use Botble\JobBoard\Repositories\Eloquent\AccountActivityLogRepository;
use Botble\JobBoard\Repositories\Eloquent\AccountRepository;
use Botble\JobBoard\Repositories\Eloquent\AnalyticsRepository;
use Botble\JobBoard\Repositories\Eloquent\CareerLevelRepository;
use Botble\JobBoard\Repositories\Eloquent\CategoryRepository;
use Botble\JobBoard\Repositories\Eloquent\CompanyRepository;
use Botble\JobBoard\Repositories\Eloquent\CurrencyRepository;
use Botble\JobBoard\Repositories\Eloquent\CustomFieldRepository;
use Botble\JobBoard\Repositories\Eloquent\DegreeLevelRepository;
use Botble\JobBoard\Repositories\Eloquent\DegreeTypeRepository;
use Botble\JobBoard\Repositories\Eloquent\FunctionalAreaRepository;
use Botble\JobBoard\Repositories\Eloquent\InvoiceRepository;
use Botble\JobBoard\Repositories\Eloquent\JobApplicationRepository;
use Botble\JobBoard\Repositories\Eloquent\JobExperienceRepository;
use Botble\JobBoard\Repositories\Eloquent\JobRepository;
use Botble\JobBoard\Repositories\Eloquent\JobShiftRepository;
use Botble\JobBoard\Repositories\Eloquent\JobSkillRepository;
use Botble\JobBoard\Repositories\Eloquent\JobTypeRepository;
use Botble\JobBoard\Repositories\Eloquent\LanguageLevelRepository;
use Botble\JobBoard\Repositories\Eloquent\PackageRepository;
use Botble\JobBoard\Repositories\Eloquent\ReviewRepository;
use Botble\JobBoard\Repositories\Eloquent\TagRepository;
use Botble\JobBoard\Repositories\Eloquent\TransactionRepository;
use Botble\JobBoard\Repositories\Interfaces\AccountActivityLogInterface;
use Botble\JobBoard\Repositories\Interfaces\AccountInterface;
use Botble\JobBoard\Repositories\Interfaces\AnalyticsInterface;
use Botble\JobBoard\Repositories\Interfaces\CareerLevelInterface;
use Botble\JobBoard\Repositories\Interfaces\CategoryInterface;
use Botble\JobBoard\Repositories\Interfaces\CompanyInterface;
use Botble\JobBoard\Repositories\Interfaces\CurrencyInterface;
use Botble\JobBoard\Repositories\Interfaces\CustomFieldInterface;
use Botble\JobBoard\Repositories\Interfaces\DegreeLevelInterface;
use Botble\JobBoard\Repositories\Interfaces\DegreeTypeInterface;
use Botble\JobBoard\Repositories\Interfaces\FunctionalAreaInterface;
use Botble\JobBoard\Repositories\Interfaces\InvoiceInterface;
use Botble\JobBoard\Repositories\Interfaces\JobApplicationInterface;
use Botble\JobBoard\Repositories\Interfaces\JobExperienceInterface;
use Botble\JobBoard\Repositories\Interfaces\JobInterface;
use Botble\JobBoard\Repositories\Interfaces\JobShiftInterface;
use Botble\JobBoard\Repositories\Interfaces\JobSkillInterface;
use Botble\JobBoard\Repositories\Interfaces\JobTypeInterface;
use Botble\JobBoard\Repositories\Interfaces\LanguageLevelInterface;
use Botble\JobBoard\Repositories\Interfaces\PackageInterface;
use Botble\JobBoard\Repositories\Interfaces\ReviewInterface;
use Botble\JobBoard\Repositories\Interfaces\TagInterface;
use Botble\JobBoard\Repositories\Interfaces\TransactionInterface;
use Botble\LanguageAdvanced\Supports\LanguageAdvancedManager;
use Botble\Location\Facades\Location;
use Botble\Optimize\Facades\OptimizerHelper;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Slug\Facades\SlugHelper;
use Botble\SocialLogin\Facades\SocialService;
use Botble\Theme\Facades\SiteMapManager;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\AliasLoader;
use Illuminate\Http\Request;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\ServiceProvider;

class JobBoardServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->singleton(JobInterface::class, function () {
            return new JobRepository(new Job());
        });

        $this->app->bind(JobTypeInterface::class, function () {
            return new JobTypeRepository(new JobType());
        });

        $this->app->bind(JobSkillInterface::class, function () {
            return new JobSkillRepository(new JobSkill());
        });

        $this->app->bind(JobShiftInterface::class, function () {
            return new JobShiftRepository(new JobShift());
        });

        $this->app->bind(JobExperienceInterface::class, function () {
            return new JobExperienceRepository(new JobExperience());
        });

        $this->app->bind(LanguageLevelInterface::class, function () {
            return new LanguageLevelRepository(new LanguageLevel());
        });

        $this->app->bind(CareerLevelInterface::class, function () {
            return new CareerLevelRepository(new CareerLevel());
        });

        $this->app->bind(FunctionalAreaInterface::class, function () {
            return new FunctionalAreaRepository(new FunctionalArea());
        });

        $this->app->bind(CategoryInterface::class, function () {
            return new CategoryRepository(new Category());
        });

        $this->app->bind(DegreeTypeInterface::class, function () {
            return new DegreeTypeRepository(new DegreeType());
        });

        $this->app->bind(DegreeLevelInterface::class, function () {
            return new DegreeLevelRepository(new DegreeLevel());
        });

        $this->app->bind(CurrencyInterface::class, function () {
            return new CurrencyRepository(new Currency());
        });

        $this->app->singleton(JobApplicationInterface::class, function () {
            return new JobApplicationRepository(new JobApplication());
        });

        $this->app->singleton(AnalyticsInterface::class, function () {
            return new AnalyticsRepository(new Analytics());
        });

        $this->app->bind(TagInterface::class, function () {
            return new TagRepository(new Tag());
        });

        $this->app->bind(InvoiceInterface::class, function () {
            return new InvoiceRepository(new Invoice());
        });

        $this->app->bind(ReviewInterface::class, function () {
            return new ReviewRepository(new Review());
        });

        $this->app->bind(CustomFieldInterface::class, function () {
            return new CustomFieldRepository(new CustomField());
        });

        $this->app->bind(AccountInterface::class, function () {
            return new AccountRepository(new Account());
        });

        $this->app->bind(AccountActivityLogInterface::class, function () {
            return new AccountActivityLogRepository(new AccountActivityLog());
        });

        $this->app->bind(PackageInterface::class, function () {
            return new PackageRepository(new Package());
        });

        $this->app->bind(CompanyInterface::class, function () {
            return new CompanyRepository(new Company());
        });

        $this->app->singleton(TransactionInterface::class, function () {
            return new TransactionRepository(new Transaction());
        });

        config([
            'auth.guards.account' => [
                'driver' => 'session',
                'provider' => 'accounts',
            ],
            'auth.providers.accounts' => [
                'driver' => 'eloquent',
                'model' => Account::class,
            ],
            'auth.passwords.accounts' => [
                'provider' => 'accounts',
                'table' => 'jb_account_password_resets',
                'expire' => 60,
            ],
        ]);

        $loader = AliasLoader::getInstance();
        $loader->alias('JobBoardHelper', JobBoardHelper::class);

        Helper::autoload(__DIR__ . '/../../helpers');
    }

    public function boot(): void
    {
        SlugHelper::registerModule(Job::class, 'Jobs');
        SlugHelper::registerModule(Category::class, 'Job Categories');
        SlugHelper::registerModule(Company::class, 'Companies');
        SlugHelper::registerModule(Account::class, 'Candidates');
        SlugHelper::registerModule(Tag::class, 'Job Tags');

        SlugHelper::setPrefix(Job::class, 'jobs');
        SlugHelper::setPrefix(Category::class, 'job-categories');
        SlugHelper::setPrefix(Company::class, 'companies');
        SlugHelper::setPrefix(Account::class, 'candidates');
        SlugHelper::setPrefix(Tag::class, 'job-tags');
        SlugHelper::setColumnUsedForSlugGenerator(Account::class, 'first_name');

        $this->setNamespace('plugins/job-board')
            ->loadAndPublishConfigurations(['permissions', 'email', 'assets', 'general'])
            ->loadMigrations()
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadRoutes(['web', 'api', 'account', 'public', 'review'])
            ->publishAssets();

        $this->app['events']->listen(RouteMatched::class, function () {
            dashboard_menu()
                ->registerItem([
                    'id' => 'cms-plugins-job-board-main',
                    'priority' => 4,
                    'parent_id' => null,
                    'name' => 'plugins/job-board::job-board.name',
                    'icon' => 'fas fa-briefcase',
                    'url' => route('jobs.index'),
                    'permissions' => ['jobs.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-job-board-jobs',
                    'priority' => 1,
                    'parent_id' => 'cms-plugins-job-board-main',
                    'name' => 'plugins/job-board::job.name',
                    'icon' => 'fas fa-briefcase',
                    'url' => route('jobs.index'),
                    'permissions' => ['jobs.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-job-board-reviews',
                    'priority' => 1,
                    'parent_id' => 'cms-plugins-job-board-main',
                    'name' => 'plugins/job-board::review.name',
                    'icon' => 'fa fa-comments',
                    'url' => route('reviews.index'),
                    'permissions' => ['reviews.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-job-board-application',
                    'priority' => 2,
                    'parent_id' => 'cms-plugins-job-board-main',
                    'name' => trans('plugins/job-board::job-application.name'),
                    'icon' => 'fas fa-file-pdf',
                    'url' => route('job-applications.index'),
                    'permissions' => ['job-applications.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-account',
                    'priority' => 3,
                    'parent_id' => 'cms-plugins-job-board-main',
                    'name' => 'plugins/job-board::account.name',
                    'icon' => 'fa fa-users',
                    'url' => route('accounts.index'),
                    'permissions' => ['accounts.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-package',
                    'priority' => 4,
                    'parent_id' => 'cms-plugins-job-board-main',
                    'name' => 'plugins/job-board::package.name',
                    'icon' => 'fas fa-money-check-alt',
                    'url' => route('packages.index'),
                    'permissions' => ['packages.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-company',
                    'priority' => 5,
                    'parent_id' => 'cms-plugins-job-board-main',
                    'name' => 'plugins/job-board::company.name',
                    'icon' => 'fas fa-user-tie',
                    'url' => route('companies.index'),
                    'permissions' => ['companies.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-invoice',
                    'priority' => 6,
                    'parent_id' => 'cms-plugins-job-board-main',
                    'name' => 'plugins/job-board::invoice.name',
                    'icon' => 'fas fa-book',
                    'url' => route('invoice.index'),
                    'permissions' => ['invoice.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-invoice-template',
                    'priority' => 998,
                    'parent_id' => 'cms-plugins-job-board-main',
                    'name' => 'plugins/job-board::invoice-template.name',
                    'icon' => 'fas fa-book',
                    'url' => route('invoice-template.index'),
                    'permissions' => ['invoice-template.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-job-board-settings',
                    'priority' => 999,
                    'parent_id' => 'cms-plugins-job-board-main',
                    'name' => 'plugins/job-board::job-board.settings',
                    'icon' => 'fas fa-cogs',
                    'url' => route('job-board.settings'),
                    'permissions' => ['job-board.settings'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-job-board-job-attributes',
                    'priority' => 4,
                    'parent_id' => null,
                    'name' => 'plugins/job-board::job-board.job-attributes',
                    'icon' => 'fas fa-briefcase',
                    'url' => null,
                    'permissions' => ['job-attributes.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-job-type',
                    'priority' => 1,
                    'parent_id' => 'cms-plugins-job-board-job-attributes',
                    'name' => 'plugins/job-board::job-type.name',
                    'icon' => null,
                    'url' => route('job-types.index'),
                    'permissions' => ['job-types.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-job-skill',
                    'priority' => 2,
                    'parent_id' => 'cms-plugins-job-board-job-attributes',
                    'name' => 'plugins/job-board::job-skill.name',
                    'icon' => null,
                    'url' => route('job-skills.index'),
                    'permissions' => ['job-skills.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-job-shift',
                    'priority' => 3,
                    'parent_id' => 'cms-plugins-job-board-job-attributes',
                    'name' => 'plugins/job-board::job-shift.name',
                    'icon' => null,
                    'url' => route('job-shifts.index'),
                    'permissions' => ['job-shifts.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-job-experience',
                    'priority' => 4,
                    'parent_id' => 'cms-plugins-job-board-job-attributes',
                    'name' => 'plugins/job-board::job-experience.name',
                    'icon' => null,
                    'url' => route('job-experiences.index'),
                    'permissions' => ['job-experiences.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-language-level',
                    'priority' => 5,
                    'parent_id' => 'cms-plugins-job-board-job-attributes',
                    'name' => 'plugins/job-board::language-level.name',
                    'icon' => null,
                    'url' => route('language-levels.index'),
                    'permissions' => ['language-levels.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-career-level',
                    'priority' => 6,
                    'parent_id' => 'cms-plugins-job-board-job-attributes',
                    'name' => 'plugins/job-board::career-level.name',
                    'icon' => null,
                    'url' => route('career-levels.index'),
                    'permissions' => ['career-levels.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-functional-area',
                    'priority' => 7,
                    'parent_id' => 'cms-plugins-job-board-job-attributes',
                    'name' => 'plugins/job-board::functional-area.name',
                    'icon' => null,
                    'url' => route('functional-areas.index'),
                    'permissions' => ['functional-areas.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-category',
                    'priority' => 9,
                    'parent_id' => 'cms-plugins-job-board-job-attributes',
                    'name' => 'plugins/job-board::job-category.name',
                    'icon' => null,
                    'url' => route('job-categories.index'),
                    'permissions' => ['job-categories.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-job-board-tag',
                    'priority' => 10,
                    'parent_id' => 'cms-plugins-job-board-job-attributes',
                    'name' => 'plugins/job-board::tag.name',
                    'icon' => null,
                    'url' => route('job-board.tag.index'),
                    'permissions' => ['job-board.tag.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-degree-level',
                    'priority' => 11,
                    'parent_id' => 'cms-plugins-job-board-job-attributes',
                    'name' => 'plugins/job-board::degree-level.name',
                    'icon' => null,
                    'url' => route('degree-levels.index'),
                    'permissions' => ['degree-levels.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-degree-type',
                    'priority' => 12,
                    'parent_id' => 'cms-plugins-job-board-job-attributes',
                    'name' => 'plugins/job-board::degree-type.name',
                    'icon' => null,
                    'url' => route('degree-types.index'),
                    'permissions' => ['degree-types.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-job-board-custom-fields',
                    'priority' => 13,
                    'parent_id' => 'cms-plugins-job-board-main',
                    'name' => 'plugins/job-board::custom-fields.name',
                    'icon' => 'fas fa-filter',
                    'url' => route('job-board.custom-fields.index'),
                    'permissions' => ['job-board.custom-fields.index'],
                ]);

            add_filter(IS_IN_ADMIN_FILTER, [$this, 'setInAdmin'], 128);

            $router = $this->app['router'];

            $router->aliasMiddleware('account', RedirectIfNotAccount::class);
            $router->aliasMiddleware('account.guest', RedirectIfAccount::class);
            $router->aliasMiddleware('enable-credits', EnabledCreditsSystem::class);
        });

        $this->app->register(CommandServiceProvider::class);

        SiteMapManager::registerKey([
            'job-categories',
            'job-tags',
            'jobs-((?:19|20|21|22)\d{2})-(0?[1-9]|1[012])',
        ]);

        if (class_exists('ApiHelper') && ApiHelper::enabled()) {
            ApiHelper::setConfig([
                'model' => Account::class,
                'guard' => 'account',
                'password_broker' => 'accounts',
                'verify_email' => setting('verify_account_email', 0),
            ]);
        }

        if (File::exists(storage_path('app/invoices/template.blade.php'))) {
            $this->loadViewsFrom(storage_path('app/invoices'), 'plugins/job-board/invoice');
        }

        if (defined('LANGUAGE_MODULE_SCREEN_NAME') && defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
            $this->loadRoutes(['language-advanced']);

            LanguageAdvancedManager::registerModule(Job::class, [
                'name',
                'description',
                'content',
            ]);

            LanguageAdvancedManager::registerModule(CareerLevel::class, [
                'name',
            ]);

            LanguageAdvancedManager::registerModule(Category::class, [
                'name',
                'description',
            ]);

            LanguageAdvancedManager::registerModule(DegreeLevel::class, [
                'name',
            ]);

            LanguageAdvancedManager::registerModule(DegreeType::class, [
                'name',
            ]);

            LanguageAdvancedManager::registerModule(FunctionalArea::class, [
                'name',
            ]);

            LanguageAdvancedManager::registerModule(JobExperience::class, [
                'name',
            ]);

            LanguageAdvancedManager::registerModule(JobShift::class, [
                'name',
            ]);

            LanguageAdvancedManager::registerModule(JobSkill::class, [
                'name',
            ]);

            LanguageAdvancedManager::registerModule(JobType::class, [
                'name',
            ]);

            LanguageAdvancedManager::registerModule(LanguageLevel::class, [
                'name',
            ]);

            LanguageAdvancedManager::registerModule(Package::class, [
                'name',
            ]);

            LanguageAdvancedManager::registerModule(Tag::class, [
                'name',
            ]);

            LanguageAdvancedManager::registerModule(Package::class, [
                'name',
            ]);

            LanguageAdvancedManager::registerModule(CustomField::class, [
                'name',
                'type',
            ]);

            LanguageAdvancedManager::registerModule(CustomFieldOption::class, [
                'label',
                'value',
            ]);

            LanguageAdvancedManager::registerModule(CustomFieldValue::class, [
                'name',
                'value',
            ]);

            LanguageAdvancedManager::addTranslatableMetaBox('custom_fields_box');

            add_action(LANGUAGE_ADVANCED_ACTION_SAVED, function ($data, $request) {
                switch (get_class($data)) {
                    case Job::class:
                        $options = $request->input('custom_fields', []) ?: [];

                        if (! $options) {
                            return;
                        }

                        foreach ($options as $value) {
                            $newRequest = new Request();

                            $newRequest->replace([
                                'language' => $request->input('language'),
                                'ref_lang' => $request->input('ref_lang'),
                            ]);

                            if (! $value['id']) {
                                continue;
                            }

                            $optionValue = CustomFieldValue::find($value['id']);

                            if ($optionValue) {
                                $newRequest->merge([
                                    'name' => $value['name'],
                                    'value' => $value['value'],
                                ]);

                                LanguageAdvancedManager::save($optionValue, $newRequest);
                            }
                        }

                        break;
                    case CustomField::class:

                        $customFieldOptions = $request->input('options', []) ?: [];

                        if (! $customFieldOptions) {
                            return;
                        }

                        $newRequest = new Request();

                        $newRequest->replace([
                            'language' => $request->input('language'),
                            'ref_lang' => $request->input('ref_lang'),
                        ]);

                        foreach ($customFieldOptions as $option) {
                            if (! $option['id']) {
                                continue;
                            }

                            $customFieldOption = CustomFieldOption::find($option['id']);

                            if ($customFieldOption) {
                                $newRequest->merge([
                                    'label' => $option['label'],
                                    'value' => $option['value'],
                                ]);

                                LanguageAdvancedManager::save($customFieldOption, $newRequest);
                            }
                        }

                        break;
                }
            }, 1234, 2);
        }

        if (is_plugin_active('location')) {
            Location::registerModule(Job::class);
            Location::registerModule(Company::class);
            Location::registerModule(Account::class);
        } else {
            MacroableModels::addMacro(Job::class, 'getFullAddressAttribute', function () {
                /**
                 * @var BaseModel $this
                 */
                return $this->address;
            });

            MacroableModels::addMacro(Company::class, 'getFullAddressAttribute', function () {
                /**
                 * @var BaseModel $this
                 */
                return $this->address;
            });
        }

        $this->app->booted(function () {
            SeoHelper::registerModule([Job::class, Category::class, Company::class, Account::class]);

            $this->app->make(Schedule::class)->command(RenewJobsCommand::class)->dailyAt('23:30');
            $this->app->make(Schedule::class)->command(CheckExpiredJobsSoonCommand::class)->dailyAt('23:30');

            EmailHandler::addTemplateSettings(JOB_BOARD_MODULE_SCREEN_NAME, config('plugins.job-board.email'));

            if (defined('SOCIAL_LOGIN_MODULE_SCREEN_NAME') && Route::has('public.account.login')) {
                SocialService::registerModule([
                    'guard' => 'account',
                    'model' => Account::class,
                    'login_url' => route('public.account.login'),
                    'redirect_url' => route('public.account.dashboard'),
                ]);
            }

            $this->app->register(EventServiceProvider::class);
            $this->app->register(HookServiceProvider::class);
        });

        Form::component('customEditor', JobBoardHelper::viewPath('dashboard.forms.partials.custom-editor'), [
            'name',
            'value' => null,
            'attributes' => [],
        ]);

        Form::component('customImage', JobBoardHelper::viewPath('dashboard.forms.partials.custom-image'), [
            'name',
            'value' => null,
            'attributes' => [],
        ]);

        Form::component('customImages', JobBoardHelper::viewPath('dashboard.forms.partials.custom-images'), [
            'name',
            'values' => null,
            'attributes' => [],
        ]);
    }

    public function setInAdmin(bool $isInAdmin): bool
    {
        $isInAdmin = in_array('account:' . AccountTypeEnum::EMPLOYER, Route::current()->middleware()) || $isInAdmin;

        if ($isInAdmin) {
            OptimizerHelper::disable();
        }

        return $isInAdmin;
    }
}
