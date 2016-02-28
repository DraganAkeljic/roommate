app.controller('CheckAdController', function($scope, $http){
	
	$http.get("/room/getAds")
	.success(function(data){
		$scope.ads = data;
	})

});