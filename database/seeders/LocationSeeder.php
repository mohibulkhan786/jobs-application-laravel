<?php

namespace Database\Seeders;

use Botble\Location\Location;
use Botble\Location\Models\City;
use Botble\Location\Models\Country;
use Botble\Location\Models\State;
use Illuminate\Database\Seeder;

class LocationSeeder extends Seeder
{
    public function run(): void
    {
        City::query()->truncate();
        State::query()->truncate();
        Country::query()->truncate();

        app(Location::class)->downloadRemoteLocation('us');
    }
}
