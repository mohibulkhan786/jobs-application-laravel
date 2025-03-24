@if (count($groups) > 1)
    <span class="admin-list-language-chooser">
        <span>{{ trans('plugins/translation::translation.translations') }}: </span>
        @foreach ($groups as $language)
            @continue($language['locale'] === $group['locale'])

            <span>
                <a href="{{ route('translations.theme-translations', $language['locale'] == 'en' ? [] : [Language::refLangKey() => $language['locale']]) }}">{{ $language['name'] }}</a>
            </span>&nbsp;
        @endforeach
        <input type="hidden" name="ref_lang" value="{{ Language::getRefLang() }}">
    </span>
@endif
