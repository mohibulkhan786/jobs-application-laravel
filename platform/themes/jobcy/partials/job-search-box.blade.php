@if (is_plugin_active('job-board'))
    @php
        $withCategories = !empty($withCategories);
        $colClass = $withCategories ? 'col-lg-3' : 'col-lg-4';
    @endphp
    {!! Form::open(['url' => JobBoardHelper::getJobsPageURL(), 'method' => 'GET']) !!}
        <div class="registration-form">
            <div class="row g-0">
                <div class="{{ $colClass }}">
                    <div class="filter-search-form filter-border mt-3 mt-lg-0">
                        <i class="uil uil-briefcase-alt"></i>
                        <input type="search" name="keyword" id="job-title"
                                    class="form-control filter-input-box" placeholder="{{ __('Job, Company name...') }}">
                    </div>
                </div><!--end col-->
                @if (is_plugin_active('location'))
                    <div class="{{ $colClass }}">
                        <div class="filter-search-form mt-3 mt-md-0">
                            <i class="uil uil-map-marker"></i>
                            <select class="form-select" data-trigger name="city_id"
                                id="choices-single-location"
                                aria-label="{{ __('Select City') }}"
                                data-no-results-text="{{ __('No results found.') }}"
                                data-loading-text="{{ __('Loading...') }}"
                                data-no-choices-text="{{ __('No choices to choose from') }}"
                                data-search-placeholder-value="{{ __('Enter keyword to search') }}"
                                data-placeholder-value="{{ __('Select City') }}"
                                >
                                <option value="">{{ __('Select City') }}</option>
                            </select>
                        </div>
                    </div><!--end col-->
                @endif
                @if ($withCategories)
                    <div class="{{ $colClass }}">
                        <div class="filter-search-form mt-3 mt-lg-0">
                            <i class="uil uil-clipboard-notes"></i>
                            <select class="form-select" data-trigger name="job_categories[]"
                                id="choices-single-categories" aria-label="{{ __('Select Category') }}">
                                <option value="">{{ __('All category') }}</option>
                                @foreach (app(\Botble\JobBoard\Repositories\Interfaces\CategoryInterface::class)->allBy(['status' => \Botble\Base\Enums\BaseStatusEnum::PUBLISHED]) as $item)
                                    <option value="{{ $item->id }}">{{ $item->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div><!--end col-->
                @endif
                <div class="{{ $colClass }}">
                    <div class="mt-3 mt-lg-0 h-100">
                        <button class="btn btn-primary submit-btn w-100 h-100" type="submit">
                            <i class="uil uil-search me-1"></i>
                            <span>{{ __('Find Job') }}</span>
                        </button>
                    </div>
                </div><!--end col-->
            </div><!--end row-->
        </div><!--end container-->
    {!! Form::close() !!}
@endif
