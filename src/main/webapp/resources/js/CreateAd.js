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
	

