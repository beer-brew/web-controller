App.stage_play = App.cable.subscriptions.create "StagePlayChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('audio').remove()
    targetElement = $("tr[data-id=#{data['stage']['id']}]")
    if $(targetElement).length==0
      $('.stage-play i').removeClass().addClass('fa fa-play faa-horizontal')
      $('td[data-field=timer]').text('N/A')
      $('tr').removeClass('current')
    else
      $('.stage-play .animated').removeClass 'animated'
      $('.current').removeClass('current')
      $(targetElement).addClass('current').find('i').addClass 'animated'
      for e in $('.stage-play')
        if $(e).data('id') < data['stage']
          $(e).find('i').unbind('click touchstart').removeClass().addClass('fa fa-stop')

  play: (stage)->
    @perform 'play_stage', stage: stage

  reset: ->
    @perform 'reset'
