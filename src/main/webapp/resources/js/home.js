var app = angular.module("Home", []);

app.controller('HomeController', function($scope, $http){
	$scope.signIn = function(){
		$('.signInDiv').slideToggle("fast");
	}
});
