var validationRulesProfile = {
	name: {
		required: true		
	},
	lastName: {
		required: true
	},
	gender: {
		required: true
	},
	day: {
		required: true
	},
	month: {
		required: true
	},
	year: {
		required: true
	}
};

app.controller('AccountController', function($scope, $http){
	
	$http.get("/room/getUserInfo")
	.success(function(data){
		$scope.info = data;
	})
	
	$scope.show = true;
	$scope.edit = false;
	$scope.passEmail = false;
	$scope.showProfile = true;
	
	$scope.profile = function(){
		$scope.showHide(true, false, false, true);
	}
	
	$scope.editProfile = function(){
		$scope.showHide(false, true, false, true);
	}
	
	$scope.pass = function(){
		$scope.showHide(false, false, true, false);
	}
	
	$scope.showHide = function(b1, b2, b3, b4){
		$scope.showProfile = b4;
		$scope.show = b1;
		$scope.edit = b2;
		$scope.passEmail = b3;
	}
	
	$scope.save = function(){
		var form = $('#profile_form');
		var json = convertFormToJSON(form);
		
		$('#profile_form').validate({  
			errorClass: 'customeError',
			focusInvalid: true,
			rules: validationRulesProfile,	
		    errorPlacement: function(error, element) { }

		});
		
		if(form.valid()){
			$http({
				url: "/room/updateProfile",
				responseType:'json',
			    method: "POST",
			    data: json,
			    headers: {
			        "Content-Type": "application/json"
			    }
			})
			.success(function(data){
				window.location.reload();
			})
			.error(function(data){
				var a = data;
			});
		}
	}
});