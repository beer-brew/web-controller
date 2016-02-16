App.temperature = App.cable.subscriptions.create "TemperatureChannel",
  connected: ->
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    $('#temperature').replaceWith data['temperature']
