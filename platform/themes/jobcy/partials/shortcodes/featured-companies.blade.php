<div class="py-4">
    <div class="container">
        <div class="row">
            @foreach($companies as $company)
                <div class="col-lg-2">
                    <div class="text-center p-3">
                        <a href="{{ $company->url }}" data-bs-toggle="tooltip" data-bs-placement="top" title="{{ $company->name }}" data-bs-original-title="{{ $company->name }}">
                            <img src="{{ RvMedia::getImageUrl($company->logo) }}" alt="{{ $company->name }}" class="img-fluid">
                        </a>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
