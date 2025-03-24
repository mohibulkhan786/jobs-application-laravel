@php
    Theme::set('pageTitle', $tag->name);
@endphp
@include(Theme::getThemeNamespace('views.job-board.job-category'), ['jobs' => $jobs, 'pageTitle' => $tag->name])
