App.register= App.cable.subscriptions.create "RegisterChannel",
  connected: ->
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (payload) ->
    targetElement = $('#devices') 
    if(targetElement.find('#'+payload['id']).length == 0)
      targetElement.append payload['body']

