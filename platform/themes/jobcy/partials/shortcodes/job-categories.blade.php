<section class="section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="text-center mb-5">
                    @if ($shortcode->badge) <p class="badge bg-warning fs-14 mb-2">{!! BaseHelper::clean($shortcode->badge) !!}</p> @endif
                    <h2 class="h4">{!! BaseHelper::clean($shortcode->title) !!}</h2>
                    <p class="text-muted">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                </div>
            </div><!--end col-->
        </div><!--end row-->
        <div class="row">
            @foreach($categories->chunk(ceil($categories->count() / 3)) as $chunks)
                <div class="col-lg-4">
                    <div class="card job-Categories-box bg-light border-0">
                        <div class="card-body p-4">
                            <ul class="list-unstyled job-Categories-list mb-0">
                                @foreach($chunks as $category)
                                    <li>
                                        <a href="{{ $category->url }}" class="primary-link">
                                            <span>{{ $category->name }}</span>
                                            <span class="badge bg-soft-info float-end">{{ $category->active_jobs_count }}</span>
                                        </a>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </div><!--end col-->
            @endforeach
        </div><!--end row-->
    </div><!--end container-->
</section>
