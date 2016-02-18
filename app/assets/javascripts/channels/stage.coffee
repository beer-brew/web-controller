App.stage = App.cable.subscriptions.create "StageChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("tr[data-id=#{data['id']}]").replaceWith(data['stage'])

  update: (id, field, value)->
    @perform 'update', id: id, field: field, value: value
