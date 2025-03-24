{!! Form::open(['route' => 'public.account.register', 'class' => 'auth-form']) !!}
    <div class="mb-3">
        <label for="first_name" class="form-label">{{ __('First Name') }}</label>
        <input type="text" name="first_name" class="form-control @if($errors->has('first_name')) is-invalid @endif" id="first_name" placeholder="{{ __('First Name') }}">
        @if ($errors->has('first_name'))
            <span class="invalid-feedback">
                <strong>{{ $errors->first('first_name') }}</strong>
            </span>
        @endif
    </div>
    <div class="mb-3">
        <label for="last_name" class="form-label">{{ __('Last Name') }}</label>
        <input type="text" name="last_name" class="form-control @if($errors->has('last_name')) is-invalid @endif" id="last_name" placeholder="{{ __('Last Name') }}">
        @if ($errors->has('last_name'))
            <span class="invalid-feedback">
                <strong>{{ $errors->first('last_name') }}</strong>
            </span>
        @endif
    </div>
    <div class="mb-3">
        <label for="email" class="form-label">{{ __('Email') }}</label>
        <input type="email" name="email" class="form-control @if($errors->has('email')) is-invalid @endif" id="email" placeholder="{{ __('Email') }}" autocomplete="email">
        @if ($errors->has('email'))
            <span class="invalid-feedback">
                <strong>{{ $errors->first('email') }}</strong>
            </span>
        @endif
    </div>
    <div class="mb-3">
        <label for="password" class="form-label">{{ __('Password') }}</label>
        <input type="password" name="password" class="form-control @if($errors->has('password')) is-invalid @endif"
            id="password" placeholder="{{ __('Password') }}" autocomplete="new-password">
        @if ($errors->has('password'))
            <span class="invalid-feedback">
                <strong>{{ $errors->first('password') }}</strong>
            </span>
        @endif
    </div>
    <div class="mb-3">
        <label for="password_confirmation" class="form-label">{{ __('Password Confirmation') }}</label>
        <input type="password" name="password_confirmation" class="form-control @if($errors->has('password_confirmation')) is-invalid @endif"
            id="password_confirmation" placeholder="{{ __('Password Confirmation') }}" autocomplete="new-password">
        @if ($errors->has('password_confirmation'))
            <span class="invalid-feedback">
                <strong>{{ $errors->first('password_confirmation') }}</strong>
            </span>
        @endif
    </div>

    @if (setting('job_board_enabled_register_as_employer', 1))
        <div class="mb-4">
            <input type="hidden" name="is_employer" value="0">
            <div class="form-check">
                <input class="form-check-input" name="is_employer" value="1" type="checkbox" id="is-employer">
                <label class="form-check-label" for="is-employer">{{ __('Is Employer?') }}</label>
            </div>
        </div>
    @endif

    @if (is_plugin_active('captcha') && setting('enable_captcha') && setting('job_board_enable_recaptcha_in_register_page', 0))
        <div class="mb-3">
            {!! Captcha::display() !!}
        </div>
    @endif

    <div class="mb-4">
        <input type="hidden" name="agree_terms_and_policy" value="0">
        <div class="form-check">
            <input class="form-check-input" name="agree_terms_and_policy" value="1" type="checkbox" id="agree-terms-and-policy">
            <label class="form-check-label" for="agree-terms-and-policy">{{ __('I agree to the Terms and conditions') }}</label>
        </div>
    </div>
    <div class="text-center">
        <button type="submit" class="btn btn-primary w-100">{{ __('Sign Up') }}</button>
    </div>

{!! Form::close() !!}

<div class="mt-3 text-center">
    <p class="mb-0">{{ __('Already a member?') }} <a href="{{ route('public.account.login') }}" class="fw-medium text-primary text-decoration-underline"> {{ __('Sign In') }} </a></p>
</div>

<div class="mt-3">
    {!! apply_filters(BASE_FILTER_AFTER_LOGIN_OR_REGISTER_FORM, null, \Botble\JobBoard\Models\Account::class) !!}
</div>
