<!-- START BOOKMARKS -->
<section class="section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <div>
                    <h6 class="fs-16 mb-0">{{ SeoHelper::getTitle() }}</h6>
                </div>
            </div><!--end col-->
            <div class="col-lg-6">
                <form action="{{ URL::current() }}" method="GET">
                    <div class="candidate-list-widgets">
                        <div class="row justify-content-end">
                            <div class="col-lg-5">
                                <div class="selection-widget mt-3 mt-lg-0">
                                    <select class="form-select" data-trigger name="order_by" id="choices-single-filter-order_by" aria-label="Default select example">
                                        <option value="default">{{ __('Default') }}</option>
                                        @foreach(JobBoardHelper::getSortByParams() as $key => $label)
                                            <option value="{{ $key }}" @selected(request()->input('order_by') == $key)>{{ $label }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div><!--end col-->
                            <div class="col-lg-2">
                                <button class="btn btn-outline-primary w-100">
                                    <i class="uil uil-search"></i>
                                </button>
                            </div>
                        </div><!--end row-->
                    </div><!--end candidate-list-widgets-->
                </form>

            </div><!--end col-->
        </div><!--end row-->
        <div class="row">
            <div class="col-lg-12">
                @forelse ($applications as $application)
                    <div class="job-box card mt-4">
                        <div class="card-body p-4">
                            <div class="row">
                                <div class="col-lg-1">
                                    @if ($application->job->hide_company)
                                        @if (theme_option('logo'))
                                            <img src="{{ RvMedia::getImageUrl(theme_option('logo')) }}" width="55"
                                                alt="{{ theme_option('site_title') }}" class="logo-dark" />
                                        @endif
                                    @else
                                        <a href="{{ $application->job->company->url }}">
                                            <img src="{{ $application->job->company->logo_thumb }}" alt="{{ $application->job->company->name }}"
                                                width="55" class="img-fluid rounded-3">
                                        </a>
                                    @endif
                                </div><!--end col-->
                                <div class="col-lg-9">
                                    <div class="mt-3 mt-lg-0">
                                        <h5 class="fs-17 mb-1">
                                            @if ($application->job_url)
                                                <a href="{{ $application->job_url }}" class="text-dark">{{ $application->job->name }}</a>
                                            @else
                                                <span class="text-decoration-line-through">{{ $application->job->name }}</span>
                                            @endif
                                            <small class="text-muted fw-normal">({{ $application->job->jobExperience->name }})</small>
                                        </h5>
                                        <ul class="list-inline mb-0">
                                            @if (!$application->job->hide_company)
                                                <li class="list-inline-item">
                                                    <p class="text-muted fs-14 mb-0">{{ $application->job->company->name }}</p>
                                                </li>
                                            @endif
                                            <li class="list-inline-item">
                                                <p class="text-muted fs-14 mb-0">
                                                    <i class="mdi mdi-map-marker"></i>
                                                    <span>{{ $application->job->full_address }}</span>
                                                </p>
                                            </li>
                                            <li class="list-inline-item">
                                                <p class="text-muted fs-14 mb-0">
                                                    <i class="uil uil-wallet"></i>
                                                    <span>{{ $application->job->salary_text }}</span>
                                                </p>
                                            </li>
                                        </ul>
                                        @if ($application->job->jobTypes->isNotEmpty())
                                            <div class="mt-2">
                                                @foreach($application->job->jobTypes as $jobType)
                                                    <span class="badge bg-soft-danger mt-1">{{ $jobType->name }}@if (!$loop->last), @endif</span>
                                                @endforeach
                                            </div>
                                        @endif
                                    </div>
                                </div><!--end col-->
                                <div class="col-lg-2 align-self-center">
                                    <ul class="list-inline mt-3 mb-0">
                                        <li class="list-inline-item" data-bs-toggle="tooltip" data-bs-placement="top" title="{{ __('View Detail') }}">
                                            @if ($application->job_url)
                                                <a href="{{ $application->job_url }}" class="avatar-sm bg-soft-success d-inline-block text-center rounded-circle fs-18">
                                                    <i class="mdi mdi-eye"></i>
                                                </a>
                                            @else
                                                <span class="avatar-sm bg-soft-secondary d-inline-block text-center rounded-circle fs-18">
                                                    <i class="mdi mdi-eye"></i>
                                                </span>
                                            @endif
                                        </li>
                                    </ul>
                                </div>
                            </div><!--end row-->
                        </div>
                    </div><!--end job-box-->
                @empty
                    <div class="alert alert-warning my-2">
                        {{ __('No applied jobs found.') }}
                    </div>
                @endforelse
            </div><!--end col-->
        </div><!--end row-->

        <div class="row">
            <div class="col-lg-12 mt-4 pt-2">
                {!! $applications->withQueryString()->links(Theme::getThemeNamespace('partials.pagination')) !!}
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section>
<!-- START BOOKMARKS -->
