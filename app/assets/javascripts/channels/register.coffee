App.register= App.cable.subscriptions.create "RegisterChannel",
  connected: ->
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    console.log(data)
