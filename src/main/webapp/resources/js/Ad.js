var href = window.location.href;
var url = href.split('room/')[1];

app.controller('AdController', function($scope, $http){

	$http({
		url: "/room/getAd",
		responseType:'json',
	    method: "POST",
	    data: url,
	    headers: {
	        "Content-Type": "text/plain"
	    }
	})
	.success(function(data){
		$scope.AdData = data;
	})
	.error(function(data){
		var a = data;
	});
});

