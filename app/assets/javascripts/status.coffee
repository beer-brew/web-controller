$(document).on 'click touchstart', '#switch', (event) ->
  App.heater.switch()
  event.preventDefault()

$(document).ready ->
  if(window.devicePixelRatio == 3)
    $('.temp-cover').height($('.temp-cover').height()*2.4)


