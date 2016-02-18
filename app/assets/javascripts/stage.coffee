$(document).on 'click touchstart', 'td', (event)->
  $(this).on 'keydown', (e)->
    if e.keyCode == 27 || e.keyCode == 13 # escape and enter
      e.preventDefault()
      e.stopPropagation()
      $(event.target).blur()

  $(this).blur ->
    App.stage.update($(this).data('id'), $(this).data('field'), $(this).text())

$(document).on 'click touchstart', '#add-stage', ->
  App.stage.add()

$(document).on 'click touchstart', '.stage-play', (event)->
  if $(this).find('i').hasClass('fa-play')
    App.stage.play($(this).data('id'))


