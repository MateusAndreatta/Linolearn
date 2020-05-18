$(document).ready(function () {
    $('.sidenav').sidenav();
});
//$('.carousel.carousel-slider').carousel({
//    fullWidth: true,
//    indicators: true
//});
  $(document).ready(function(){
    $('.tooltipped').tooltip();
  });
        
$('.carousel.carousel-slider').carousel({
   fullWidth: true,
   indicators: true
 }, setTimeout(autoplay, 4500));

 function autoplay() {
   $('.carousel').carousel('next');
   setTimeout(autoplay, 4500);
 }