@if (!$account->id || !$account->isEmployer())
    <!-- START APPLY MODAL -->
    <div class="modal fade" id="applyNow" tabindex="-1" aria-labelledby="applyNow" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-body p-5">
                    {!! Form::open(['route' => 'public.job.apply', 'method' => 'POST', 'file' => true, 'class' => 'job-apply-form']) !!}
                        <div class="text-center mb-4">
                            <h2 class="modal-title h4">{{ __('Apply For This Job') }}</h2>
                        </div>
                        <div class="position-absolute end-0 top-0 p-3">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="text-center mb-4">
                            <h5 class="modal-job-name text-primary"></h5>
                            <input type="hidden" class="modal-job-id" name="job_id" required>
                            <input type="hidden" name="job_type" value="internal">
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="first_name_apply_now" class="form-label">{{ __('First Name') }}</label>
                                    <input type="text" value="{{ old('first_name', $account->first_name) }}" name="first_name"
                                           class="form-control" id="first_name_apply_now" placeholder="{{ __('Enter your first name') }}" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="last_name_apply_now" class="form-label">{{ __('Last Name') }}</label>
                                    <input type="text" value="{{ old('last_name', $account->last_name) }}" name="last_name"
                                           class="form-control" id="last_name_apply_now" placeholder="{{ __('Enter your last name') }}" required>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="email_apply_now" class="form-label">{{ __('Email Address') }}</label>
                                    <input type="email" value="{{ old('email', $account->email) }}" name="email" class="form-control" id="email_apply_now" placeholder="{{ __('Enter your email') }}" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="phone_apply_now" class="form-label">{{ __('Phone') }}</label>
                                    <input type="text" value="{{ old('phone', $account->phone) }}" name="phone"
                                           class="form-control" id="phone_apply_now" placeholder="{{ __('Enter your phone number') }}" required>
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="message_apply_now" class="form-label">{{ __('Message') }}</label>
                            <textarea class="form-control" name="message" id="message_apply_now" rows="4" placeholder="{{ __('Enter your message') }}"></textarea>
                        </div>
                        <div @if (!$account->resume) class="mb-4" @endif>
                            <label class="form-label" for="resume_apply_now">{{ $account->resume ? __('Resume Upload (optional)') : __('Resume Upload') }}</label>
                            <input type="file" name="resume" class="form-control" id="resume_apply_now">
                        </div>

                        @if ($account->resume)
                            <div class="mb-4 mt-2">
                                <p class="job-apply-resume-info"><i class="mdi mdi-information"></i> {!! BaseHelper::clean(__('Your current resume :resume. Just upload a new resume if you want to change it.', ['resume' => Html::link(RvMedia::url($account->resume), $account->resume, ['target' => '_blank'])->toHtml()])) !!}</p>
                            </div>
                        @endif

                    <div @if (!$account->cover_letter) class="mb-4" @endif>
                        <label class="form-label" for="cover_letter_apply_now">{{ $account->cover_letter ? __('Cover Letter (optional)') : __('Cover Letter Upload') }}</label>
                        <input type="file" name="cover_letter" class="form-control" id="cover_letter_apply_now">
                    </div>

                    @if ($account->cover_letter)
                        <div class="mb-4 mt-2">
                            <p class="job-apply-resume-info"><i class="mdi mdi-information"></i> {!! BaseHelper::clean(__('Your current cover letter :cover_letter. Just upload a new cover letter if you want to change it.', ['cover_letter' => Html::link(RvMedia::url($account->cover_letter), $account->cover_letter, ['target' => '_blank'])->toHtml()])) !!}</p>
                        </div>
                    @endif

                        @if (is_plugin_active('captcha') && setting('enable_captcha') && setting('job_board_enable_recaptcha_in_apply_job', 0))
                            <div class="mb-4">
                                {!! Captcha::display() !!}
                            </div>
                        @endif
                        <button type="submit" class="btn btn-primary w-100">{{ __('Send Application') }}</button>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div><!-- END APPLY MODAL -->

    <!-- START APPLY MODAL -->
    <div class="modal fade" id="applyExternalJob" tabindex="-1" aria-labelledby="applyExternalJob" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body p-5">
                    {!! Form::open(['route' => 'public.job.apply', 'method' => 'POST', 'file' => true, 'class' => 'job-apply-form']) !!}
                        <div class="text-center mb-4">
                            <h5 class="modal-title">{{ __('Apply For This Job') }}</h5>
                        </div>
                        <div class="position-absolute end-0 top-0 p-3">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="text-center mb-4">
                            <h5 class="modal-job-name"></h5>
                            <input type="hidden" class="modal-job-id" name="job_id" required>
                            <input type="hidden" name="job_type" value="external">
                        </div>
                        <div class="mb-3">
                            <label for="email_apply_external" class="form-label">{{ __('Email Address') }}</label>
                            <input type="email" value="{{ old('email', $account->email) }}" name="email" class="form-control" id="email_apply_external" placeholder="{{ __('Enter your email') }}" required>
                        </div>
                        @if (is_plugin_active('captcha') && setting('enable_captcha') && setting('job_board_enable_recaptcha_in_apply_job', 0))
                            <div class="mb-4">
                                {!! Captcha::display() !!}
                            </div>
                        @endif
                        <button type="submit" class="btn btn-primary w-100">{{ __('Go to job site') }} <i class="mdi mdi-arrow-right"></i></button>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div><!-- END APPLY MODAL -->
@endif
