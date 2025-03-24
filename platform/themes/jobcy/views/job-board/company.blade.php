@php
    Theme::asset()->usePath()->add('leaflet-css', 'libs/leaflet/leaflet.css');
    Theme::asset()->container('footer')->usePath()->add('leaflet-js', 'libs/leaflet/leaflet.js');
    Theme::asset()->usePath()->add('jquery-bar-rating', 'libs/jquery-bar-rating/themes/css-stars.css');
    Theme::asset()->container('footer')->usePath()->add('jquery-bar-rating-js', 'libs/jquery-bar-rating/jquery.barrating.min.js');
    Theme::set('pageTitle', $company->name);
@endphp

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="card side-bar">
                    <div class="card-body p-4">
                        <div class="candidate-profile text-center">
                            <img src="{{ $company->logo_thumb }}" alt="logo" class="avatar-lg rounded-circle">
                            <h6 class="fs-18 mb-1 mt-4">{{ $company->name }}</h6>
                            <p class="text-muted mb-4">{{ __('Since :since', ['since' => $company->year_founded]) }}</p>
                            <ul class="candidate-detail-social-menu list-inline mb-0">
                                @if ($company->facebook)
                                    <li class="list-inline-item">
                                        <a href="{{ $company->facebook }}" class="social-link">
                                            <i class="uil uil-facebook"></i>
                                        </a>
                                    </li>
                                @endif
                                @if ($company->twitter)
                                    <li class="list-inline-item">
                                        <a href="{{ $company->twitter }}" class="social-link">
                                            <i class="uil uil-twitter-alt"></i>
                                        </a>
                                    </li>
                                @endif
                                @if ($company->linkedin)
                                    <li class="list-inline-item">
                                        <a href="{{ $company->linkedin }}" class="social-link">
                                            <i class="uil uil-linkedin"></i>
                                        </a>
                                    </li>
                                @endif
                                @if ($company->instagram)
                                    <li class="list-inline-item">
                                        <a href="{{ $company->instagram }}" class="social-link">
                                            <i class="uil uil-instagram"></i>
                                        </a>
                                    </li>
                                @endif
                                @if ($company->phone)
                                    <li class="list-inline-item">
                                        <a href="tel:{{ $company->phone }}" class="social-link">
                                            <i class="uil uil-phone-alt"></i>
                                        </a>
                                    </li>
                                @endif
                            </ul>
                        </div>
                    </div>

                    <div class="candidate-profile-overview  card-body border-top p-4">
                        <h6 class="fs-17 fw-medium mb-3">{{ __('Profile Overview') }}</h6>
                        <ul class="list-unstyled mb-0">
                            @if ($company->ceo)
                                <li>
                                    <div class="d-flex">
                                        <label class="text-dark">{{ __('Owner Name') }}</label>
                                        <div>
                                            <p class="text-muted mb-0">{{ $company->ceo }}</p>
                                        </div>
                                    </div>
                                </li>
                            @endif
                            @if ($company->number_of_employees)
                                <li>
                                    <div class="d-flex">
                                        <label class="text-dark">{{ __('Employees') }}</label>
                                        <div>
                                            <p class="text-muted mb-0">{{ $company->number_of_employees }}</p>
                                        </div>
                                    </div>
                                </li>
                            @endif
                            @if ($company->full_address)
                                <li>
                                    <div class="d-flex">
                                        <label class="text-dark">{{ __('Location') }}</label>
                                        <div>
                                            <p class="text-muted mb-0">{{ $company->full_address }}</p>
                                        </div>
                                    </div>
                                </li>
                            @endif
                            @if ($company->phone)
                                <li>
                                    <div class="d-flex">
                                        <label class="text-dark">{{ __('Phone') }}</label>
                                        <div>
                                            <p class="text-muted text-break mb-0">
                                                <a href="tel:{{ $company->phone }}" dir="ltr">{{ $company->phone }}</a>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                           @endif
                            @if (! JobBoardHelper::hideCompanyEmailEnabled() && $company->email)
                                <li>
                                    <div class="d-flex">
                                        <label class="text-dark">{{ __('Email') }}</label>
                                        <div>
                                            <p class="text-muted text-break mb-0">
                                                <a href="mailto:{{ $company->email }}">{{ $company->email }}</a>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                            @endif
                            @if ($company->website)
                                <li>
                                    <div class="d-flex">
                                        <label class="text-dark">{{ __('Website') }}</label>
                                        <div>
                                            <p class="text-muted text-break mb-0">
                                                <a href="{{ $company->website }}" target="_blank" rel="nofollow">{{ $company->website }}</a>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                            @endif
                            @if ($company->year_founded)
                                <li>
                                    <div class="d-flex">
                                        <label class="text-dark">{{ __('Year Founded') }}</label>
                                        <div>
                                            <p class="text-muted mb-0">{{ $company->year_founded }}</p>
                                        </div>
                                    </div>
                                </li>
                            @endif
                        </ul>
                        @if ($company->phone)
                            <div class="mt-3">
                                <a href="tel:{{ $company->phone }}" class="btn btn-danger btn-hover w-100">
                                    <i class="uil uil-phone"></i>
                                    <span>{{ __('Contact') }}</span>
                                </a>
                            </div>
                        @endif
                    </div><!--candidate-profile-overview-->

                    @if ($company->latitude && $company->longitude)
                        <div class="card-body p-4 border-top">
                            <h6 class="fs-17 fw-medium mb-4">{{ __('Company Location') }}</h6>
                            <div class="job-board-street-map-container">
                                <div class="job-board-street-map"
                                    data-popup-id="#street-map-popup-template"
                                    data-center="{{ json_encode([$company->latitude, $company->longitude]) }}"
                                    data-map-icon="{{ $company->name }}"></div>
                            </div>
                            <div class="d-none" id="street-map-popup-template">
                                <div>
                                    <table width="100%">
                                        <tr>
                                            <td width="40">
                                                <div>
                                                    <img src="{{ $company->logo_thumb }}" width="40" alt="{{ $company->name }}">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="infomarker">
                                                    <h5>
                                                        <a href="{{ $company->url }}" target="_blank">{{ $company->name }}</a>
                                                    </h5>
                                                    <div class="text-info">
                                                        <i class="mdi mdi-account"></i>&nbsp;
                                                        <span>{{ __(':number Employees', ['number' => $company->number_of_employees])}}</span>
                                                    </div>
                                                    @if ($company->full_address)
                                                        <div class="text-muted">
                                                            <i class="uil uil-map"></i>&nbsp;
                                                            <span>{{ $company->full_address }}</span>
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
                </div><!--end card-->
            </div><!--end col-->

            <div class="col-lg-8">
                <div class="card ms-lg-4 mt-4 mt-lg-0">
                    <div class="card-body p-4">
                        <div class="mb-5">
                            <h6 class="fs-17 fw-medium mb-4">{{ __('About Company') }}</h6>
                            <p class="text-muted">
                                {!! BaseHelper::clean($company->content) !!}
                            </p>
                        </div>
                        @if ($jobs->isNotEmpty())
                            <div>
                                <h6 class="fs-17 fw-medium mb-4">{{ __('Current Opening') }}</h6>
                                @foreach ($jobs as $job)
                                    @include(Theme::getThemeNamespace('views.job-board.partials.job-item'), ['job' => $job])
                                @endforeach
                            </div>
                        @endif
                        @if (JobBoardHelper::isEnabledReview())
                            @if($company->reviews_count > 0)
                                <div class="mt-4 pt-3 position-relative">
                                    <h6 class="fs-17 fw-semibold mb-3">{{ __(":company's Reviews", ['company' => $company->name]) }}</h6>
                                    <div class="spinner-overflow"></div>
                                    <div class="half-circle-spinner" style="display: none;position: absolute;top: 70%;left: 50%;">
                                        <div class="circle circle-1"></div>
                                        <div class="circle circle-2"></div>
                                    </div>
                                    <div class="review-list">
                                        @include(Theme::getThemeNamespace('views.job-board.partials.review-load'), ['reviews' => $company->reviews])
                                    </div>
                                </div>

                            @endif
                            <form action="{{ route('public.reviews.create') }}" method="post" class="company-review-form mt-4 pt-3">
                                @csrf
                                <input type="hidden" name="company_id" value="{{ $company->id }}">
                                <h6 class="fs-17 fw-semibold mb-2">{{ __('Reviews for :company', ['company' => $company->name]) }}</h6>
                                @if (!auth('account')->check())
                                    <p class="text-danger">{{ __('Please') }} <a href="{{ route('public.account.login') }}">{{ __('login') }}</a> {{ __('to write review!') }}</p>
                                @endif
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <select name="star" class="rating" data-read-only="false">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5" selected>5</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label for="review" class="form-label">{{ __('Review') }}</label>
                                            <textarea class="form-control" id="review" name="review" @disabled(! $canReview) rows="3" placeholder="{{ __('Add your review') }}">{{ old('review') }}</textarea>
                                        </div>
                                    </div><!--end col-->
                                </div><!--end row-->
                                <div class="text-end">
                                    <button type="submit" class="btn btn-primary btn-hover @if (! $canReview) disabled @endif" @disabled(! $canReview)>
                                        {{ __('Submit Review') }} <i class="uil uil-angle-right-b"></i>
                                    </button>
                                </div>
                            </form>
                        @endif
                    </div><!-- card body end -->
                </div><!--end card-->
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section>
<!-- END CANDIDATE-DETAILS -->
