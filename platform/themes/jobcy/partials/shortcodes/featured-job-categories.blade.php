<section class="section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="section-title text-center">
                    <h2 class="title">{!! BaseHelper::clean($shortcode->title) !!}</h2>
                    <p class="text-muted">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                </div>
            </div>
            <!--end col-->
        </div>
        <!--end row-->
        <div class="row">
            @foreach($categories as $category)
                <div class="col-lg-3 col-md-6 mt-4 pt-2">
                    <div class="popu-category-box rounded text-center">
                        <div class="popu-category-icon icons-md">
                            @if ($iconImage = $category->getMetaData('icon_image', true))
                                <img src="{{ RvMedia::getImageUrl($iconImage) }}" alt="{{ $category->name }}" width="64" height="64">
                            @elseif ($icon = $category->getMetaData('icon', true))
                                <i class="{{ $icon }}"></i>
                            @endif
                        </div>
                        <div class="popu-category-content mt-4">
                            <a href="{{ $category->url }}" class="text-dark stretched-link">
                                <h5 class="fs-18">{{ $category->name }}</h5>
                            </a>
                            <p class="text-muted mb-0">{{ __(':jobs Jobs', ['jobs' => $category->active_jobs_count]) }}</p>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        <!--end row-->

        @if ($page)
            <div class="row">
                <div class="col-lg-12">
                    <div class="mt-5 text-center">
                        <a href="{{ $page->url }}" class="btn btn-primary btn-hover">
                            <span>{{ __('Browse All Categories') }}</span>
                            <i class="uil uil-arrow-right ms-1"></i>
                        </a>
                    </div>
                </div><!--end col-->
            </div><!--end row-->
        @endif
    </div>
    <!--end container-->
</section>
