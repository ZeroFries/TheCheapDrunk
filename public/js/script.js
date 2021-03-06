// Generated by CoffeeScript 1.6.3
(function() {
  var $;

  $ = jQuery;

  $(document).ready(function() {
    var xOffset, yOffset;
    xOffset = 30;
    yOffset = 100;
    $('.products li').mousemove(function(e) {
      var parentOffset;
      parentOffset = $(this).offset();
      return $(this).children('.tooltip').css("top", (e.pageY - yOffset - parentOffset.top) + "px").css("left", (e.pageX + xOffset - parentOffset.left) + "px");
    });
    return $('button.show-more').bind("click", function() {
      var counter;
      counter = 20;
      $('.products > li').each(function(i, ele) {
        if (!$(ele).is(":visible") && counter > 0) {
          $(ele).show(800);
          return counter -= 1;
        }
      });
      if (counter > 0) {
        return $('button.show-more').hide();
      }
    });
  });

}).call(this);
