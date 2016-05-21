var dropable = function(){
    $(".device").droppable({
        drop: function(event, ui) {
            var sourceConnectionType = $(ui.draggable).context.id;
            var targetDeviceId = $(this).attr('id');
            $(this).appendTo('.components');
            App.register.connected(sourceConnectionType, targetDeviceId); 
        }
    });
};
$(document).ready(function(){
    $(".connection").draggable({appendTo: "body", helper: "clone"});
    dropable(); 
});

