var app = angular.module("WriteProfile", ['ngRoute']);

app.config(function ($routeProvider){
	$routeProvider
		.when('/', {
			templateUrl: '/room/SL'
		});
});

app.controller('WriteProfileController', function($scope, $http){
	
	$http.get("/room/checkLogin")
		.success(function(data){
			$scope.name = data.name;
			$scope.loggedIn = data.loggedIn;
			$scope.loggedOut = !data.loggedIn;
		});
});