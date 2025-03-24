<?php

namespace Database\Seeders;

use Botble\Base\Facades\MetaBox;
use Botble\Base\Supports\BaseSeeder;
use Botble\JobBoard\Models\Category;
use Botble\Slug\Facades\SlugHelper;
use Botble\Slug\Models\Slug;
use Illuminate\Support\Str;

class JobCategorySeeder extends BaseSeeder
{
    public function run(): void
    {
        $this->uploadFiles('job-categories');

        Category::query()->truncate();

        $data = [
            'IT & Software',
            'Technology',
            'Government',
            'Accounting / Finance',
            'Construction / Facilities',
            'Tele-communications',
            'Design & Multimedia',
            'Human Resource',
            'Consumer Packaged Goods (CPG)',
            'Manufacturing',
            'Retail',
            'Distribution/Logistics',
            'Supply Chain Operations',
            'Healthcare & Medical',
            'Procurement / Sourcing',
            'Information Technology (IT)',
            'Sales/Business Development',
            'Legal & Professional Services',
            'Life Sciences & Healthcare',
        ];

        foreach ($data as $index => $item) {
            $category = Category::query()->create([
                'name' => $item,
                'order' => $index,
                'is_featured' => $index < 8,
            ]);

            if ($index < 8) {
                MetaBox::saveMetaBoxData($category, 'icon_image', 'job-categories/' . ($index + 1) . '.png');
            }

            Slug::query()->create([
                'reference_type' => Category::class,
                'reference_id' => $category->id,
                'key' => Str::slug($category->name),
                'prefix' => SlugHelper::getPrefix(Category::class),
            ]);
        }
    }
}
