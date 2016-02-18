$(document).on 'click touchstart', 'td', (event)->
  $(this).on 'keydown', (e)->
    if e.keyCode == 27 || e.keyCode == 13
      e.preventDefault()
      $(event.target).blur()
      App.stage.update($(this).data('id'), $(this).data('field'), $(this).text())