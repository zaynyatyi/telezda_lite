$(document).ready(function() {
function unbindAll() {
  stalkers.unbind("stalkers_list_changed");
}

function initDispatcher() {
  dispatcher = new WebSocketRails(window.location.hostname + ':3001/websocket');

  dispatcher.bind('connection_closed', function() {
    console.log("client was disconnected");
    $("#whoopsModal").modal({ backdrop: 'static', keyboard: false });
  });

  // subscribe to the bind dispatcher channel
  binder = dispatcher.subscribe('binder');

  stalkers = dispatcher.subscribe('stalkers');

  // bind to a channel event
  binder.bind('rebind', handlePlaceChanged);

  var placeHolder = $("#place_holder");
  var currentPlace = placeHolder.data("place");
  handlePlaceChanged({ new_room: placeHolder.data("place") });
}

function handlePlaceChanged(data) {
  console.log('rebinding initiated: ' + data);
  unbindAll();
  switch (data.new_room) {
    case "tower":
      bindTowerListeners();
    break;
  }
}

function bindTowerListeners() {
  stalkers.bind("stalkers_list_changed", refreshStalkersList);
}

//Channels callbacks
function refreshStalkersList(data) {
  console.log("stalkers list changed");
  $.ajax({
        url:  "/cities/1/select_users",
        dataType: "json",
        data: {},
        success: function(data) {
           console.log(data);
           var stalkersList = $("#stalkers_list ul");
           stalkersList.empty();
           data.users.forEach(function(data){
             stalkersList.append("<li>" + data + "</li>");
           });
        }
    });
}

var dispatcher;
var binder;
var stalkers;

initDispatcher();
});