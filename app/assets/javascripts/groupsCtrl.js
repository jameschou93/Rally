/* global angular*/
(function() {
  "use strict";

  angular.module("app").controller("groupsCtrl", function($scope, $http) {      
    $http.get("/api/v1/groups.json").then(function(response) {
      console.log(response.data);
      $scope.groups = response.data;
    
    });



  


  });

}());
