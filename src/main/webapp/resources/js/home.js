app.controller('GetAdsController', function($scope, $http){
	
	$http.get("/room/getAds")
	.success(function(data){
		$scope.Ads = data;
	})

});