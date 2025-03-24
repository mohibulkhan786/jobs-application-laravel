<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\JobBoard\Models\JobSkill;
use Botble\JobBoard\Models\Tag;
use Illuminate\Support\Facades\DB;

class JobTagSeeder extends BaseSeeder
{
    public function run(): void
    {
        Tag::query()->truncate();
        DB::table('jb_jobs_tags')->truncate();

        $data = [
            'JS',
            'PHP',
            'CSS',
            'HTML',
            'Laravel',
            'WordPress',
        ];

        foreach ($data as $item) {
            JobSkill::query()->create(['name' => $item]);
        }
    }
}
