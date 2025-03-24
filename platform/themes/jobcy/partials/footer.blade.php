        @if (empty($withoutNavbar))
            @if (is_plugin_active('job-board'))
                @include(Theme::getThemeNamespace('views.job-board.partials.apply-modal'))
            @endif

            {!! dynamic_sidebar('pre_footer_sidebar') !!}

            <!-- START FOOTER -->
            <section class="bg-footer">
                <div class="container">
                    <div class="row">
                        {!! dynamic_sidebar('footer_sidebar') !!}
                    </div><!--end row-->
                </div><!--end container-->
            </section>
            <!-- END FOOTER -->

            <!-- START FOOTER-ALT -->
            <div class="footer-alt">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <p class="text-white-50 text-center mb-0">
                                {!! BaseHelper::clean(theme_option('copyright')) !!}
                            </p>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end container-->
            </div>
            <!-- END FOOTER -->
        @endif

        <!--start back-to-top-->
        <button id="back-to-top">
            <i class="mdi mdi-arrow-up"></i>
        </button>
        <!--end back-to-top-->
        <!-- END layout-wrapper -->

        {!! Theme::footer() !!}

        @if (session()->has('status') || session()->has('success_msg') || session()->has('error_msg') || (isset($errors) && $errors->any()) || isset($error_msg))
            <script type="text/javascript">
                'use strict';
                window.noticeMessages = window.noticeMessages || [];
                @if (session()->has('success_msg'))
                noticeMessages.push({'type': 'success', 'message': "{!! addslashes(session('success_msg')) !!}"});
                @endif
                @if (session()->has('status'))
                noticeMessages.push({'type': 'success', 'message': "{!! addslashes(session('status')) !!}"});
                @endif
                @if (session()->has('error_msg'))
                noticeMessages.push({'type': 'error', 'message': "{!! addslashes(session('error_msg')) !!}"});
                @endif
                @if (isset($error_msg))
                noticeMessages.push({'type': 'error', 'message': "{!! addslashes($error_msg) !!}"});
                @endif
                @if (isset($errors))
                @foreach ($errors->all() as $error)
                noticeMessages.push({'type': 'error', 'message': "{!! addslashes($error) !!}"});
                @endforeach
                @endif
            </script>
        @endif
    </body>
</html>
