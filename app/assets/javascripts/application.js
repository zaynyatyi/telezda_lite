//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require websocket_rails/main

var dispatcher = new WebSocketRails('localhost:3001/websocket');

channel = dispatcher.subscribe('stalkers');
channel.bind('entered', function(user_name) {
  console.log('a new stalker entered: ' + user_name);
});
channel.bind('leaved', function() {
  console.log('somebody leaved');
});