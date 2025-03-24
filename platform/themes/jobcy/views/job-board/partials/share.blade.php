<div class="mt-4 pt-3">
    <ul class="list-inline mb-0">
        <li class="list-inline-item mt-1">
            <span>{{ __('Share this job:') }}</span>
        </li>
        <li class="list-inline-item mt-1">
            <a href="https://www.facebook.com/sharer/sharer.php?u={{ urlencode($job->url) }}" class="btn btn-primary btn-hover">
                <i class="uil uil-facebook-f"></i>
                <span>Facebook</span>
            </a>
        </li>
        <li class="list-inline-item mt-1">
            <a href="https://twitter.com/intent/tweet?url={{ urlencode($job->url) }}&text={{ strip_tags($job->description) }}" class="btn btn-danger btn-hover">
                <i class="uil uil-twitter"></i>
                <span>Twitter</span>
            </a>
        </li>
        <li class="list-inline-item mt-1">
            <a href="https://pinterest.com/pin/create/button?media={{ urlencode(RvMedia::getImageUrl($job->image, null, false, RvMedia::getDefaultImage())) }}&url={{ urlencode($job->url) }}&description={{ strip_tags($job->description) }}" class="btn btn-info btn-hover">
                <i class="mdi mdi-pinterest"></i>
                <span>Pinterest</span>
            </a>
        </li>
        <li class="list-inline-item mt-1">
            <a href="https://www.linkedin.com/shareArticle?mini=true&url={{ urlencode($job->url) }}&summary={{ rawurldecode(strip_tags($job->description)) }}" class="btn btn-success btn-hover">
                <i class="uil uil-linkedin-alt"></i>
                <span>Linkedin</span>
            </a>
        </li>
    </ul>
</div>
