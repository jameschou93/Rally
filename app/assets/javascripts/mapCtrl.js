/* global google, angular*/
(function() {
  "use strict";
// appointments api data
  angular.module("app").controller("mapCtrl", function($scope, $http, $filter) {      
    $scope.setup = function() {
      $http.get("/api/v1/appointments.json").then(function(response) {
        console.log(response.data);
        $scope.appointments = response.data;
      });
    };
// date filter model
    $scope.date = $filter("date")(Date.now(), 'yyyy-MM-dd');
    $scope.dateFilter = new Date;
    $scope.mapIndex = function() {
      $http.get("/api/v1/appointments.json").then(function(response) {
        console.log(response.data);
        $scope.appointments = response.data;
        var map;
// create map
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 12,
          center: {lat: 40.7091841, lng: -74.0122789}
        });
        var year = $scope.dateFilter.getFullYear().toString();
        var month = ($scope.dateFilter.getUTCMonth() + 1).toString();
        var date = $scope.dateFilter.getUTCDate().toString();
        var mydate = year + "-" + '0' + month + "-" + date;
        var markers = [];
        $scope.appointments.forEach(function(appointment) {
          var coords = { lat: appointment.latitude, lng: appointment.longitude };         
          // if appointment date is on filter date then show marker

          if (appointment.date === mydate) {
            var marker = new google.maps.Marker({
              position: coords,
              map: map,
              title: appointment.title
            });
            markers.push(coords);
            var info = new google.maps.InfoWindow({
              content: appointment.title,           
            });
            var mcOptions = {gridSize: 50, maxZoom: 15, imagePath: 'images/m'};
            var mc = new google.maps.MarkerClusterer(map, markers, mcOptions);

            marker.addListener('click', function() {
              info.open(map, marker);
            });  
          }
        });

      });
    };

    window.scope = $scope;
  });
}());
