$ ->

  animationImage = $('.showoff img')

  # Animate on first pageload.
  animationImage.addClass('animated')

  $(document).on
    'show.visibility': ->
      animationImage.removeClass('animated').width()
      animationImage.addClass('animated')
