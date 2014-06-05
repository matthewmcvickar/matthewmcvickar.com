(function() {
  $(function() {
    var animateImage, animationImage;
    animationImage = $('.showoff img');
    animationImage.addClass('animated');
    animateImage = function() {
      animationImage.removeClass('animated').width();
      return animationImage.addClass('animated');
    };
    $(document).on('show.visibility', animateImage());
    return animationImage.click(function() {
      return animateImage();
    });
  });

}).call(this);
