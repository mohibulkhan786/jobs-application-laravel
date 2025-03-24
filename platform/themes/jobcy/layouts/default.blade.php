{!! Theme::partial('header') !!}

<div class="main-content">
    <div class="page-content" id="app">
        @if (Theme::get('withPageHeader', true))
            {!! Theme::partial('page-header') !!}
        @endif
        {!! Theme::content() !!}
    </div>
</div>

{!! Theme::partial('footer') !!}
