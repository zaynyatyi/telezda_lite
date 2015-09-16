$(document).ready(function() {
  function unbindAll() {
    stalkers.unbind("stalkers_list_changed");
    stalkers.unbind("items_list_changed");
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
    items = dispatcher.subscribe('items');

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
      case "yard":
        bindYardListeners();
      break;
    }
  }

  function bindTowerListeners() {
    stalkers.bind("stalkers_list_changed", refreshStalkersList);
  }

  function bindYardListeners() {
    items.bind("items_list_changed", refreshItemsLists);
  }

  //Channels callbacks
  function refreshStalkersList(data) {
    console.log("stalkers list changed");
    var stalkersList = $("#stalkers_list ul");
    stalkersList.empty();
    data.users.forEach(function(data){
      stalkersList.append("<li>" + data + "</li>");
    });
  }

  function refreshItemsLists(data) {
    console.log("items list changed");
    var userList = $("#user_items_list ul");
    userList.empty();
    data.user_items.forEach(function(data){
      userList.append("<li>" + data + "</li>");
    });
    var stockList = $("#stock_items_list ul");
    stockList.empty();
    data.stock_items.forEach(function(data){
      stockList.append("<li>" + data + "</li>");
    });
  }

  var dispatcher;
  var binder;
  var stalkers;
  var items;

  initDispatcher();
});