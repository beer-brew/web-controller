App.alarm = App.cable.subscriptions.create "AlarmChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if( $('audio').length == 0)
      $('.stage-container').append(data['audio'])
