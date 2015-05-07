$(document).ready(function() {

  $("#details").on("click", function(e) {
    e.preventDefault();
    $(".details-submenu").css("border-bottom", "1.5px solid black");
    $(".description-submenu").css("border-bottom", "none");
    $(".sizing-submenu").css("border-bottom", "none");
    $(".tab1").show();
    $(".tab2").hide();
    $(".tab3").hide();
  });

  $("#description").on("click", function(e) {
    e.preventDefault();
    $(".description-submenu").css("border-bottom", "1.5px solid black");
    $(".details-submenu").css("border-bottom", "none");
    $(".sizing-submenu").css("border-bottom", "none");
    $(".tab1").hide();
    $(".tab2").show();
    $(".tab3").hide();
  });

  $("#sizing").on("click", function(e) {
    e.preventDefault();
    $(".sizing-submenu").css("border-bottom", "1.5px solid black");
    $(".description-submenu").css("border-bottom", "none");
    $(".details-submenu").css("border-bottom", "none");
    $(".tab1").hide();
    $(".tab2").hide();
    $(".tab3").show();
    $(".table-position").show();
  });

  $('#scroll-down').on("click", function() {
    $('html, body').animate({
      scrollTop: $('#product-carousel').offset().top
    }, 1000);
  });

  $('#scroll-up').on("click", function() {
    $('html, body').animate({
      scrollTop: $('#scroll-anchor').offset().top
    }, 1000);
  });

  $('.single-item').slick({
    infinite: true,
    dots: true,
    fade: true,
    speed: 1000,
    slidesToShow: 1,
    autoplay: true,
    autoplaySpeed: 2000,
    pauseOnHover: false
  });

  $('.multiple-items').slick({
    slidesToShow: 4,
    slidesToScroll: 4,
    dots: true
  });

  $('.image-zoom').elevateZoom({
    zoomType: "inner",
    lensShape: "round",
  });

});
