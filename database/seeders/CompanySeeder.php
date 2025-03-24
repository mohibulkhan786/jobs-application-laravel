<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\JobBoard\Models\Company;
use Botble\Location\Models\City;
use Botble\Slug\Facades\SlugHelper;
use Botble\Slug\Models\Slug;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class CompanySeeder extends BaseSeeder
{
    public function run(): void
    {
        Company::query()->truncate();
        DB::table('jb_companies_accounts')->truncate();

        $this->uploadFiles('companies');

        $data = [
            [
                'name' => 'Pinterest',
                'website' => 'https://www.pinterest.com',
            ],
            [
                'name' => 'Linkedin',
                'website' => 'https://www.linkedin.com',
                'ceo' => 'Jeff Weiner',
            ],
            [
                'name' => 'Line',
                'website' => 'https://line.me',
                'ceo' => 'Nakamura',
            ],
            [
                'name' => 'Uber',
                'website' => 'https://www.uber.com',
                'ceo' => 'John Doe',
            ],
            [
                'name' => 'Flutter',
                'website' => 'https://flutter.io',
                'ceo' => 'John Doe',
            ],
            [
                'name' => 'Behance',
                'website' => 'https://www.behance.net',
                'ceo' => 'John Doe',
            ],
            [
                'name' => 'Apple',
                'website' => 'https://www.apple.com',
                'ceo' => 'Steve Jobs',
            ],
            [
                'name' => 'Adobe',
                'website' => 'https://www.adobe.com',
                'ceo' => 'John Doe',
            ],
            [
                'name' => 'Vibe',
                'website' => 'https://www.vibe.com',
                'ceo' => 'John Doe',
            ],
            [
                'name' => 'VKontakte',
                'website' => 'https://vk.com',
                'ceo' => 'Vasya Pupkin',
            ],
            [
                'name' => 'WordPress',
                'website' => 'https://wordpress.org',
                'ceo' => 'Matt Mullenweg',
            ],
            [
                'name' => 'Envato',
                'website' => 'https://envato.com',
            ],
            [
                'name' => 'Magento',
                'website' => 'https://magento.com',
            ],
            [
                'name' => 'Generic',
                'website' => 'https://generic.com',
            ],
            [
                'name' => 'Reveal',
                'website' => 'https://reveal.com',
            ],
            [
                'name' => 'Woocommerce',
                'website' => 'https://woocommerce.com',
            ],
        ];

        $cities = City::all();

        $content = '<p class="text-muted"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer
                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and
                real-time potentialities. Appropriately communicate one-to-one technology.</p>

            <p class="text-muted">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate
                one-to-one technology.</p>

            <p class="text-muted"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit
                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa
                eiusmod Pinterest in do umami readymade swag.</p>';

        $faker = fake();

        $employerIds = [1, 4];
        foreach ($data as $index => $item) {
            $item['latitude'] = $faker->latitude(42.4772, 44.0153);
            $item['longitude'] = $faker->longitude(-74.7624, -76.7517);

            $city = $cities->random();
            $data = [
                'content' => $content,
                'logo' => 'companies/' . ($index + 1) . '.png',
                'is_featured' => true,
                'phone' => $faker->e164PhoneNumber(),
                'year_founded' => $faker->year(),
                'number_of_offices' => $faker->numberBetween(1, 10),
                'number_of_employees' => $faker->numberBetween(1, 10),
                'annual_revenue' => $faker->numberBetween(1, 10) . 'M',
                'description' => $faker->text(),
                'latitude' => Arr::get($item, 'latitude', $faker->latitude()),
                'longitude' => Arr::get($item, 'longitude', $faker->longitude()),
                'city_id' => $city->id,
                'state_id' => $city->state_id,
                'country_id' => $city->country_id,
                'address' => $faker->address(),
            ];

            $item = array_merge($item, $data);

            $company = Company::query()->create($item);
            $company->accounts()->attach($employerIds);

            Slug::query()->create([
                'reference_type' => Company::class,
                'reference_id' => $company->id,
                'key' => Str::slug($company->name),
                'prefix' => SlugHelper::getPrefix(Company::class),
            ]);
        }
    }
}
