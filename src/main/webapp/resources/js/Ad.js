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
		$scope.setGallery();
		
	})
	.error(function(data){
		var a = data;
	});
	
	$scope.gallery = function(){
		$('#gallery').modal('show');
		$('.item').removeClass("active");
		$('.item').first().addClass("active");
	}
	
	$scope.setGallery = function(){
        var windowHeight = window.innerHeight;
        var imgHeight = windowHeight * 0.75;
        var marginTop = (windowHeight - imgHeight) / 2 - 10;
        $('#modal-body').css("margin-top", marginTop + "px");
	}
});

