(function() {
  $(function() {
    var animationImage;
    animationImage = $('.showoff img');
    animationImage.addClass('animated');
    return $(document).on({
      'show.visibility': function() {
        animationImage.removeClass('animated').width();
        return animationImage.addClass('animated');
      }
    });
  });

}).call(this);
