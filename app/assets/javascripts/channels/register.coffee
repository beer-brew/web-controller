App.register= App.cable.subscriptions.create "RegisterChannel",
  connected: ->
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    add_device(data) 
