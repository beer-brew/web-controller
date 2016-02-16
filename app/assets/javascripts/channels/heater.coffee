App.heater = App.cable.subscriptions.create "HeaterChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#heater').replaceWith data['heater']

  switch: ->
    @perform 'switch'

$(document).on 'click', '#switch', (event) ->
  App.heater.switch()
  event.preventDefault()