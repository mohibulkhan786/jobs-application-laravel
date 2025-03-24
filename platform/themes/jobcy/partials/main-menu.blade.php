<ul {!! BaseHelper::clean($options) !!}>
    @foreach ($menu_nodes->loadMissing('metadata') as $key => $row)
        <li class="nav-item dropdown dropdown-hover @if ($row->has_child) menu-item-has-children @endif {{ $row->css_class }}">
            <a class="@if ($row->parent_id) dropdown-item @else nav-link @endif @if ($row->active) active @endif" href="{{ $row->url }}"
                target="{{ $row->target }}" @if ($row->has_child) role="button" data-bs-toggle="dropdown" @endif>
                @if ($iconImage = $row->getMetadata('icon_image', true))
                    <img src="{{ RvMedia::getImageUrl($iconImage) }}" alt="icon image" class="menu-icon-image"/>
                @elseif ($row->icon_font) <i class="{{ trim($row->icon_font) }}"></i> @endif {{ $row->title }}
                @if ($row->has_child) <div class="arrow-down"></div> @endif
            </a>
            @if ($row->has_child)
                {!!
                    Menu::generateMenu([
                        'menu'       => $menu,
                        'menu_nodes' => $row->child,
                        'view'       => 'main-menu',
                        'options'    => ['class' => 'dropdown-menu dropdown-menu-center'],
                    ])
                !!}
            @endif
        </li>
    @endforeach
</ul>
