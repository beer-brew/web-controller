App.stage = App.cable.subscriptions.create "StageChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    #TODO will update whole row, make edit another field of this row diffcault
    targetElement = $("tr[data-id=#{data['id']}]")
    if(targetElement.length == 0)
      $('tbody').append data['stage']
    else
      targetElement.replaceWith(data['stage'])

  update: (id, field, value)->
    @perform 'update', id: id, field: field, value: value

  add: ->
    @perform 'add_stage'
  select_device: (stage, type, selected_device) ->
    @perform 'select_device',stage_id: stage,select_type: type, device_id: selected_device

