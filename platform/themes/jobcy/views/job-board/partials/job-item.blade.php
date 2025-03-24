<div class="job-box @if ($job->is_saved) bookmark-post @endif card mt-4"
    data-latitude="{{ $job->latitude }}"
    data-longitude="{{ $job->longitude }}"
    data-company_logo_thumb="{{ $job->company->logo_thumb }}"
    data-company_name="{{ $job->company_name ?: $job->name }}"
    data-map_icon="{{ $job->salary_text }}"
    data-job_name="{{ $job->name }}"
    data-company_url="{{ $job->company_url }}"
    data-job_types="{{ json_encode($job->jobTypes->toArray()) }}"
    data-number_of_positions="{{ $job->number_of_positions }}"
    data-full_address="{{ $job->full_address }}">
    @if ($job->canShowSavedJob())
        <div class="bookmark-label text-center">
            <a class="job-bookmark-action align-middle text-white"
                data-job-id="{{ $job->id }}"
                href="{{ route('public.account.jobs.saved.action') }}">
                <i class="mdi mdi-star"></i>
            </a>
        </div>
    @endif
    @if ($job->is_featured)
        <div class="featured-label">
            <span class="featured">{{ __('featured') }}</span>
        </div>
    @endif
    <div class="p-4 position-relative">
        @if ($job->applicants_count)
            <div class="job-applied-count"><i class="mdi mdi-fire text-danger"></i> <small class="fw-medium">{{ __(':count application(s)', ['count' => $job->applicants_count]) }}</small></div>
        @endif

        <div class="row align-items-center g-lg-3 g-md-2 cursor-pointer" data-toggle="clickable" data-url="{{ $job->url }}">
            <div class="col-md-2">
                <div class="text-center mb-4 mb-md-0">
                    <a href="{{ $job->company_url ?: 'javascript:void(0);' }}">
                        <img src="{{ $job->company_logo_thumb }}" alt="{{ $job->company_name ?: $job->name }}"
                            width="55" class="img-fluid rounded-3">
                    </a>
                </div>
            </div>
            <!--end col-->
            <div class="col-md-3">
                <div class="mb-2 mb-md-0">
                    <h3 class="fs-18 mb-1 h5">
                        <a href="{{ $job->url }}" class="text-dark">{{ $job->name }}</a>
                    </h3>
                    @if ($job->has_company)
                        <p class="text-muted fs-14 mb-0">{{ $job->company->name }}</p>
                    @endif
                </div>
            </div>
            <!--end col-->
            <div class="col-md-3">
                @if ($job->location)
                    <div class="d-flex mb-2">
                        <div class="d-flex mb-2">
                            <div class="flex-shrink-0">
                                <i class="mdi mdi-map-marker text-primary me-1"></i>
                            </div>
                            <p class="text-muted mb-0">
                                {{ $job->location }}
                            </p>
                        </div>
                    </div>
                @endif

                {!! apply_filters('job-item-extra-data', null, $job) !!}
            </div>
            <!--end col-->
            <div class="col-md-2">
                <div>
                    <p class="text-muted mb-2">
                        <span class="text-primary">{{ $job->salary_text }}</span>
                    </p>
                </div>
            </div>
            <!--end col-->
            @if ($job->jobTypes->isNotEmpty())
                <div class="col-md-2">
                    <div class="text-md-end">
                        @foreach($job->jobTypes as $jobType)
                            <span class="badge bg-soft-danger fs-13 mt-1 text-wrap text-break">{{ $jobType->name }}@if (!$loop->last), @endif</span>
                        @endforeach
                    </div>
                </div>
            @endif
            <!--end col-->
        </div>
        <!--end row-->
    </div>
    <div class="p-3 bg-light">
        <div class="row">
            <div class="col-md-10">
                <div class="d-flex">
                    <div class="text-muted mb-0">
                        <span class="text-dark">{{ __('Published') }}: </span>
                        <span>{{ $job->created_at->diffForHumans() }}</span>
                    </div>
                    @if($job->tags->isNotEmpty())
                        <div class="ms-4">
                            @foreach($job->tags->take(5) as $tag)
                                <a href="{{ $tag->url }}">
                                    <span class="badge bg-white text-dark border me-1">{{ $tag->name }}</span>
                                </a>
                            @endforeach
                        </div>
                    @endif
                </div>
            </div>
            <!--end col-->
            <div class="col-lg-2 col-md-3">
                @if ($job->canShowApplyJob())
                    <div class="text-start text-md-end">
                        @if ($job->is_applied)
                            <a href="{{ $job->url }}" class="primary-link text-success">
                                <span>{{ __('Applied') }}</span>
                                <i class="uil uil-check-circle"></i>
                            </a>
                        @else
                            @if ($job->apply_url)
                                <a href="#applyExternalJob" data-bs-toggle="modal" class="primary-link" data-job-name="{{ $job->name }}" data-job-id="{{ $job->id }}">
                                    <span>{{ __('Apply Now') }}</span>
                                    <i class="mdi mdi-chevron-double-right"></i>
                                </a>
                            @elseif (!auth('account')->check() && !JobBoardHelper::isGuestApplyEnabled())
                                <a href="{{ route('public.account.login') }}"
                                   class="primary-link">
                                    <span>{{ __('Apply Now') }}</span>
                                    <i class="mdi mdi-chevron-double-right"></i>
                                </a>
                            @else
                                <a href="#applyNow" data-bs-toggle="modal" class="primary-link" data-job-name="{{ $job->name }}" data-job-id="{{ $job->id }}">
                                    <span>{{ __('Apply Now') }}</span>
                                    <i class="mdi mdi-chevron-double-right"></i>
                                </a>
                            @endif
                        @endif
                    </div>
                @endif
            </div>
            <!--end col-->
        </div>
        <!--end row-->
    </div>
</div>
