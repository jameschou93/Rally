/* global google, angular*/
(function() {
  "use strict";

  angular.module("app").controller("appointmentsCtrl", function($scope, $http) {      
    $scope.setup = function() {
      $http.get("/api/v1/myappointments.json").then(function(response) {
        console.log(response.data);
        $scope.appointments = response.data;
      });
    };
    window.$scope = $scope;
  });
}());
