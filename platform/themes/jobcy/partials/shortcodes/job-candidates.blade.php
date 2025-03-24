<section class="section">
    <div class="container">
        <div class="row align-items-center job-candidates-wrapper">
            <div class="col-lg-7">
                <div>
                    <h6 class="fs-16 mb-0">
                        @if ($candidates->total())
                            {{ __('Showing :from – :to of :total results', [
                                'from'  => $candidates->firstItem(),
                                'to'    => $candidates->lastItem(),
                                'total' => $candidates->total(),
                            ]) }}
                        @endif
                    </h6>
                </div>
            </div>

            <div class="col-lg-5">
                <div class="candidate-list-widgets">
                    {!! Form::open(['method' => 'GET']) !!}
                        <div class="row justify-content-end">
                            <div class="col-5">
                                <div class="filler-job-form">
                                    <i class="mdi mdi-account-search"></i>
                                    <input type="search" name="keyword" value="{{ BaseHelper::stringify(request()->query('keyword')) }}"
                                           class="form-control filter-job-input-box" placeholder="{{ __('Keyword...') }}">
                                </div>
                            </div>
                            <div class="col-5">
                                <div class="selection-widget">
                                    <select class="form-select" data-trigger name="order_by"
                                        id="choices-single-filter-order_by" aria-label="Default select example">
                                        <option value="default">{{ __('Default') }}</option>
                                        @foreach(JobBoardHelper::getSortByParams() as $key => $label)
                                            <option value="{{ $key }}" @selected(request()->input('order_by') == $key)>{{ $label }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-2">
                                <button class="btn btn-outline-primary">
                                    <i class="uil uil-search"></i>
                                </button>
                            </div>
                        </div>
                    {!! Form::close() !!}
                </div><!--end candidate-list-widgets-->
            </div><!--end col-->
        </div><!--end row-->

        <div class="candidate-list">
            @switch($shortcode->style)
                @case('grid')
                    <div class="row">
                        @foreach ($candidates as $candidate)
                            <div class="col-lg-4 col-md-6">
                                <div class="candidate-grid-box bookmark-post card mt-4">
                                    <div class="card-body p-4">
                                        @if ($candidate->is_featured)
                                            <div class="featured-label">
                                                <span class="featured">{{ __('featured') }}</span>
                                            </div>
                                        @endif
                                        <div class="d-flex mb-4">
                                            <div class="flex-shrink-0 position-relative">
                                                <img src="{{ $candidate->avatar_url }}" alt="{{ $candidate->name }}" class="avatar-md rounded">
                                            </div>
                                            <div class="ms-3">
                                                <a href="{{ $candidate->url }}" class="primary-link">
                                                    <h5 class="fs-17">{{ $candidate->name }}</h5>
                                                </a>
                                            </div>
                                        </div>
                                        <p class="text-muted candidate-description">{!! Str::limit(BaseHelper::clean($candidate->description), 80) !!}</p>
                                        @if ($candidate->address)
                                            <ul class="list-inline mb-0 text-muted">
                                                <li class="list-inline-item">
                                                    <i class="mdi mdi-map-marker"></i> <span>{{ Str::limit($candidate->address, 35) }}</span>
                                                </li>
                                            </ul>
                                        @endif
                                        <div class="mt-3">
                                            <a href="{{ $candidate->url }}" class="btn btn-soft-primary btn-hover w-100 mt-2">
                                                <i class="mdi mdi-eye"></i>
                                                <span>{{ __('View Profile') }}</span>
                                            </a>
                                        </div>
                                    </div>
                                </div> <!--end card-->
                            </div><!--end col-->
                        @endforeach

                    </div><!--end row-->
                    @break
                @default
                    @foreach ($candidates as $candidate)
                        <div class="candidate-list-box card mt-4">
                            <div class="card-body p-4">
                                <div class="row align-items-center">
                                    <div class="col-auto">
                                        <div class="candidate-list-images">
                                            <a href="{{ $candidate->url }}">
                                                <img src="{{ $candidate->avatar_url }}" alt="{{ $candidate->name }}" class="avatar-md img-thumbnail rounded-circle">
                                            </a>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-lg-5">
                                        <div class="candidate-list-content mt-3 mt-lg-0">
                                            <h5 class="fs-19 mb-2">
                                                <a href="{{ $candidate->url }}" class="primary-link">{{ $candidate->name }}</a>
                                            </h5>
                                            <p class="text-muted candidate-description">{!! Str::limit(BaseHelper::clean($candidate->description), 100) !!}</p>
                                            @if ($candidate->address)
                                                <ul class="list-inline mb-0 text-muted">
                                                    <li class="list-inline-item">
                                                        <i class="mdi mdi-map-marker"></i> {{ $candidate->address }}
                                                    </li>
                                                </ul>
                                            @endif
                                        </div>
                                    </div><!--end col-->
                                </div><!--end row-->
                                @if ($candidate->is_featured)
                                    <div class="featured-label">
                                        <span class="featured">{{ __('featured') }}</span>
                                    </div>
                                @endif
                            </div>
                        </div> <!--end card-->
                    @endforeach

            @endswitch

        </div><!--end candidate-list-->

        <div class="row mt-5 pt-2">
            <div class="col-lg-12">
                {!! $candidates->withQueryString()->links(Theme::getThemeNamespace('partials.pagination')) !!}
            </div><!--end col-->
        </div><!-- end row -->

    </div><!--end container-->
</section>
