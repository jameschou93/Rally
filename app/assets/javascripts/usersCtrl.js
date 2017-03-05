/* global angular*/
(function() {
  "use strict";

  angular.module("app").controller("usersCtrl", function($scope, $http) {      
    $http.get("/api/v1/users.json").then(function(response) {
      console.log(response.data);
      $scope.users = response.data;
    
    });



  


  });

}());
