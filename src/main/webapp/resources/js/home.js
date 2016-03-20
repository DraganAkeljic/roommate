app.controller('GetAdsController', function($scope, $http){
	
	$http.get("/room/getAds")
	.success(function(data){
		$scope.Ads = data;
	})

});

var windowHeight = window.innerHeight;
$('.titleDiv').css("padding-top", (windowHeight * 0.15) + "px");