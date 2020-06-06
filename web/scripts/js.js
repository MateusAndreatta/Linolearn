$(document).ready(function () {
    $('.sidenav').sidenav();
});
//$('.carousel.carousel-slider').carousel({
//    fullWidth: true,
//    indicators: true
//});
$(document).ready(function () {
    $('.tooltipped').tooltip();
});

$(document).ready(function () {
    $('.collapsible').collapsible();
});
$(document).ready(function () {
    $('select').formSelect();
});
$('.carousel.carousel-slider').carousel({
    fullWidth: true,
    indicators: true
}, setTimeout(autoplay, 4500));

function autoplay() {
    $('.carousel').carousel('next');
    setTimeout(autoplay, 4500);
}

function enebleInputs(){
    $('#conta_nome').prop('disabled', false);
    $('#conta_sobrenome').prop('disabled', false);
    $('#conta_email').prop('disabled', false);
    $('#btnEdit').hide();
    $('#btnSubmit').removeClass("hide");
}