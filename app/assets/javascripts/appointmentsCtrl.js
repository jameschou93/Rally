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
    $scope.createAppt = function(upTitle, upDate, upStart, upEnd, address, city, state, zip_code) {
      var params = {title: upTitle, date: upDate, start_time:  upStart, end_time: upEnd, address: address, city: city, state: state, zip_code: zip_code  };
      var url = "/api/v1/appointments";
      console.log(url);
      $http.post(url, params).then(function(response) {
        // var index = $scope.appointments.indexOf(appointment);
        // $scope.appointments[index] = response.data;
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
    $scope.reveal = function() {
      document.getElementById("models").style.visibility = "visible";

    };
    $scope.show = function(appointment) {
      $scope.selectedAppt = appointment;
      var date = new Date(appointment.date);
      $scope.selectedDate = new Date(date.setDate(date.getDate() + 1));
      $scope.selectStart = 1378409640;
      console.log($scope.selectedDate);
      document.getElementById("show").style.visibility = "visible";
    };
    window.$scope = $scope;
  });
}());


