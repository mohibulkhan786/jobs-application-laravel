<?php

use Botble\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;
use Theme\Jobcy\Http\Controllers\JobcyController;

Route::group(['controller' => JobcyController::class, 'middleware' => ['web', 'core']], function () {
    Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {
        Route::group(['prefix' => 'ajax', 'as' => 'public.ajax.'], function () {
            Route::get('cities', [
                'as' => 'cities',
                'uses' => 'ajaxGetCities',
            ]);
        });
    });
});

Theme::routes();
