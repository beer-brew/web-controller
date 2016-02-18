App.timer = App.cable.subscriptions.create "TimerChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('tr.current td[data-field=timer]').text(data['timeLeft'])
