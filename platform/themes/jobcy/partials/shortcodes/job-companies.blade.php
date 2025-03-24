<!-- START COMPANY-LIST -->
<section class="section">
    <div class="container">
        <div class="row align-items-center mb-4">
            <div class="col-lg-7">
                <div class="mb-3 mb-lg-0">
                    @if ($companies->total())
                        <h6 class="fs-16 mb-0">{{ __('Showing :from – :to of :total results', [
                                'from'  => $companies->firstItem(),
                                'to'    => $companies->lastItem(),
                                'total' => $companies->total(),
                            ]) }}</h6>
                    @endif
                </div>
            </div><!--end col-->

            <div class="col-lg-5">
                <div class="candidate-list-widgets">
                    {!! Form::open(['method' => 'GET']) !!}
                        <div class="row justify-content-end">
                            <div class="col-lg-5">
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
                            <div class="col-lg-2">
                                <button class="btn btn-outline-primary">
                                    <i class="uil uil-search"></i>
                                </button>
                            </div>
                        </div>
                    {!! Form::close() !!}
                </div><!--end candidate-list-widgets-->
            </div><!--end col-->
        </div><!--end row-->
        <div class="row">
            @foreach ($companies as $company)
                @include(Theme::getThemeNamespace('views.job-board.partials.company-item'), ['company' => $company])
            @endforeach
        </div><!--end row-->

        <div class="row">
            <div class="col-lg-12 mt-5">
                {!! $companies->withQueryString()->links(Theme::getThemeNamespace('partials.pagination')) !!}
            </div><!--end col-->
        </div><!-- end row -->
    </div><!--end container-->
</section>
<!-- END COMPANY-LIST -->
