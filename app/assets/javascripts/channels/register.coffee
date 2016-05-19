App.register= App.cable.subscriptions.create "RegisterChannel",
  connected: ->
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (payload) ->
    targetElement = $('.device-panel .devices') 
    if(targetElement.find('#'+payload['id']).length == 0)
      targetElement.append payload['body']
      dropable(); 
  connected: (source_connection_id, target_device_id)->
    @perform 'connected', source_connection_id: source_connection_id, target_device_id: target_device_id 
