var add_device;
$(document).ready(function () {
  // var devices = [1, 2, 3];
  var graph, paper, device_template;
  graph = new joint.dia.Graph;
  paper = new joint.dia.Paper({
    el: $('#myholder'),
    width: 1000,
    height: 200,
    model: graph,
    gridSize: 1
  });
  device_template = new joint.shapes.basic.Rect({
    position: {x: 100, y: 30},
    size: {width: 100, height: 30},
    attrs: {
      rect: {fill: 'blue'}, text: {
        text: 'my box',
        fill: 'white'
      }
    }
  });
  add_device = function (detail) {
    console.log(detail.payload,"##########");
    var device_view = device_template.clone();
    device_view.attributes.attrs.text.text='id: ' + detail.payload.id;
    graph.addCells([device_view]);
    device_template.translate(120);
  };

  graph.on('all', function (eventName, cell) {
  });
});


//  var link = new joint.dia.Link({
//    source: {id: device_template.id},
//    target: {id: rect2.id}
//  });
