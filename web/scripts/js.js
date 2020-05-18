$(document).ready(function () {
    $('.sidenav').sidenav();
});
//$('.carousel.carousel-slider').carousel({
//    fullWidth: true,
//    indicators: true
//});

$('.carousel.carousel-slider').carousel({
   fullWidth: true,
   indicators: true
 }, setTimeout(autoplay, 4500));

 function autoplay() {
   $('.carousel').carousel('next');
   setTimeout(autoplay, 4500);
 }