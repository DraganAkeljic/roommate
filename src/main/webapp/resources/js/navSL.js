var validationRules = {
	name: {
		required: true		
	},
	lastName: {
		required: true
	},
	email: {
		required: true
	},
	password: {
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

var app = angular.module("Home", ['ngRoute']);

app.config(function ($routeProvider){
	$routeProvider
		.when('/', {
			templateUrl: '/room/SL'
		});
});

app.controller('HomeController', function($scope, $http){
	
	$http.get("/room/checkLogin")
		.success(function(data){
			$scope.name = data.name;
			$scope.loggedIn = data.loggedIn;
			$scope.loggedOut = !data.loggedIn;
		})
	
	$scope.signInToggle = function(){
		$('.signInDiv').slideToggle("fast");
	}
	
	$scope.loginToggle = function(){
		$('.loginDiv').slideToggle("fast");
	}
	
	$scope.dob = dobList();
	
	$scope.logout = function(){
		$http.get("/room/logout")
			.success(function(data){
				$scope.UserDdl(false, true);
			})
			.error(function(err){
				var a = err;
			})
	}
	
	$scope.signup = function(){
		var form = $('#signIn_form');
		var json = convertFormToJSON(form);
		
		$('#signIn_form').validate({  
			errorClass: 'customeError',
			focusInvalid: true,
			rules: validationRules,	
		    errorPlacement: function(error, element) { }

		});
		
		if(form.valid()){
			$http({
				url: "/room/addUserInfo",
				responseType:'json',
			    method: "POST",
			    data: json,
			    headers: {
			        "Content-Type": "application/json"
			    }
			})
			.success(function(data){
				$('#messageReg').append('<div class="message">'+data.data+'</div>');
				setTimeout(function(){
					$('.message').remove();
					if(data.success)
						$scope.signInToggle();
					},4000);
			})
			.error(function(data){
				var a = data;
			});
		}
	}
	
	$scope.login = function(){	
		var form = $('#login_form');
		var json = convertFormToJSON(form);
		
		$('#login_form').validate({  
			errorClass: 'customeError',
			focusInvalid: true,
			rules: validationRules,	
		    errorPlacement: function(error, element) { }

		});
		
		if(form.valid()){
			$http({
				url: "/room/login",
				responseType:'json',
			    method: "POST",
			    data: json,
			    headers: {
			        "Content-Type": "application/json"
			    }
			})
			.success(function(data){
				$scope.name = data.name;
				$scope.UserDdl(true, false);
				sessionStorage.name = data.name;
				$('#messageLog').append('<div class="message">'+data.data+'</div>');
				setTimeout(function(){
					$('.message').remove();
					if(data.success)
						$scope.loginToggle();
					},4000);
			})
			.error(function(data){
				var a = data;
			});
		}
	}
	
	$scope.UserDdl = function(x,y){
		$scope.loggedIn = x;
		$scope.loggedOut = y;
	}
	
});

function convertFormToJSON(form){
    var array = jQuery(form).serializeArray();
    var json = {}; 
    jQuery.each(array, function() {
        json[this.name] = this.value || '';
    }); 
    return json;
}

function dobList(){
	var days = [];
	var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
	var years = [];
	var d = new Date();
	var year = d.getFullYear();
	
	for(var i = 1; i <= 31; i++){
		days.push(i);
	}
	for(var i = 1; i <= 100; i++, year--){
		years.push(year);
	}
	
	return {days:days, months: months, years: years};
}