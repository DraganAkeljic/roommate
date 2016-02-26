var validationRulesSL = {
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
			rules: validationRulesSL,	
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
			rules: validationRulesSL,	
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

app.controller('CreateAdController', function($scope, $http){
	var hoodZg = ["Blato", "Borogaj", "Borovje", "Botinec", "Brestje", "Brezovica", "Bukovac", "Buzin", "Centar", "Črnomerec", "Čulinec", "Cvjetno naselje", "Dubec", "Dubrava", "Dugave", "Ferenščica", "Folnegovićevo", "Gajnice", "Gračani", "Ivanja Reka", "Jakuševec", "Jankomir", "Jarun", "Kajzerica", "Kanal", "Klara", "Knežija", "Kruge", "Ksaver", "Kustošija", "Kvatrić", "Lanište", "Lučko", "Ljubljanica", "Maksimir", "Malešnica", "Markuševec", "Medveščak", "Mikulići", "Mlinovi", "Peščenica", "Podsused", "Poljanice", "Prečko", "Ravnice", "Remete", "Remetinec", "Retkovec", "Rudeš", "Savica", "Savski gaj", "Šestine", "Sesvete", "Sigečica", "Siget", "Sloboština", "Sopot", "Špansko", "Središće", "Srednjaci", "Stenjevec", "Stupnik", "Sveta Nedelja", "Svetice", "Travno", "Trešnjevka", "Trnava", "Trnovčica", "Trnsko", "Trnje", "Trokut", "Utrina", "Veliko Polje", "Volovčica", "Voltino", "Vrapče", "Vrbani", "Vrbik", "Vukomorec", "Zapruđe", "Zavrtnica", "Žitnjak"];
	var hoodSt = ["Bačvice", "Bilice", "Blatine", "Bol", "Brda", "Dobri", "Dračevac", "Dragovode", "Dujilovo", "Dujmovača", "Firule", "Glavičine", "Grad", "Gripe", "Kacunar", "Kila", "Kman", "Kopilica", "Križine", "Lokve", "Lora", "Lovret", "Lovrinac", "Lučac", "Manuš", "Mejaši", "Meje", "Mertojak", "Neslanovac", "Pazdigrad", "Plokite", "Poljud", "Pujanke", "Radunica", "Ravne njive", "Sirobuja", "Skalice", "Škrape", "Smokovik", "Smrdečac", "Spinut", "Stinice", "Sućidar", "Sukojišan", "Sustipan", "Table", "Trstenik", "Veli Varoš", "Visoka", "Vranjic", "Žnjan", "Zvončac"];
	
	$scope.rent = function(rent){
		if(!rent.match(/^[0-9]+$/))
			$('#rent').addClass("customeError");
		else
			$('#rent').removeClass("customeError");
	}
	
	$scope.mobile = function(num){
		if(num.match(/[a-zA-Z]/)) 
			$('#mobile').addClass("customeError");
		else
			$('#mobile').removeClass("customeError");
	}
	
	$scope.city = function(city){
		if(city === "Zagreb")
			$scope.hood = hoodZg;
		else if(city === "Split")
			$scope.hood = hoodSt;
		else
			$scope.hood = "";
	}
	
	$scope.saveAd = function(){
		var form = $('#createAd');
		var json = convertFormToJSON(form);
		
		$('#createAd').validate({  
			errorClass: 'customeError',
			focusInvalid: true,
			rules: validationRulesCreateAd,	
		    errorPlacement: function(error, element) { }

		});
		
		if(form.valid()){
			$http({
				url: "/room/createAd",
				responseType:'json',
			    method: "POST",
			    data: json,
			    headers: {
			        "Content-Type": "application/json"
			    }
			})
			.success(function(data){
				myDropzone.processQueue();
			})
			.error(function(data){
				var a = data;
			});
		}
	}

});

app.controller('CheckAdController', function($scope, $http){
	
	$http.get("/room/CheckAd")
	.success(function(data){
		$scope.ads = data;
	})

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