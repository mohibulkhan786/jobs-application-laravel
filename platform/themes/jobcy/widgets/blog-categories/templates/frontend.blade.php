@if (is_plugin_active('blog'))
    @php
        $categories = app(\Botble\Blog\Repositories\Interfaces\CategoryInterface::class)
            ->advancedGet([
                'condition' => [
                    'status' => \Botble\Base\Enums\BaseStatusEnum::PUBLISHED
                ],
                'take'      => (int)$config['number_display'] ?: 10,
                'with'      => ['slugable'],
            ]);
    @endphp
    @if ($categories->isNotEmpty())
        <div class="mt-4 pt-2">
            <div class="sd-title">
                <h6 class="fs-16 mb-3">{!! BaseHelper::clean($config['name'] ?: __('Categories')) !!}</h6>
            </div>
            <div class="my-3">
                @foreach ($categories as $category)
                    <div class="mb-2">
                        <a href="{{ $category->url }}">
                            <label class="form-check-label ms-2" for="education">{{ $category->name }}</label>
                        </a>
                    </div>
                @endforeach
            </div>
        </div><!--end Categories-->
    @endif
@endif
