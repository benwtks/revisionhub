$(document).ready(function() {
  var $clone = $(".nav-bar").before($(".nav-bar").clone().addClass("clone"));

  $(window).on("scroll", function() {
    var fromTop = $(window).scrollTop();
    $("body").toggleClass("down", (fromTop > 400));
  });
});
