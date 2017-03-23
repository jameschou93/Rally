/* global angular*/
(function() {
  "use strict";

  angular.module("app").controller("groupsCtrl", function($scope, $http) {      
    $http.get("/api/v1/groups.json").then(function(response) {
      console.log(response.data);
      $scope.groups = response.data;
    
    });

    $scope.categories = ["education", "food", "technology", "fitness", "crafts", "fashion","exercise", "health", "alcohol", "carpentry", "astrology"];

    
    $scope.hide = function(div) {
      if (div.style.display === "block") {
        div.style.display = null;
      } else {
        div.style.display = "block";
      }

    };

    window.$scope = $scope;
  


  });

}());
