@php
    Theme::set('pageTitle', $post->name);
@endphp

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="blog-post">
                    @if ($post->image)
                        <img src="{{ RvMedia::getImageUrl($post->image, 'medium') }}" alt="{{ $post->name }}" class="img-fluid rounded-3">
                    @endif
                    <ul class="list-inline mb-0 mt-3 text-muted">
                        @if ($post->author && $post->author->id)
                            <li class="list-inline-item">
                                <div class="d-flex align-items-center">
                                    <div class="flex-shrink-0">
                                        <img src="{{ $post->author->avatar_url }}" alt="avatar" class="avatar-sm rounded-circle">
                                    </div>
                                    <div class="ms-3">
                                        <span class="primary-link">
                                            <h6 class="mb-0">{{ $post->author->name }}</h6>
                                        </span>
                                    </div>
                                </div>
                            </li>
                        @endif
                        <li class="list-inline-item">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <i class="uil uil-calendar-alt"></i>
                                </div>
                                <div class="ms-2">
                                    <p class="mb-0">{{ $post->created_at->translatedFormat('M d, Y') }}</p>
                                </div>
                            </div>
                        </li>
                        <li class="list-inline-item">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <i class="uil uil-eye"></i>
                                </div>
                                <div class="ms-2">
                                    <p class="mb-0">{{ number_format($post->views) }}</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="mt-4">
                        <div class="post-content">
                            <div class="ck-content">{!! BaseHelper::clean($post->content) !!}</div>

                            @if ($post->tags->isNotEmpty())
                                <div>
                                    <strong>{{ __('Tags') }}:</strong>
                                    @foreach($post->tags as $tag)
                                        <a href="{{ $tag->url }}" class="text-danger fw-semibold mb-0">{{ $tag->name }}</a>@if (!$loop->last)<span>, </span>@endif
                                    @endforeach
                                </div>
                            @endif
                        </div>

                        <ul class="blog-social-menu list-inline mb-0 text-end">
                            <li class="list-inline-item">
                                <b>{{ __('Share post:') }}</b>
                            </li>
                            <li class="list-inline-item">
                                <a href="https://www.facebook.com/sharer/sharer.php?u={{ urlencode($post->url) }}" class="social-link bg-soft-primary">
                                    <i class="uil uil-facebook-f"></i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="https://twitter.com/intent/tweet?url={{ urlencode($post->url) }}&text={{ strip_tags($post->description) }}" class="social-link bg-soft-success">
                                    <i class="uil uil-twitter"></i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="https://pinterest.com/pin/create/button?media={{ urlencode(RvMedia::getImageUrl($post->image, null, false, RvMedia::getDefaultImage())) }}&url={{ urlencode($post->url) }}&description={{ strip_tags($post->description) }}" class="social-link bg-soft-blue">
                                    <i class="mdi mdi-pinterest"></i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="https://www.linkedin.com/shareArticle?mini=true&url={{ urlencode($post->url) }}&summary={{ rawurldecode(strip_tags($post->description)) }}" class="social-link bg-soft-danger">
                                    <i class="uil uil-linkedin-alt"></i>
                                </a>
                            </li>
                        </ul>
                    </div>

                    <!-- comment start -->
                    @if (theme_option('facebook_comment_enabled_in_post', 'no') == 'yes')
                        {!! apply_filters(BASE_FILTER_PUBLIC_COMMENT_AREA, Theme::partial('comments')) !!}
                    @endif

                    @php $relatedPosts = get_related_posts($post->id, 4); @endphp
                    @if ($relatedPosts->isNotEmpty())
                        <div class="mt-5">
                            <h5 class="border-bottom pb-3">{{ __('Related Blog Posts') }}</h5>
                            <div class="swiper blog-slider pb-5 mt-4">
                                <div class="swiper-wrapper">
                                    @foreach ($relatedPosts as $item)
                                        <div class="swiper-slide">
                                            <div class="card blog-modern-box overflow-hidden border-0">
                                                <img src="{{ RvMedia::getImageUrl($item->image, 'small', false, RvMedia::getDefaultImage()) }}" alt="{{ $item->name }}" class="img-fluid">
                                                <div class="bg-overlay"></div>
                                                <div class="card-img-overlay">
                                                    <a href="{{ $item->url }}" class="text-white">
                                                        <h5 class="card-title">{{ $item->name }}</h5>
                                                    </a>
                                                    <p class="card-text text-white-50">
                                                        @if ($item->author && $item->author->id)
                                                            <span class="text-white-50">{{ $item->author->name }}</span>
                                                            <span>- </span>
                                                        @endif
                                                        <span>{{ $item->created_at->diffForHumans() }}</span>
                                                    </p>
                                                </div>
                                            </div>
                                        </div><!--end blog-slider-->
                                    @endforeach
                                </div>
                                <div class="swiper-pagination"></div>
                            </div><!--end blog-slider-->
                        </div><!--end related post-->
                    @endif
                </div>
            </div><!--end col-->
            <div class="col-lg-4 col-md-5">
                <div class="sidebar ms-lg-4 ps-lg-4 mt-5 mt-lg-0">
                    <!-- Search widget-->
                    {!! dynamic_sidebar('primary_sidebar') !!}
                </div>
                <!--end sidebar-->
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section>
<!-- START BLOG-DETAILS -->
