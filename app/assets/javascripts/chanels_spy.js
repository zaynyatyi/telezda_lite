var dispatcher = new WebSocketRails('localhost:3001/websocket');

dispatcher.bind('connection_closed', function() {
  console.log("client was disconnected");
  $("#myModal").modal({ backdrop: 'static', keyboard: false });
});

dispatcher.on_error = function(data) {
  return console.log('on error');
};

dispatcher.on_close = function(data) {
  return console.log('on close');
};

console.log("debug hook");
