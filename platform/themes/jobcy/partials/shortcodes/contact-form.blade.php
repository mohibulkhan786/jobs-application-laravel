<!-- START CONTACT-PAGE -->
<section class="section">
    <div class="container">
        <div class="row align-items-center mt-5">
            <div class="col-lg-6">
                <div class="section-title mt-4 mt-lg-0">
                    <h2 class="title">{{ $shortcode->title }}</h2>
                    <p class="text-muted">{{ $shortcode->subtitle }}</p>
                    {!! Form::open(['route' => 'public.send.contact', 'class' => 'contact-form mt-4']) !!}
                        {!! apply_filters('pre_contact_form', null) !!}

                        <span id="error-msg"></span>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label for="contact-name" class="form-label">{{ __('Name') }}</label>
                                    <input type="text" name="name" id="contact-name" class="form-control" placeholder="{{ __('Enter your name') }}" required>
                                </div>
                            </div><!--end col-->
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="contact-email" class="form-label">{{ __('Email') }}</label>
                                    <input type="email" class="form-control" id="contact-email" name="email" placeholder="{{ __('Enter your email') }}">
                                </div>
                            </div><!--end col-->
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="contact-phone" class="form-label">{{ __('Phone') }}</label>
                                    <input type="text" class="form-control" id="contact-phone" name="phone" placeholder="{{ __('Enter your phone') }}">
                                </div>
                            </div><!--end col-->
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="contact-subject" class="form-label">{{ __('Subject') }}</label>
                                    <input type="text" class="form-control" id="contact-subject" name="subject" placeholder="{{ __('Enter your subject') }}">
                                </div>
                            </div><!--end col-->
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label for="contact-content" class="form-label">{{ __('Your Message') }}</label>
                                    <textarea class="form-control" placeholder="{{ __('Enter your message') }}" name="content" id="contact-content" rows="3"></textarea>
                                </div>
                            </div><!--end col-->

                            @if (is_plugin_active('captcha'))
                                @if (setting('enable_captcha'))
                                    <div class="col-12">
                                        <div class="mb-3">
                                            {!! Captcha::display() !!}
                                        </div>
                                    </div>
                                @endif

                                @if (setting('enable_math_captcha_for_contact_form', 0))
                                    <div class="col-12">
                                        <div class="mb-3">
                                            <label for="math-group">{{ app('math-captcha')->label() }}</label>
                                            {!! app('math-captcha')->input(['class' => 'form-control', 'id' => 'math-group', 'placeholder' => app('math-captcha')->getMathLabelOnly() . ' = ?']) !!}
                                        </div>
                                    </div>
                                @endif
                            @endif
                        </div><!--end row-->
                        {!! apply_filters('after_contact_form', null) !!}
                        <div class="text-end">
                            <button type="submit" name="submit" class="btn btn-primary">
                                <span>{{ __('Send Message') }}</span>
                                <i class="uil uil-message ms-1"></i>
                            </button>
                        </div>
                        <div class="col-12">
                            <div class="contact-form-group mt-4">
                                <div class="contact-message contact-success-message" style="display: none"></div>
                                <div class="contact-message contact-error-message" style="display: none"></div>
                            </div>
                        </div>
                    {!! Form::close() !!}<!--end form-->
                </div>
            </div><!--end col-->
            <div class="col-lg-5 ms-auto order-first order-lg-last">
                @if ($shortcode->image)
                    <div class="text-center">
                        <img src="{{ RvMedia::getImageUrl($shortcode->image) }}" alt="image" class="img-fluid">
                    </div>
                @endif
                <div class="mt-4 pt-3">
                    @if ($shortcode->address)
                        <div class="d-flex text-muted align-items-center mt-2">
                            <div class="flex-shrink-0 fs-22 text-primary">
                                <i class="uil uil-map-marker"></i>
                            </div>
                            <div class="flex-grow-1 ms-2">
                                <p class="mb-0">{{ $shortcode->address }}</p>
                            </div>
                        </div>
                    @endif
                    @if ($shortcode->phone)
                        <div class="d-flex text-muted align-items-center mt-2">
                            <div class="flex-shrink-0 fs-22 text-primary">
                                <i class="uil uil-envelope"></i>
                            </div>
                            <div class="flex-grow-1 ms-2">
                                <p class="mb-0">{{ $shortcode->email }}</p>
                            </div>
                        </div>
                    @endif
                    @if ($shortcode->phone)
                        <div class="d-flex text-muted align-items-center mt-2">
                            <div class="flex-shrink-0 fs-22 text-primary">
                                <i class="uil uil-phone-alt"></i>
                            </div>
                            <div class="flex-grow-1 ms-2">
                                <p class="mb-0">{{ $shortcode->phone }}</p>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
            <!--end col-->
        </div>
        <!--end row-->
    </div>
    <!--end container-->
</section>
<!-- START CONTACT-PAGE -->
