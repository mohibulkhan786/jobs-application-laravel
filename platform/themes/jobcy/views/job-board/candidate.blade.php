@php
    Theme::set('pageTitle', $candidate->name);
@endphp
<!-- START CANDIDATE-DETAILS -->
<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="card side-bar">
                    <div class="card-body p-4">
                        <div class="candidate-profile text-center">
                            <img src="{{ $candidate->avatar_url }}" alt="{{ $candidate->name }}" class="avatar-lg rounded-circle">
                            <h6 class="fs-18 mb-0 mt-4">{{ $candidate->name }}</h6>
                            <p class="text-muted mb-4">{!! BaseHelper::clean($candidate->description) !!}</p>
                        </div>
                    </div><!--end candidate-profile-->

                    <div class="candidate-profile-overview  card-body border-top p-4">
                        <h6 class="fs-17 fw-semibold mb-3">{{ __('Profile Overview') }}</h6>
                        <ul class="list-unstyled mb-0">
                            <li>
                                <div class="d-flex">
                                    <label class="text-dark">{{ __('Views') }}:</label>
                                    <div>
                                        <p class="text-muted mb-0">{{ number_format($candidate->views) }}</p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <div class="mt-3">
                            @if ($candidate->phone)
                                <a href="tel:{{ $candidate->phone }}" class="btn btn-danger btn-hover w-100">
                                    <i class="uil uil-phone"></i>&nbsp;
                                    <span>{{ __('Contact Me') }}</span>
                                </a>
                            @endif
                                @if(! $candidate->hide_cv && $candidate->resume)
                                <a href="{{ $candidate->resumeDownloadUrl }}" class="btn btn-primary btn-hover w-100 mt-2">
                                    <i class="uil uil-import"></i>&nbsp;
                                    <span>{{ __('Download CV') }}</span>
                                </a>
                            @endif
                        </div>
                    </div><!--candidate-profile-overview-->
                    <div class="candidate-contact-details card-body p-4 border-top">
                        <h6 class="fs-17 fw-semibold mb-3">{{ __('Contact Details') }}</h6>
                        <ul class="list-unstyled mb-0">
                            <li>
                                <div class="d-flex align-items-center mt-4">
                                    <div class="icon bg-soft-primary flex-shrink-0">
                                        <i class="uil uil-envelope-alt"></i>
                                    </div>
                                    <div class="ms-3">
                                        <h6 class="fs-14 mb-1">{{ __('Email') }}</h6>
                                        <p class="text-muted mb-0">{{ $candidate->email }}</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="d-flex align-items-center mt-4">
                                    <div class="icon bg-soft-primary flex-shrink-0">
                                        <i class="uil uil-map-marker"></i>
                                    </div>
                                    <div class="ms-3">
                                        <h6 class="fs-14 mb-1">{{ __('Address') }}</h6>
                                        <p class="text-muted mb-0">{{ $candidate->address }}</p>
                                    </div>
                                </div>
                            </li>
                            @if ($candidate->phone)
                                <li>
                                    <div class="d-flex align-items-center mt-4">
                                        <div class="icon bg-soft-primary flex-shrink-0">
                                            <i class="uil uil-phone"></i>
                                        </div>
                                        <div class="ms-3">
                                            <h6 class="fs-14 mb-1">{{ __('Phone') }}</h6>
                                            <p class="text-muted mb-0">{{ $candidate->phone }}</p>
                                        </div>
                                    </div>
                                </li>
                            @endif
                        </ul>
                    </div><!--end candidate-overview-->
                </div><!--end card-->
            </div><!--end col-->

            <div class="col-lg-8">
                <div class="card candidate-details ms-lg-4 mt-4 mt-lg-0">
                    <div class="card-body p-4 candidate-personal-detail">
                        <div>
                            <h6 class="fs-17 fw-semibold mb-3">{{ __('About Me') }}</h6>
                            {!! BaseHelper::clean($candidate->bio) !!}

                            @if($countEducation = $educations->count())
                                <div class="candidate-education-details mt-4 pt-3">
                                    <h4 class="fs-17 fw-bold mb-0">{{ __('Education') }}</h4>
                                    @foreach($educations as $education)
                                        <div class="candidate-education-content mt-4 d-flex">
                                            <div class="circle flex-shrink-0 bg-soft-primary">{{ $education->specialized ? strtoupper(substr($education->specialized, 0, 1)) : 'E' }}</div>
                                            <div class="ms-4">
                                                @if ($education->specialized)
                                                    <h6 class="fs-16 mb-1">{{ $education->specialized }}</h6>
                                                @endif
                                                <p class="mb-2 text-muted">{{ $education->school }} -
                                                    ({{  $education->started_at->format('Y') }} -
                                                    {{ $education->ended_at ? $education->ended_at->format('Y'): __('Now') }})
                                                </p>
                                                <p class="text-muted">{!! BaseHelper::clean($education->description) !!}</p>
                                            </div>
                                            @if ($countEducation > 1 && ! $loop->last)
                                                <span class="line"></span>
                                            @endif
                                        </div>
                                    @endforeach
                                </div>
                            @endif

                            @if($countExperience = $experiences->count())
                                <div class="candidate-education-details mt-4 pt-3">
                                    <h4 class="fs-17 fw-bold mb-0">{{ __('Experience') }}</h4>
                                    @foreach( $experiences as $experience)
                                        <div class="candidate-education-content mt-4 d-flex">
                                            <div class="circle flex-shrink-0 bg-soft-primary"> {{ $experience->position ? strtoupper(substr($experience->position, 0, 1)) : '' }} </div>
                                            <div class="ms-4">
                                                @if ($experience->position)
                                                    <h6 class="fs-16 mb-1">{{ $experience->position }}</h6>
                                                @endif
                                                <p class="mb-2 text-muted">{{ $experience->company }} -
                                                    ({{  $experience->started_at->format('Y') }} -
                                                    {{ $experience->ended_at ? $experience->ended_at->format('Y'): __('Now')}})
                                                </p>
                                                <p class="text-muted">{!! BaseHelper::clean($experience->description) !!}</p>
                                            </div>
                                            @if ($countExperience > 1 && ! $loop->last)
                                                <span class="line"></span>
                                            @endif
                                        </div>
                                    @endforeach
                                </div>
                            @endif
                        </div>
                    </div><!--end card-body-->
                </div><!--end card-->
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section>
<!-- END CANDIDATE-DETAILS -->
