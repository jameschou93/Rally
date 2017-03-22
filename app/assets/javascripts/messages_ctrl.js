(function() {
  angular.module("app").controller("messagesCtrl", function($scope, $http) {
    $scope.setup = function(id) {
      var params = {group_id: id};
      $http({method: "GET", url: "/api/v1/messages.json", params: params}).then(function(response) {
        $scope.messages = response.data;
      });
    };

    $scope.createNewMessage = function(body, currentUserId, groupId) {
      var params = {
        body: body,
        user_id: currentUserId,
        group_id: groupId
      };
      $http.post("/api/v1/messages.json", params).then(function(response) {
        $scope.newMessageBody = "";
      });
    };
  });
})();