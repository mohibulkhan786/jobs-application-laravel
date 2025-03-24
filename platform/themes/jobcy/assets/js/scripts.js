'use strict';

function windowScroll() {
    let navbar = document.getElementById('navbar');
    if (navbar) {
        if (
            document.body.scrollTop >= 50 ||
            document.documentElement.scrollTop >= 50
        ) {
            navbar.classList.add('nav-sticky');
        } else {
            navbar.classList.remove('nav-sticky');
        }
    }
}

window.addEventListener('scroll', function (ev) {
    ev.preventDefault();
    windowScroll();
});

/*****************Tooltip Js****************/

let tooltipTriggerList = [].slice.call(
    document.querySelectorAll('[data-bs-toggle="tooltip"]')
);

tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
});

//
/********************* scroll top js ************************/
//

let myButton = document.getElementById('back-to-top');

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () {
    scrollFunction();
};

function scrollFunction() {
    if (
        document.body.scrollTop > 100 ||
        document.documentElement.scrollTop > 100
    ) {
        myButton.style.display = 'block';
    } else {
        myButton.style.display = 'none';
    }
}

// When the user clicks on the button, scroll to the top of the document

$('#back-to-top').on('click', function () {
    $('html, body').animate(
        {
            scrollTop: '0px',
        },
        0
    );
});

//
/********************* Page Load js ************************/
//

let preloader = document.getElementById('preloader');

if (preloader) {
    window.addEventListener('load', function () {
        preloader.style.opacity = '0';
        preloader.style.visibility = 'hidden';
    });
}

// Favourite btn
let favouriteBtn = document.getElementsByClassName('bookmark-btn');
for (let i = 0; i < favouriteBtn.length; i++) {
    let favouriteButtons = favouriteBtn[i];
    favouriteButtons.onclick = function () {
        favouriteButtons.classList.toggle('active');
    };
}

// GLightbox Popup
if (jQuery().GLightbox) {
    GLightbox({
        selector: '.image-popup'
    });
}

$(() => {
    if (typeof Choices != 'undefined') {

        if ($('#choices-single-filter-order_by').length) {
            new Choices('#choices-single-filter-order_by');
        }

        if ($('#choices-candidate-page').length) {
            new Choices('#choices-candidate-page');
        }

        const $singleLocation = $('#choices-single-location');
        if ($singleLocation.length) {
            let singleLocation = new Choices($singleLocation[0], {
                searchResultLimit: 5,
                noResultsText: $singleLocation.data('noResultsText') || 'No results found',
                noChoicesText: $singleLocation.data('noChoicesText') || 'No choices to choose from',
                itemSelectText: $singleLocation.data('itemSelectText') || 'Press to select',
                placeholder: true,
                placeholderValue: $singleLocation.data('placeholderValue') || '',
                searchPlaceholderValue: $singleLocation.data('searchPlaceholderValue') || null,
                searchChoices: false,
            });

            let timeout = null;

            let ajaxSearchCities = keyword => {
                $.ajax({
                    url: $singleLocation.data('url') || (window.siteUrl + '/ajax/cities'),
                    dataType: 'json',
                    data: {
                        k: keyword
                    },
                    success: data => {
                        singleLocation.setChoices(data.data, 'id', 'label', true);
                    }
                });
            }

            ajaxSearchCities();

            $singleLocation[0].addEventListener(
                'search',
                function (event) {

                    clearTimeout(timeout);

                    timeout = setTimeout(function () {
                        ajaxSearchCities(event.detail.value);
                    }, 500);
                },
            );
        }

        let singleCategories = document.getElementById('choices-single-categories');
        if (singleCategories) {
            new Choices('#choices-single-categories');
        }

        if ($('#choices-text-remove-button').length) {
            new Choices(
                document.getElementById('choices-text-remove-button'), {
                    delimiter: ',',
                    editItems: true,
                    maxItemCount: 5,
                    removeItemButton: true,
                }
            );
        }


    }

})

//
/********************* Counter js ************************/
//

function _toConsumableArray(arr) {
    if (Array.isArray(arr)) {
        let arr2 = [];
        for (let i = 0, arr2 = Array(arr.length); i < arr.length; i++) {
            arr2[i] = arr[i];
        }

        return arr2;
    }

    return Array.from(arr);
}

let isCounters = document.querySelectorAll('.counter');

