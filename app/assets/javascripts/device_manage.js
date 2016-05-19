$(document).ready(function(){
    $(".connection").draggable({appendTo: "body", helper: "clone"});
    $(".device").droppable({
      drop: function(event, ui) {
          var sourceConnectionId = $(ui.draggable).context.id;
          var targetDeviceId = $(this).attr('id');
          $(this).appendTo('.component ul').addClass('ui-state-highlight');
          App.register.connected(sourceConnectionId, targetDeviceId); 
      }
    });
});
