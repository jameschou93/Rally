/* global angular*/
(function() {
  "use strict";

  angular.module("app").controller("appointmentsCtrl", function($scope, $http) {      
    $scope.setup = function() {
      $http.get("/api/v1/appointments.json").then(function(response) {
        console.log(response.data);
        $scope.appointments = response.data;
      });
    };

    $scope.mapIndex = function() {
      $http.get("/api/v1/appointments.json").then(function(response) {
        console.log(response.data);
        $scope.appointments = response.data;
        var map;
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 12,
          center: {lat: 40.7091841, lng: -74.0122789}
        });
        $scope.appointments.forEach(function(appointment) {
          var coords = { lat: appointment.latitude, lng: appointment.longitude };
          var marker = new google.maps.Marker({
            position: coords,
            map: map
          });
        });

      });
    };

    window.scope = $scope;
  });
}());
