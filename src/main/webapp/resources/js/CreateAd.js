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
	

});