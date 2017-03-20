/* global google, angular*/
(function() {
  "use strict";

  angular.module("app").controller("mapCtrl", function($scope, $http, $filter) {      
    $scope.setup = function() {
      $http.get("/api/v1/appointments.json").then(function(response) {
        console.log(response.data);
        $scope.appointments = response.data;
      });
    };

    $scope.date = $filter("date")(Date.now(), 'yyyy-MM-dd');
    $scope.dateFilter = new Date;
    $scope.mapIndex = function() {
      $http.get("/api/v1/appointments.json").then(function(response) {
        console.log(response.data);
        $scope.appointments = response.data;
        var map;
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 12,
          center: {lat: 40.7091841, lng: -74.0122789}
        });
        var year = $scope.dateFilter.getFullYear().toString();
        var month = ($scope.dateFilter.getUTCMonth() + 1).toString();
        var date = $scope.dateFilter.getUTCDate().toString();
        var mydate = year + "-" + '0' + month + "-" + date;
        $scope.appointments.forEach(function(appointment) {
          var coords = { lat: appointment.latitude, lng: appointment.longitude };         
          if (appointment.date === mydate) {
            var marker = new google.maps.Marker({
              position: coords,
              map: map
            });
          }
        });

      });
    };

    window.scope = $scope;
  });
}());
