$ ->

  animationImage = $('.showoff img')

  # Animate on first pageload.
  animationImage.addClass('animated')

  # In case the site was opened in a tab, reanimate so they notice!
  $(document).on
    'show.visibility': ->
      # The width() function triggers a re-flow, causing the element
      # to re-animate when the class is re-assigned.
      animationImage.removeClass('animated').width()
      animationImage.addClass('animated')
