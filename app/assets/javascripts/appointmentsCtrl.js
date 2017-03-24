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
    $scope.updateAppt = function(upTitle, upDate, upStart, upEnd, appointment) {
      console.log(appointment);
       var params = {title: upTitle, date: upDate, start_time:  upStart, end_time: upEnd};
       var url = "/api/v1/appointments/" + appointment;
       console.log(url);
      $http.patch(url, params).then(function(response) {
         var index = $scope.appointments.indexOf(appointment);
         $scope.appointments[index] = response.data;
         $scope.upEnd = null;
         $scope.upStart = null;
         $scope.upDate = null;
         $scope.upTitle = null;
         $scope.errors = null;
       }, function(error) {
         console.log(error);
         $scope.errors = error.data.errors;
       });
    };
    window.$scope = $scope;
  });
}());
