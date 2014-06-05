(function() {
  $(function() {
    var animateImage, animationImage;
    animationImage = $('.showoff img');
    animateImage = function() {
      animationImage.removeClass('animated').width();
      return animationImage.addClass('animated');
    };
    $(document).on('show.visibility', animateImage);
    animationImage.click(animateImage);
    return animateImage();
  });

}).call(this);
