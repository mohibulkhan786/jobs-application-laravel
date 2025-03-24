@php
    Theme::asset()->usePath()->add('leaflet-css', 'libs/leaflet/leaflet.css');
    Theme::asset()->container('footer')->usePath()->add('leaflet-js', 'libs/leaflet/leaflet.js');
    Theme::set('pageTitle', $job->name);
@endphp

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="card job-detail overflow-hidden">
                    @if(! $job->hide_company && $company->id)
                        <div>
                            @if ($company->cover_image)
                                <img src="{{ $company->cover_image_url }}" alt="cover" class="img-fluid">
                            @endif
                            <div class="job-details-company-profile" @style(['margin-top: 20px' => ! $company->cover_image])>
                                <img src="{{ $company->logo_thumb }}" alt="logo" width="55" class="img-fluid rounded-3 rounded-3">
                            </div>
                        </div>
                    @else
                        <div>
                            <img src="{{ RvMedia::getImageUrl(theme_option('default_company_cover_image'), null, false, RvMedia::getDefaultImage()) }}"
                                alt="cover" class="img-fluid">
                            @if ($companyLogo = theme_option('default_company_logo', theme_option('logo')))
                                <div class="job-details-company-profile">
                                    <img src="{{ RvMedia::getImageUrl($companyLogo) }}" alt="logo" width="55" class="img-fluid rounded-3 rounded-3">
                                </div>
                            @endif
                        </div>
                    @endif
                    <div class="card-body p-4">
                        <div>
                            <div class="row">
                                <div class="col-md-8">
                                    <p class="mb-1 h5">{{ $job->name }}</p>
                                    <ul class="list-inline text-muted mb-0">
                                        <li class="list-inline-item">
                                            <i class="mdi mdi-account"></i>&nbsp;
                                            <span>{{ __(':number Vacancy', ['number' => $job->number_of_positions])}}</span>
                                        </li>
                                        <li class="list-inline-item">
                                            <i class="mdi mdi-eye"></i>
                                            <span>{{ __(':view Views', ['view' => number_format($job->views)])}}</span>
                                        </li>
                                    </ul>
                                </div>
                                @if ($job->canShowSavedJob())
                                    <div class="col-lg-4">
                                        <ul class="list-inline mb-0 text-lg-end mt-3 mt-lg-0">
                                            <li class="list-inline-item @if ($job->is_saved) bookmark-post @endif">
                                                <div class="favorite-icon">
                                                    <a class="job-bookmark-action"
                                                        data-job-id="{{ $job->id }}"
                                                        href="{{ route('public.account.jobs.saved.action') }}">
                                                        <i class="uil uil-heart-alt"></i>
                                                    </a>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                @endif
                            </div>
                        </div>

                        <div class="mt-4">
                            <div class="row g-2">
                                @if ($job->jobExperience->name)
                                    <div class="col-lg-6">
                                        <div class="border rounded-start p-3">
                                            <p class="text-muted mb-0 fs-13">{{ __('Experience') }}</p>
                                            <p class="fw-medium fs-15 mb-0">{{ $job->jobExperience->name }}</p>
                                        </div>
                                    </div>
                                @endif
                                @if ($job->jobTypes->isNotEmpty())
                                    <div class="col-lg-6">
                                        <div class="border p-3">
                                            <p class="text-muted fs-13 mb-0">{{ __('Employee type') }}</p>
                                            @foreach($job->jobTypes as $jobType)
                                                <span class="fw-medium mb-0">{{ $jobType->name }}@if (!$loop->last), @endif</span>
                                            @endforeach
                                        </div>
                                    </div>
                                @endif
                                @if ($job->careerLevel->name)
                                    <div class="col-lg-6">
                                        <div class="border p-3">
                                            <p class="text-muted fs-13 mb-0">{{ __('Position') }}</p>
                                            <p class="fw-medium mb-0">{{ $job->careerLevel->name }}</p>
                                        </div>
                                    </div>
                                @endif
                                @if ($job->salary_text)
                                    <div class="col-lg-6">
                                        <div class="border rounded-end p-3">
                                            <p class="text-muted fs-13 mb-0">{{ __('Offer Salary') }}</p>
                                            <p class="fw-medium mb-0">{{ $job->salary_text }}</p>
                                        </div>
                                    </div>
                                @endif

                                @foreach($job->customFields as $customField)
                                    <div class="col-lg-6">
                                        <div class="border rounded-end p-3">
                                            <p class="text-muted fs-13 mb-0">{!! BaseHelper::clean($customField->name) !!}</p>
                                            <p class="fw-medium mb-0">{!! BaseHelper::clean($customField->value) !!}</p>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>

                        <div class="mt-4">
                            <h5 class="mb-3">{{ __('Job Description') }}</h5>
                            <div class="job-detail-desc">
                                <p class="text-muted mb-0">
                                    {{ $job->description }}
                                </p>
                            </div>
                        </div>

                        <div class="mt-4 job-detail-content">
                            {!! BaseHelper::clean($job->content) !!}
                        </div>

                        @if ($job->skills->isNotEmpty())
                            <div class="mt-4">
                                <h5 class="mb-3">{{ __('Skills') }}</h5>
                                <div class="job-details-desc">
                                    <div class="mt-4">
                                        @foreach ($job->skills as $skill)
                                            <span class="badge bg-primary me-1">{{ $skill->name }}</span>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        @endif

                        @if ($job->tags->isNotEmpty())
                            <div class="mt-4">
                                <h5 class="mb-3">{{ __('Tags') }}</h5>
                                <div class="job-details-desc">
                                    <div class="mt-4">
                                        @foreach ($job->tags as $tag)
                                            <a href="{{ $tag->url }}"><span class="badge bg-info me-1">{{ $tag->name }}</span></a>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        @endif

                        @include(Theme::getThemeNamespace('views.job-board.partials.share'), ['job' => $job])
                    </div>
                </div>

                @if (!$job->hide_company && $companyJobs->isNotEmpty())
                    <div class="mt-4">
                        <h5>{{ __('Related Jobs') }}</h5>
                        @foreach ($companyJobs as $companyJob)
                            @include(Theme::getThemeNamespace('views.job-board.partials.job-item'), ['job' => $companyJob])
                        @endforeach
                    </div>
                    <div class="text-center mt-4">
                        <a href="{{ $company->url }}" class="primary-link form-text">
                            <span>{{ __('View More') }}</span>
                            <i class="mdi mdi-arrow-right"></i>
                        </a>
                    </div>
                @endif

            </div>

            <div class="col-lg-4 mt-4 mt-lg-0">
                <div class="side-bar ms-lg-4">
                    <div class="card job-overview">
                        <div class="card-body p-4">
                            <h2 class="fs-17 h6">{{ __('Job Overview') }}</h2>
                            <ul class="list-unstyled mt-4 mb-0">
                                @if ($job->jobExperience->name)
                                    <li>
                                        <div class="d-flex mt-4">
                                            <i class="uil uil-star-half-alt icon bg-soft-primary"></i>
                                            <div class="ms-3">
                                                <h3 class="fs-14 mb-2 h6">{{ __('Experience') }}</h3>
                                                <p class="text-muted mb-0">{{ $job->jobExperience->name }}</p>
                                            </div>
                                        </div>
                                    </li>
                                @endif
                                @if ($job->full_address)
                                    <li>
                                        <div class="d-flex mt-4">
                                            <i class="uil uil-location-point icon bg-soft-primary"></i>
                                            <div class="ms-3">
                                                <h3 class="fs-14 mb-2 h6">{{ __('Location') }}</h3>
                                                <p class="text-muted mb-0">{{ $job->full_address }}</p>
                                            </div>
                                        </div>
                                    </li>
                                @endif
                                <li>
                                    <div class="d-flex mt-4">
                                        <i class="uil uil-usd-circle icon bg-soft-primary"></i>
                                        <div class="ms-3">
                                            <h3 class="fs-14 mb-2 h6">{{ __('Offered Salary') }}</h3>
                                            <p class="text-muted mb-0">{{ $job->salary_text }}</p>
                                        </div>
                                    </div>
                                </li>
                                @if ($job->careerLevel->name)
                                    <li>
                                        <div class="d-flex mt-4">
                                            <i class="uil uil-graduation-cap icon bg-soft-primary"></i>
                                            <div class="ms-3">
                                                <h3 class="fs-14 mb-2 h6">{{ __('Qualification') }}</h3>
                                                <p class="text-muted mb-0">{{ $job->careerLevel->name }}</p>
                                            </div>
                                        </div>
                                    </li>
                                @endif
                                @if ($job->categories->isNotEmpty())
                                    <li>
                                        <div class="d-flex mt-4">
                                            <i class="uil uil-building icon bg-soft-primary"></i>
                                            <div class="ms-3">
                                                <h3 class="fs-14 mb-2 h6">{{ __('Industry') }}</h3>
                                                @foreach ($job->categories as $category)
                                                    <span class="text-muted mb-0">{{ $category->name }}@if (!$loop->last), @endif</span>
                                                @endforeach
                                            </div>
                                        </div>
                                    </li>
                                @endif
                                <li>
                                    <div class="d-flex mt-4">
                                        <i class="uil uil-history icon bg-soft-primary"></i>
                                        <div class="ms-3">
                                            <h3 class="fs-14 mb-2 h6">{{ __('Date Posted') }}</h3>
                                            <p class="text-muted mb-0">{{ $job->created_at->diffForHumans() }}</p>
                                        </div>
                                    </div>
                                </li>
                                @if ($job->application_closing_date)
                                    <li>
                                        <div class="d-flex mt-4">
                                            <i class="uil uil-clipboard-notes icon bg-soft-primary"></i>
                                            <div class="ms-3">
                                                <h3 class="fs-14 mb-2 h6">{{ __('Apply Before') }}</h3>
                                                <p class="mb-0 text-danger fw-semibold">{{ $job->application_closing_date->translatedFormat('d M, Y') }}</p>
                                            </div>
                                        </div>
                                    </li>
                                @endif
                            </ul>
                            @if ($job->canShowApplyJob())
                                <div class="mt-3">
                                    @if ($job->is_applied)
                                        <a href="{{ $job->url }}" class="btn btn-success btn-hover w-100 mt-2 disabled">
                                            <span>{{ __('Applied') }}</span>
                                            <i class="uil uil-check-circle"></i>
                                        </a>
                                    @elseif (!auth('account')->check() && !JobBoardHelper::isGuestApplyEnabled())
                                        <a href="{{ route('public.account.login') }}"
                                           class="btn btn-primary btn-hover w-100 mt-2">
                                            <span>{{ __('Apply Now') }}</span>
                                            <i class="uil uil-arrow-right"></i>
                                        </a>
                                    @else
                                        <a @if ($job->apply_url) href="#applyExternalJob" @else href="#applyNow" @endif data-bs-toggle="modal"
                                            class="btn btn-primary btn-hover w-100 mt-2"
                                            data-job-name="{{ $job->name }}" data-job-id="{{ $job->id }}">
                                            <span>{{ __('Apply Now') }}</span>
                                            <i class="uil uil-arrow-right"></i>
                                        </a>
                                    @endif
                                </div>
                            @elseif ($job->is_applied && !auth('account')->user()->isEmployer())
                                <div class="mt-3">
                                    <a href="#" class="btn btn-success btn-hover w-100 mt-2 disabled">
                                        <span>{{ __('Applied') }}</span>
                                        <i class="uil uil-check-circle"></i>
                                    </a>
                                </div>
                            @else
                                <div class="mt-3">
                                    <a href="#" class="btn btn-primary btn-hover w-100 mt-2 disabled">
                                        <span>{{ __('Apply Now') }}</span>
                                        <i class="uil uil-arrow-right"></i>
                                    </a>
                                </div>
                            @endif
                        </div>
                    </div>
                    @if (!$job->hide_company && $company->id)
                        <div class="card company-profile mt-4">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <img src="{{ $company->logo_thumb }}" alt="logo" width="55" class="img-fluid rounded-3">

                                    <div class="mt-4">
                                        <h3 class="fs-17 mb-1 h6">{{ $company->name }}</h3>
                                        @if ($company->year_founded)
                                            <p class="text-muted">{{ __('Since :since', ['since' => $company->year_founded]) }}</p>
                                        @endif
                                    </div>
                                </div>
                                <ul class="list-unstyled mt-4">
                                    @if ($company->phone)
                                        <li>
                                            <div class="d-flex">
                                                <i class="uil uil-phone-volume text-primary fs-4"></i>
                                                <div class="ms-3">
                                                    <h4 class="fs-14 mb-2 h6">{{ __('Phone') }}</h4>
                                                    <a href="tel:{{ $company->phone }}" class="text-muted fs-14 mb-0" dir="ltr">{{ $company->phone }}</a>
                                                </div>
                                            </div>
                                        </li>
                                    @endif
                                    @if (! JobBoardHelper::hideCompanyEmailEnabled() && $company->email)
                                        <li class="mt-3">
                                            <div class="d-flex">
                                                <i class="uil uil-envelope text-primary fs-4"></i>
                                                <div class="ms-3">
                                                    <h4 class="fs-14 mb-2 h6">{{ __('Email') }}</h4>
                                                    <p class="text-muted fs-14 mb-0">{{ $company->email }}</p>
                                                </div>
                                            </div>
                                        </li>
                                    @endif
                                    @if ($company->website)
                                        <li class="mt-3">
                                            <div class="d-flex">
                                                <i class="uil uil-globe text-primary fs-4"></i>
                                                <div class="ms-3">
                                                    <h4 class="fs-14 mb-2 h6">{{ __('Website') }}</h4>
                                                    <a class="text-muted fs-14 text-break mb-0" href="{{ $company->website }}" target="_blank" rel="nofollow">{{ $company->website }}</a>
                                                </div>
                                            </div>
                                        </li>
                                    @endif
                                    @if ($company->full_address)
                                        <li class="mt-3">
                                            <div class="d-flex">
                                                <i class="uil uil-map-marker text-primary fs-4"></i>
                                                <div class="ms-3">
                                                    <h4 class="fs-14 mb-2 h6">{{ __('Location') }}</h4>
                                                    <p class="text-muted fs-14 mb-0">&nbsp;{{ $company->full_address }}</p>
                                                </div>
                                            </div>
                                        </li>
                                    @endif
                                </ul>
                                <div class="mt-4">
                                    <a href="{{ $company->url }}" class="btn btn-primary btn-hover w-100 rounded">
                                        <i class="mdi mdi-eye"></i>
                                        <span>&nbsp;{{ __('View Profile') }}</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    @endif

                    @if ($job->latitude && $job->longitude)
                        <div class="mt-4">
                            <h3 class="fs-16 mb-3 h6">{{ __('Job location') }}</h3>
                            <div class="job-board-street-map-container">
                                <div class="job-board-street-map"
                                    data-popup-id="#street-map-popup-template"
                                    data-center="{{ json_encode([$job->latitude, $job->longitude]) }}"
                                    data-zoom="15"
                                    data-map-icon="{{ $job->salary_text }}"></div>
                            </div>
                            <div class="d-none" id="street-map-popup-template">
                                <div>
                                    <table width="100%">
                                        <tr>
                                            <td width="40">
                                                <div >
                                                    <img src="{{ $job->company_logo_thumb }}" width="40" alt="{{ $job->company_name ?: $job->name }}">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="infomarker">
                                                    @if ($job->has_company)
                                                        <h5>
                                                            <a href="{{ $company->url }}" target="_blank">{{ $company->name }}</a>
                                                        </h5>
                                                    @endif
                                                    <div class="text-info">
                                                        <strong>{{ $job->name }}</strong>
                                                    </div>
                                                    <div class="text-info">
                                                        <i class="mdi mdi-account"></i>&nbsp;
                                                        <span>{{ __(':number Vacancy', ['number' => $job->number_of_positions])}}</span>
                                                        @if ($job->jobTypes->isNotEmpty())
                                                            <span>-</span>
                                                            @foreach($job->jobTypes as $jobType)
                                                                <span>{{ $jobType->name }}@if (!$loop->last), @endif</span>
                                                            @endforeach
                                                        @endif
                                                    </div>
                                                    @if ($job->full_address)
                                                        <div class="text-muted">
                                                            <i class="uil uil-map"></i>
                                                            &nbsp;<span>{{ $job->full_address }}</span>
                                                        </div>
                                                    @endif
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</section>
