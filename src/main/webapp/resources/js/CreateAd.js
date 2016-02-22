var validationRulesAd = {
	rent: {
		required: true		
	},
	available_from: {
		required: true
	},
	city: {
		required: true
	},
	hood: {
		required: true
	},
	room_type: {
		required: true
	}
};

Dropzone.autoDiscover = false;
$(document).ready(function() {
	
	$('#datepicker').datepicker({
		minDate: "+0d", //just today
	});
	
	var myDropzone = new Dropzone("#my-awesome-dropzone", {
		  autoProcessQueue: false,
		  url:'uploads/upload_room.php',
		  paramName: "room", // The name that will be used to transfer the file
		  maxFilesize: 4, // MB
		  maxFiles: 5,
		  parallelUploads: 5,
		  acceptedFiles: "image/jpeg, image/jpg, image/png"
	
	});
	
	myDropzone.on("queuecomplete", function () {
	    window.location = 'index.html';
	});
	
	//myDropzone.processQueue();// u success metodi da se posalju slike
});