isCounters.forEach(function (value) {
    let patt = /(\D+)?(\d+)(\D+)?(\d+)?(\D+)?/;
    let time = 1000;
    let result = [].concat(_toConsumableArray(patt.exec(value.textContent)));
    let fresh = true;
    let ticks;

    result.shift();

    result = result.filter(function (res) {
        return res != null;
    });

    while (value.firstChild) {
        value.removeChild(value.firstChild);
    }
    result.forEach(function (res) {
        if (isNaN(res)) {
            value.insertAdjacentHTML('beforeend', '<span>' + res + '</span>');
        } else {
            for (let i = 0; i < res.length; i++) {
                value.insertAdjacentHTML(
                    'beforeend',
                    '<span data-value="' +
                    res[i] +
                    '">\n\t\t\t\t\t\t<span>&ndash;</span>\n\t\t\t\t\t\t' +
                    Array(parseInt(res[i]) + 1)
                        .join(0)
                        .split(0)
                        .map(function (x, j) {
                            return "\n\t\t\t\t\t\t\t<span>" + j + "</span>\n\t\t\t\t\t\t";
                        })
                        .join('') +
                    "\n\t\t\t\t\t</span>"
                );
            }
        }
    });

    ticks = [].concat(
        _toConsumableArray(value.querySelectorAll('span[data-value]'))
    );

    let activate = function () {
        let top = value.getBoundingClientRect().top;
        let offset = window.innerHeight * 0.8;

        setTimeout(function () {
            fresh = false;
        }, time);
        if (top < offset) {
            setTimeout(function () {
                ticks.forEach(
                    function (tick) {
                        let dist = parseInt(tick.getAttribute('data-value')) + 1;
                        tick.style.transform = 'translateY(-' + dist * 100 + '%)';
                    },
                    fresh ? time : 0
                );
            });
            window.removeEventListener('scroll', activate);
        }
    };
    window.addEventListener('scroll', activate);
    activate();
});

if (jQuery().Gumshoe) {
    new Gumshoe('#elementsBar a', {
        offset: 90
    });
}

if (jQuery().SmoothScroll) {
    new SmoothScroll('#elementsBar a', {
        speed: 1000,
        offset: 90
    });
}


let checkAll = document.getElementById('checkAll');
if (checkAll) {
    checkAll.onclick = function () {
        let checkboxes = document.querySelectorAll('.form-check-all input[type="checkbox"]');
        for (let i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = this.checked;
        }
    }
}

document.addEventListener('DOMContentLoaded', function () {
    new Swiper('.home-slider', {
        slidesPerView: 'auto',
        loop: true,
        spaceBetween: 20,
        autoplay: {
            delay: 2500,
            disableOnInteraction: false,
        }
    });

    /************** Blog Slider *************/

    new Swiper('.blog-slider', {
        loop: false,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        autoplay: {
            delay: 2500,
            disableOnInteraction: false,
        },
        breakpoints: {
            200: {
                slidesPerView: 1,
                spaceBetween: 10,
            },
            992: {
                slidesPerView: 2,
                spaceBetween: 20,
            },
        },
    });

    new Swiper('#testimonial-slider', {
        loop: true,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        autoplay: {
            delay: 2500,
            disableOnInteraction: false,
        },
        breakpoints: {
            200: {
                slidesPerView: 1,
                spaceBetween: 10,
            },
            992: {
                slidesPerView: 1,
                spaceBetween: 20,
            }
        }
    });

});

/********************* Area Range Value **********************/

if (jQuery().noUiSlider) {
    let slider1 = document.getElementById('slider1');

    noUiSlider.create(slider1, {
        start: [9],
        step: 1,
        range: {
            'min': [1],
            'max': [15]
        }
    });

    let slider1Value = document.getElementById('slider1-span');

    slider1.noUiSlider.on('update', function (values, handle) {
        slider1Value.innerHTML = values[handle];
    });
}

/********************* Bar Rating **********************/
function rating() {
    $(document).find('select.rating').each(function () {
        let readOnly;
        readOnly = $(this).attr('data-read-only') === 'true';
        $(this).barrating({
            theme: 'css-stars',
            readonly: readOnly,
            emptyValue: '0',
        });
    });
}

/********************* Clickable Toggle **********************/

$(function () {
    $(document).on('click', '[data-toggle="clickable"]', function (e) {
        if($(e.target).is('a')) return;

        window.location.assign(
            $(this).data('url')
        );
    });

    rating()
});
