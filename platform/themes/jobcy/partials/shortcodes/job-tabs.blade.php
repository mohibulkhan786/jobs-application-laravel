<section class="section bg-light">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="section-title text-center mb-4 pb-2">
                    <h4 class="title">{!! BaseHelper::clean($shortcode->title) !!}</h4>
                    <p class="text-muted mb-1">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                </div>
            </div><!--end col-->
        </div><!--end row-->
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <ul class="job-list-menu nav nav-pills nav-justified flex-column flex-sm-row mb-4" id="pills-tab"
                    role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="featured-jobs-tab" data-bs-toggle="pill"
                                data-bs-target="#featured-jobs" type="button" role="tab" aria-controls="featured-jobs"
                                aria-selected="false">{{ __('Featured Jobs') }}</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="recent-jobs-tab" data-bs-toggle="pill"
                                data-bs-target="#recent-jobs" type="button" role="tab" aria-controls="recent-jobs"
                                aria-selected="true">{{ __('Recent Jobs') }}</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="popular-jobs-tab" data-bs-toggle="pill"
                                data-bs-target="#popular-jobs" type="button" role="tab" aria-controls="popular-jobs"
                                aria-selected="false">{{ __('Popular Jobs') }}</button>
                    </li>
                </ul>
            </div>
            <!--end col-->
        </div>
        <!--end row-->
        <div class="row">
            <div class="col-lg-12">
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="featured-jobs" role="tabpanel"
                         aria-labelledby="featured-jobs-tab">

                        @foreach($featuredJobs as $job)
                            @include(Theme::getThemeNamespace('views.job-board.partials.job-item'), ['job' => $job])
                        @endforeach

                        <div class="text-center mt-4 pt-2">
                            <a href="{{ JobBoardHelper::getJobsPageURL() }}" class="btn btn-primary">{{ __('View More') }} <i class="uil uil-arrow-right"></i></a>
                        </div>

                    </div>

                    <div class="tab-pane fade" id="recent-jobs" role="tabpanel" aria-labelledby="recent-jobs-tab">

                        @foreach($recentJobs as $job)
                            @include(Theme::getThemeNamespace('views.job-board.partials.job-item'), ['job' => $job])
                        @endforeach

                        <div class="text-center mt-4 pt-2">
                            <a href="{{ JobBoardHelper::getJobsPageURL() }}" class="btn btn-primary">{{ __('View More') }} <i class="uil uil-arrow-right"></i></a>
                        </div>
                    </div>
                    <!--end featured-jobs-tab-->

                    <div class="tab-pane fade" id="popular-jobs" role="tabpanel" aria-labelledby="freelancer-tab">
                        @foreach($popularJobs as $job)
                            @include(Theme::getThemeNamespace('views.job-board.partials.job-item'), ['job' => $job])
                        @endforeach

                        <div class="text-center mt-4 pt-2">
                            <a href="{{ JobBoardHelper::getJobsPageURL() }}" class="btn btn-primary">{{ __('View More') }} <i class="uil uil-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <!--end col-->
        </div>
        <!--end row-->
    </div>
    <!--end container-->
</section>
