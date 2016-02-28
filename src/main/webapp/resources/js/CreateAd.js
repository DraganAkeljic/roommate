var validationRulesCreateAd = {
	rent: {
		required: true		
	},
	available_from: {
		required: true
	},
	mobile: {
		required: true
	},
	city: {
		required: true
	},
	hood: {
		required: true
	},
	address: {
		required: true
	},
	room_type: {
		required: true
	},
	room_number: {
		required: true
	},
	place_size: {
		required: true		
	},
	set: {
		required: true
	}
};
	
Dropzone.autoDiscover = false;
var myDropzone = new Dropzone("#my-awesome-dropzone", {
	  autoProcessQueue: false,
	  url:'/room/uploadImgs',
	  paramName: "img", // The name that will be used to transfer the file
	  maxFilesize: 4, // MB
	  maxFiles: 5,
	  parallelUploads: 5,
	  acceptedFiles: "image/jpeg, image/jpg, image/png"
});

myDropzone.on("queuecomplete", function () {
	setTimeout(function(){
		window.location = '/room';
	},4000);

});

$('#datepicker').datepicker({
	minDate: "+0d", //just today
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
	

