<?php

namespace Theme\Jobcy\Http\Controllers;

use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Location\Repositories\Interfaces\CityInterface;
use Botble\Theme\Http\Controllers\PublicController;
use Illuminate\Http\Request;
use Theme\Jobcy\Http\Resources\CityResource;

class JobcyController extends PublicController
{
    public function ajaxGetCities(Request $request, CityInterface $cityRepository, BaseHttpResponse $response)
    {
        if (! $request->ajax() || ! $request->wantsJson()) {
            return $response->setNextUrl(route('public.index'));
        }

        $keyword = $request->input('k');

        $cities = $cityRepository->filters($keyword, null, ['state']);

        return $response->setData(CityResource::collection($cities));
    }
}
