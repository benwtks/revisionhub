$(document).ready(function() {
  setTimeout(function(){
    var classes = ['.notice-wrapper', '.alert-wrapper'];

    for (i = 0, len = classes.length; i < len; i++){
      $(classes[i]).fadeOut("slow", function() {
        $(this).remove();
      });
    };
  }, 3500);
});
