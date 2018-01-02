$(document).ready(function() {
  if ($('.pagination').length) {
    return $(window).scroll(function() {
      var url = $('.pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.pagination').text("Fetching sessions");
        $.getScript(url);
      }
    });
  }
});
