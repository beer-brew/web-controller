App.stage_play = App.cable.subscriptions.create "StagePlayChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('.stage-play .animated').removeClass('animated')
    $("tr[data-id=#{data['stage']}] .stage-play i").addClass 'animated'
    for e in $('.stage-play')
      if $(e).data('id') < data['stage']
        $(e).find('i').unbind('click touchstart').removeClass().addClass('fa fa-stop')

