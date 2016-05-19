var dropable = function(){
    $(".device").droppable({
        drop: function(event, ui) {
            var sourceConnectionId = $(ui.draggable).context.id;
            var targetDeviceId = $(this).attr('id');
            $(this).appendTo('.components');
            App.register.connected(sourceConnectionId, targetDeviceId); 
        }
    });
};
$(document).ready(function(){
    $(".connection").draggable({appendTo: "body", helper: "clone"});
    dropable(); 
});

