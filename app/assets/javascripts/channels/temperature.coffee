App.temperature = App.cable.subscriptions.create "TemperatureChannel",
  connected: ->
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    $('#temperature').replaceWith data['temperature']
    if(window.devicePixelRatio == 3)
      $('.temp-cover').height($('.temp-cover').height()*2.4)


$(document).ready ->
  if(window.devicePixelRatio == 3)
    $('.temp-cover').height($('.temp-cover').height()*2.4)


