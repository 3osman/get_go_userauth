// #########################
// JavaScript file
//
// Project: getgo
// Author: Domonkos Horvath
// #########################

// jQuery to add shadow to navbar
$(window).scroll(function() {
    if ($(".navbar").offset().top > 5) {
        $(".navbar-fixed-top").addClass("scroll-shadow",  {duration:500});
    } else {
        $(".navbar-fixed-top").removeClass("scroll-shadow",  {duration:500});
    }
});