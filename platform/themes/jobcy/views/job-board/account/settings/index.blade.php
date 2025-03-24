@php
    Theme::asset()->add('avatar-css', 'vendor/core/plugins/job-board/css/avatar.css');
    Theme::asset()->add('tagify-css', 'vendor/core/core/base/libraries/tagify/tagify.css');
    Theme::asset()->container('footer')->add('cropper-js', 'vendor/core/plugins/job-board/libraries/cropper.js', ['jquery']);
    Theme::asset()->container('footer')->add('avatar-js', 'vendor/core/plugins/job-board/js/avatar.js');
    Theme::asset()->container('footer')->add('editor-lib-js', config('core.base.general.editor.' . BaseHelper::getRichEditor() . '.js'));
    Theme::asset()->container('footer')->add('editor-js', 'vendor/core/core/base/js/editor.js');
    Theme::asset()->container('footer')->add('tagify-js', 'vendor/core/core/base/libraries/tagify/tagify.js');
    Theme::asset()->container('footer')->usePath()->add('tags-js', 'js/tagify-select.js');

    Theme::asset()->container('footer')->add('location-js', asset('vendor/core/plugins/location/js/location.js'), ['jquery']);
@endphp

<!-- START PROFILE -->
<section class="section crop-avatar">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                @include(Theme::getThemeNamespace('views.job-board.account.sidebar'))
            </div>
            <!--end col-->
            <div class="col-lg-8">
                <div class="card profile-content-page mt-4 mt-lg-0">
                    <ul class="profile-content-nav nav nav-pills border-bottom mb-4" id="pills-tab"
                            role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="settings-tab" data-bs-toggle="pill"
                                data-bs-target="#settings" type="button" role="tab" aria-controls="settings"
                                aria-selected="true">
                                {{ __('Settings') }}
                            </button>
                        </li>
                    </ul>
                        <!--end profile-content-nav-->
                    <div class="card-body p-4">
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane show active fade" id="settings" role="tabpanel" aria-labelledby="settings-tab">
                                {!! Form::open(['route' => 'public.account.post.settings', 'method' => 'POST', 'files' => true]) !!}
                                    <div>
                                        <h5 class="fs-17 fw-semibold mb-3 mb-0">{{ __('My Account') }}</h5>
                                        @if (! $account->type->getKey())
                                            <div class="alert alert-warning">
                                                <span>{{ __('Please select an account type first!') }}</span>
                                            </div>
                                        @endif
                                        <div class="text-center">
                                            <div class="mb-4 profile-user avatar-view">
                                                <img src="{{ $account->avatar_url }}" class="rounded-circle img-thumbnail profile-img" id="profile-img" alt="avatar">
                                                <div class="p-0 rounded-circle profile-photo-edit">
                                                    <label class="profile-photo-edit avatar-xs">
                                                        <i class="uil uil-edit"></i>
                                                    </label>
                                                </div>
                                            </div>
                                            <div id="print-msg" class="text-danger hidden"></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="first_name" class="form-label required">{{ __('First Name') }}</label>
                                                    <input type="text" class="form-control @error('first_name') is-invalid @enderror" id="first_name"
                                                        name="first_name" value="{{ old('first_name', $account->first_name) }}" required placeholder="{{ __('Enter First Name') }}"/>
                                                    @error('first_name')
                                                        <div class="invalid-feedback">
                                                            {{ $errors->first('first_name') }}
                                                        </div>
                                                    @enderror
                                                </div>
                                            </div>
                                            <!--end col-->
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="last_name" class="form-label required">{{ __('Last Name') }}</label>
                                                    <input type="text" class="form-control @error('last_name') is-invalid @enderror"
                                                        id="last_name" name="last_name" value="{{ old('last_name', $account->last_name) }}" required placeholder="{{ __('Enter Last Name') }}"/>
                                                    @error('last_name')
                                                        <div class="invalid-feedback">
                                                            {{ $errors->first('last_name') }}
                                                        </div>
                                                    @enderror
                                                </div>
                                            </div>
                                            <!--end col-->
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="phone" class="form-label">{{ __('Phone') }}</label>
                                                    <input type="text" class="form-control @error('phone') is-invalid @enderror"
                                                        name="phone" id="phone" value="{{ old('phone', $account->phone) }}" placeholder="{{ __('Enter Phone') }}"/>
                                                    @error('phone')
                                                        <div class="invalid-feedback">
                                                            {{ $errors->first('phone') }}
                                                        </div>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="dob" class="form-label">{{ __('Date of Birth') }}</label>
                                                    <input type="date" class="form-control @error('dob') is-invalid @enderror"
                                                        name="dob" id="dob" value="{{ old('dob', $account->dob ? $account->dob->format('Y-m-d') : '') }}"
                                                        max="{{ now()->format('Y-m-d') }}" pattern="\d{4}-\d{2}-\d{2}"/>
                                                    @error('dob')
                                                        <div class="invalid-feedback">
                                                            {{ $errors->first('dob') }}
                                                        </div>
                                                    @enderror
                                                </div>
                                            </div>
                                            @if (! $account->type->getKey())
                                                <div class="col-lg-6">
                                                    <div class="mb-3">
                                                        <label for="type" class="form-label required">{{ __('Type') }}</label>
                                                        {!! Form::select('type', ['' => __('-- select --')] + Botble\JobBoard\Enums\AccountTypeEnum::labels(), old('type', $account->type), [
                                                            'class' => 'form-select',
                                                            'required' => true,
                                                        ]) !!}
                                                    </div>
                                                </div>
                                            @endif
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="dob" class="form-label">{{ __('Gender') }}</label>
                                                    {!! Form::select('gender', ['' => __('-- select --')] + Botble\JobBoard\Enums\AccountGenderEnum::labels(), old('gender', $account->gender), [
                                                        'class' => 'form-select'
                                                    ]) !!}
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="mb-3">
                                                        <label for="country" class="form-label">{{ __('Country') }}</label>
                                                        {!! Form::select('country_id',
                                                            ['' => __('Select country...')] + \Botble\Location\Models\Country::query()->pluck('name', 'id')->all(),
                                                                old('country_id', $account), [
                                                                'class' => 'form-select select2',
                                                                'id' => 'country_id',
                                                                'data-type' => 'country',
                                                            ])
                                                        !!}
                                                    </div>
                                                </div>

                                                <div class="col-lg-6">
                                                    <div class="mb-3">
                                                        <label for="state_id" class="form-label">{{ __('State') }}</label>
                                                        {!! Form::select('state_id',
                                                            ['' => __('Select state...')] + ($account->country_id ? $account->country->states()->pluck('name', 'id')->all() : []),
                                                            old('state_id', $account), [
                                                                'class' => 'form-select select2',
                                                                'id' => 'state_id',
                                                                'data-type' => 'state',
                                                                'data-url' => route('ajax.states-by-country'),
                                                            ])
                                                        !!}
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="mb-3">
                                                        <label for="city_id" class="form-label">{{ __('City') }}</label>
                                                        {!! Form::select('city_id',
                                                            ['' => __('Select city...')] + ($account->state_id ? $account->state->cities()->pluck('name', 'id')->all() : []),
                                                            old('city_id', $account), [
                                                                'class' => 'form-select select2',
                                                                'id' => 'city_id',
                                                                'data-type' => 'city',
                                                                'data-url' => route('ajax.cities-by-state'),
                                                            ])
                                                        !!}
                                                    </div>
                                                </div>

                                                <div class="col-lg-6">
                                                    <div class="mb-3">
                                                        <label for="text" class="form-label" for="address">{{ __('Address') }}</label>
                                                        <input type="text" class="form-control @error('description') is-invalid @enderror"
                                                               name="address" id="address" value="{{ old('address', $account->address) }}" placeholder="{{ __('Enter Address') }}"/>
                                                        @error('address')
                                                        <div class="invalid-feedback">
                                                            {{ $errors->first('address') }}
                                                        </div>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>

                                            @if ($account->isJobSeeker())
                                                @if (count($jobSkills) || count($selectedJobSkills))
                                                    <div class="form-group mb-3">
                                                        <label for="favorite_skills" class="font-sm color-text-mutted mb-10">{{ __('Favorite Job Skills') }}</label>
                                                        <input type="text" class="tags form-control list-tagify" id="favorite_skills" name="favorite_skills" value="{{ implode(',', $selectedJobSkills) }}" data-keep-invalid-tags="false" data-list="{{ $jobSkills }}" data-user-input="false" placeholder="{{ __('Select from the list.') }}"/>
                                                        @error('favorite_skills')
                                                        <div class="invalid-feedback">
                                                            {{ $message }}
                                                        </div>
                                                        @enderror
                                                    </div>
                                                @endif

                                                @if (count($jobTags) || count($selectedJobTags))
                                                    <div class="form-group mb-3">
                                                        <label for="favorite_tags" class="form-label">{{ __('Favorite Job Tags') }}</label>
                                                        <input type="text" class="tags form-control list-tagify" id="favorite_tags" name="favorite_tags" value="{{ implode(',', $selectedJobTags) }}" data-keep-invalid-tags="false" data-list="{{ $jobTags }}" data-user-input="false" placeholder="{{ __('Select from the list.') }}"/>
                                                        @error('favorite_tags')
                                                        <div class="invalid-feedback">
                                                            {{ $message }}
                                                        </div>
                                                        @enderror
                                                    </div>
                                                @endif
                                            @endif
                                        </div>
                                        <!--end row-->
                                    </div>
                                    <!--end account-->
                                    <div class="mt-4">
                                        <h5 class="fs-17 fw-semibold mb-3">{{ __('Profile') }}</h5>
                                        <div class="row">
                                            @if ($account->isJobSeeker())
                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <div class="form-check form-switch">
                                                            <input type="hidden" name="is_public_profile" value="0">
                                                            <input class="form-check-input" name="is_public_profile" value="1" type="checkbox"
                                                                role="switch" id="is_public_profile" @if (old('is_public_profile', $account->is_public_profile)) checked @endif>
                                                            <label class="form-check-label" for="is_public_profile">{{ __('Is public profile?') }}</label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <div class="form-check form-switch">
                                                            <input type="hidden" name="available_for_hiring" value="0">
                                                            <input class="form-check-input" name="available_for_hiring" value="1" type="checkbox"
                                                                   role="switch" id="available_for_hiring" @checked(old('available_for_hiring', $account))>
                                                            <label class="font-sm color-text-mutted mb-10" for="available_for_hiring">{{ __('Available for hiring?') }}</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endif
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label for="description"
                                                        class="form-label">{{ __('Introduce Yourself') }}</label>
                                                    <textarea class="form-control @error('description') is-invalid @enderror" name="description"
                                                        id="description" placeholder="{{ __('Enter Description') }}"
                                                        rows="2">{!! BaseHelper::clean(old('description', $account->description)) !!}</textarea>
                                                    @error('description')
                                                        <div class="invalid-feedback">
                                                            {{ $errors->first('description') }}
                                                        </div>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label for="bio"
                                                        class="form-label">{{ __('BIO') }}</label>
                                                    {!! Form::customEditor('bio', old('bio', $account->bio)) !!}
                                                    @error('bio')
                                                        <div class="invalid-feedback">
                                                            {{ $errors->first('bio') }}
                                                        </div>
                                                    @enderror
                                                </div>
                                            </div>
                                            @if ($account->isJobSeeker())
                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <label for="attachments-cv" class="form-label">{{ __('Attachments CV') }}</label>
                                                        <input type="file" class="form-control @error('resume') is-invalid @enderror"
                                                            id="attachments-cv" name="resume" accept=".pdf,.doc,.docx,.ppt,.pptx" />
                                                        @if ($account->resume)
                                                            <div class="mb-4 mt-2">
                                                                <p class="job-apply-resume-info"><i class="mdi mdi-information"></i> {!! BaseHelper::clean(__('Your current resume :resume. Just upload a new resume if you want to change it.', ['resume' => Html::link(RvMedia::url($account->resume), $account->resume, ['target' => '_blank'])->toHtml()])) !!}</p>
                                                            </div>
                                                        @endif
                                                        @error('resume')
                                                            <div class="invalid-feedback">
                                                                {{ $errors->first('resume') }}
                                                            </div>
                                                        @enderror
                                                    </div>
                                                </div>

                                                    <div class="col-lg-12">
                                                        <div class="mb-3">
                                                            <label for="attachments-cover-letter" class="form-label">{{ __('Cover letter') }}</label>
                                                            <input type="file" @class(['form-control', 'is-invalid' => $errors->has('cover_letter')])
                                                            id="attachments-cover-letter" name="cover_letter" accept=".pdf,.doc,.docx,.ppt,.pptx" />
                                                            @if ($account->cover_letter)
                                                                <div class="mb-4 mt-2">
                                                                    <p class="job-apply-cover-letter-info"><i class="mdi mdi-information"></i> {!! BaseHelper::clean(__('Your current cover letter :cover_letter. Just upload a new cover letter if you want to change it.', ['cover_letter' => Html::link(RvMedia::url($account->cover_letter), $account->cover_letter, ['target' => '_blank'])->toHtml()])) !!}</p>
                                                                </div>
                                                            @endif
                                                            @error('cover_letter')
                                                            <div class="invalid-feedback">
                                                                {{ $message }}
                                                            </div>
                                                            @enderror
                                                        </div>
                                                    </div>
                                            @endif
                                        </div>
                                        <!--end row-->
                                    </div>
                                    <!--end profile-->
                                    <div class="mt-4 text-end">
                                        <button type="submit" class="btn btn-primary">{{ __('Update') }}</button>
                                    </div>
                                {!! Form::close() !!}
                                <!--end form-->
                            </div>
                            <!--end tab-pane-->
                        </div>
                        <!--end tab-content-->
                    </div>
                    <!--end card-body-->
                </div>
                <!--end profile-content-page-->
            </div>
            <!--end col-->
        </div>
        <!--end row-->
    </div>
    <!--end container-->

    <div class="modal fade" id="avatar-modal" tabindex="-1" role="dialog" aria-labelledby="avatar-modal-label" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form class="avatar-form" method="post" action="{{ route('public.account.avatar') }}" enctype="multipart/form-data">
                    <div class="modal-header">
                        <h4 class="modal-title" id="avatar-modal-label">
                            <strong>{{ __('Profile Image') }}</strong>
                        </h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">

                        <div class="avatar-body">

                            <!-- Upload image and data -->
                            <div class="avatar-upload">
                                <input class="avatar-src" name="avatar_src" type="hidden">
                                <input class="avatar-data" name="avatar_data" type="hidden">
                                @csrf
                                <label for="avatarInput">{{ __('New image') }}</label>
                                <input class="avatar-input" id="avatarInput" name="avatar_file" type="file">
                            </div>

                            <div class="loading" tabindex="-1" role="img" aria-label="{{ __('Loading') }}"></div>

                            <!-- Crop and preview -->
                            <div class="row">
                                <div class="col-md-9">
                                    <div class="avatar-wrapper"></div>
                                    <div class="error-message text-danger" style="display: none"></div>
                                </div>
                                <div class="col-md-3 avatar-preview-wrapper">
                                    <div class="avatar-preview preview-lg"></div>
                                    <div class="avatar-preview preview-md"></div>
                                    <div class="avatar-preview preview-sm"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-outline-secondary" type="button" data-bs-dismiss="modal">{{ __('Close') }}</button>
                        <button class="btn btn-outline-primary avatar-save" type="submit">{{ __('Save') }}</button>
                    </div>
                </form>
            </div>
        </div>
    </div><!-- /.modal -->
</section>
<!-- END PROFILE -->

@push('footer')
    <script>
        'use strict';

        var RV_MEDIA_URL = {
            base: '{{ url('') }}',
            filebrowserImageBrowseUrl: false,
            media_upload_from_editor: '{{ route('public.account.upload-from-editor') }}'
        }

        function setImageValue(file) {
            $('.mce-btn.mce-open').parent().find('.mce-textbox').val(file);
        }
    </script>
    <iframe id="form_target" name="form_target" style="display:none"></iframe>
    <form id="tinymce_form" action="{{ route('public.account.upload-from-editor') }}" target="form_target" method="post" enctype="multipart/form-data"
          style="width:0; height:0; overflow:hidden; display: none;">
        @csrf
        <input name="upload" id="upload_file" type="file" onchange="$('#tinymce_form').submit();this.value='';">
        <input type="hidden" value="tinymce" name="upload_type">
    </form>
@endpush
