$(document).on 'click touchstart', '.editable', (event)->
  $(this).on 'keydown', (e)->
    if e.keyCode == 27 || e.keyCode == 13 # escape and enter
      e.preventDefault()
      e.stopPropagation()
      $(event.target).blur()

  $(this).blur ->
    App.stage.update($(this).data('id'), $(this).data('field'), $(this).text())
bind_select_device = ->
  $('select').on 'change', ->
    optionSelected = $("option:selected", this);
    App.stage.select_device($(this).parent().data('id'),$(this).attr('id'), this.value)

$(document).ready ->
  bind_select_device
$(document).on 'click touchstart', '#add-stage', ->
  App.stage.add()

$(document).on 'click touchstart', '.stage-play', (event)->
  if $(this).find('i').hasClass('fa-play')
    App.stage_play.play($(this).data('id'))

$(document).on 'click touchstart', '#reset', (event)->
    App.stage_play.reset()

$(document).on 'click touchstart', '.should_stop', (event)->
  App.stage.update($(this).data('id'), $(this).data('field'), $(this).find('input').prop('checked'))

