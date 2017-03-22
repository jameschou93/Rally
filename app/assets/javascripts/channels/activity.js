App.activity = App.cable.subscriptions.create("ActivityChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    var elementId = "messages-" + data.chatroom_id;
    var $scope = angular.element(document.getElementById(elementId)).scope();
    $scope.messages.push(data);
    $scope.$apply();
  }
});