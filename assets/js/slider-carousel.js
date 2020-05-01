'use strict';

//Settings for carousel from bootstrap 4.0
$('.carousel').carousel({
    pause: "hover",
    interval: 5000
});

$(".carousel-control-prev").click(function(){
    $(".carousel").carousel("prev");
});

$(".carousel-control-next").click(function(){
    $(".carousel").carousel("next");
});