{!! BaseHelper::googleFonts('https://fonts.googleapis.com/css2?family=' . urlencode(theme_option('primary_font', 'Dancing Script')) . '&family=' . urlencode(theme_option('secondary_font', 'Inter')) . ':wght@300;400;500;600;700&display=swap') !!}

<style>
    :root {
        --primary-color: {{ theme_option('primary_color', '#766df4') }};
        --primary-color-rgb: {{ implode(', ', BaseHelper::hexToRgb(theme_option('primary_color', '#766df4'))) }};
        --primary-font: '{{ theme_option('primary_font', 'Inter') }}', sans-serif;
        --secondary-font: '{{ theme_option('secondary_font', 'Dancing Script') }}', sans-serif;
    }
</style>
