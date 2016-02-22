<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" media="screen" href="/room/resources/css/CreateAd.css">
	<link rel="stylesheet" media="screen" href="/room/resources/css/navSL.css">
	<link rel="stylesheet" media="screen" href="/room/resources/css/assets/jquery-ui.min.css">
	<link rel="stylesheet" media="screen" href="/room/resources/css/assets/dropzone.css">
	
	<title>Write ad (Profile)</title>
	
</head>
<body ng-app="Home">
	<div ng-controller="HomeController">
		<div ng-view></div>
	</div>
	
	<div class="main" ng-controller="CreateAdController">
		<div id="form-content" class="col-sm-6 col-sm-offset-3 panel panel-default"> 
		<h1>Create ad</h1>

		<form id="ad_room_form" class="form-horizontal col-sm-offset-1 col-sm-10" novalidate="novalidate">
			<div class="section_div">	
				<div class="section_helper">
					<h2 class="sectionH2">
						<svg version="1.1" class="svg-ico-blue" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
		                <path d="M12.7,16H3.3C1.8,16,1,15.2,1,13.6V9.1L0.2,8.3C0,8.1,0,7.9,0.2,7.7l7.5-7.5C7.9,0,8.1,0,8.3,0.2l7.5,7.5
							c0.2,0.2,0.2,0.5,0,0.7L15,9.1v4.5C15,15.2,14.3,16,12.7,16z M11,15h1.7c1.1,0,1.4-0.3,1.4-1.4V8.9c0-0.1,0-0.2,0.1-0.3L14.8,8
							L8,1.2L1.2,8l0.6,0.6c0.1,0.1,0.1,0.2,0.1,0.3v4.7c0,1,0.4,1.4,1.4,1.4H5c0,0,0,0,0,0v-3.5C5,10.3,6.3,9,8,9s3,1.3,3,2.5L11,15
							C11,15,11,15,11,15z M9.9,15H10c0,0,0,0,0,0v-3.5c0-0.6-0.9-1.5-2-1.5c-1.1,0-2,0.8-2,1.5V15c0,0,0,0,0,0H9.9z"></path>
						</svg>
						<span>Basics</span>
					</h2>
				</div>
					
				<div class="form-group">
					<label>Rent</label>
						<input ng-change="rent(myValue)" ng-model="myValue" id="rent" type="text" class="form-control" autofocus="" name="rent" placeholder="Rent (example: 100 euro)">
				</div>
				
				<div class="form-group">
					<label>Available from</label>
						<input name="available_from" class="form-control datepicker" type="text" placeholder="Click for the calendar (format: dd/mm/yyyy)" id="datepicker">
				</div>
		                
		        <div class="form-group">
					<label>Cellphone number</label>
					<input type="text" tabindex="1" class="form-control" name="mobile" placeholder="Cellphone number for contact" maxlength="20">
				</div>
			</div>
			
			<div class="section_div">
				<div class="section_helper">
					<h2 class="sectionH2">
					<svg version="1.1" class="svg-ico-blue" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
		                <path d="M6.5,18l-0.4-0.4C5.9,17.3,0,10.8,0,6.5C0,2.9,2.9,0,6.5,0C10.1,0,13,2.9,13,6.5c0,4.2-5.9,10.8-6.1,11.1L6.5,18z M6.5,1
							C3.4,1,1,3.4,1,6.5c0,3.3,4.2,8.5,5.5,10C7.8,15,12,9.7,12,6.5C12,3.4,9.6,1,6.5,1z"></path>
						<path d="M6.5,8.4C5.7,8.4,5,7.7,5,6.8s0.7-1.6,1.5-1.6S8,5.9,8,6.8S7.3,8.4,6.5,8.4z M6.5,6.3C6.2,6.3,6,6.5,6,6.8s0.2,0.5,0.5,0.5
							S7,7.1,7,6.8S6.8,6.3,6.5,6.3z"></path>
		            </svg>
						<span>Location</span>
					</h2>
				</div>	
				<div class="form-group">
					<label>City</label>
						<select ng-change="city(Value)" ng-model="Value" class="form-control" name="city">
							<option value="">--- Choose city ---</option>
							<option>Zagreb</option>
							<option>Split</option>
						</select>
				</div>
				
				<div class="form-group">
					<label>Hood</label>
					<select name="hood" class="form-control">
						<option value="">--- Choose hood ---</option>
						<option ng-repeat="h in hood">{{h}}</option>
					</select>
				</div>	
				
				<div class="form-group">
					<label>Address</label>
					<input type="text" class="form-control" name="address" placeholder="Address">
				</div>
			</div>
			
			<div class="section_div">
				<div class="section_helper">
					<h2 class="sectionH2">
					<svg version="1.1" class="svg-ico-blue" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
						<path d="M12.7,16H3.3C1.8,16,1,15.2,1,13.6V9.1L0.2,8.3C0,8.1,0,7.9,0.2,7.7l7.5-7.5C7.9,0,8.1,0,8.3,0.2l7.5,7.5
							c0.2,0.2,0.2,0.5,0,0.7L15,9.1v4.5C15,15.2,14.3,16,12.7,16z M11,15h1.7c1.1,0,1.4-0.3,1.4-1.4V8.9c0-0.1,0-0.2,0.1-0.3L14.8,8
							L8,1.2L1.2,8l0.6,0.6c0.1,0.1,0.1,0.2,0.1,0.3v4.7c0,1,0.4,1.4,1.4,1.4H5c0,0,0,0,0,0v-3.5C5,10.3,6.3,9,8,9s3,1.3,3,2.5L11,15
							C11,15,11,15,11,15z M9.9,15H10c0,0,0,0,0,0v-3.5c0-0.6-0.9-1.5-2-1.5c-1.1,0-2,0.8-2,1.5V15c0,0,0,0,0,0H9.9z"></path>
					</svg>
						<span>About accomodation</span>
					</h2>
				</div>	
					
					<div class="form-group">
					<label>Room type</label>
						<select class="form-control" name="room_type" id="room_type">
							<option value="">--- Choose room type ---</option>
							<option>Apartmant</option>
							<option>House</option>
							<option>Studio</option>
						</select>
					</div>
					
					<div class="form-group">
					<label>Number of rooms</label>
						<select class="form-control" name="room_number">
							<option value="">--- Choose number of rooms ---</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4+</option>
						</select>
					</div>
					
					<div class="form-group">
						<label>Area (in m<sup>2</sup>)</label>
						<input type="text" class="form-control" name="place_size" placeholder="Whole house/apartmant/studio (example. 56.5)">
					</div>
			
					<div class="form-group">
						<label>Set</label>
							<select name="set" id="set" class="form-control">
								<option value="">--- Choose set ---</option>
								<option>Full</option>
								<option>Partly</option>
								<option>Not set</option>
							</select>
					</div>
	                <div class="form-group">
						<label>Details</label>
						<textarea name="details" class="form-control" cols="25" rows="5" placeholder="Details about accomodation"></textarea>
					</div>
			</div>
			
			<div class="section_div">
				<div class="section_helper">
					<h2 class="sectionH2">
					<svg version="1.1" class="svg-ico-blue" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
	                <path d="M6.7,3C6.8,3,6.9,3,7,3c1.2,0,2,0.3,2.4,0.8C10.3,5,9.8,7.3,9.5,9.2c0,0.2-0.1,0.3-0.1,0.5
						C8.6,9.5,7.7,9.3,6.8,9.3C6,9.3,5.3,9.4,4.6,9.7c0-0.2-0.1-0.3-0.1-0.5C4.2,7.3,3.7,4.9,4.6,3.8C5,3.3,5.7,3,6.7,3 M1,8.5
						c0.6,0.3,0.9,1.7,1.1,4.3C1.5,11.2,0.9,9.3,1,8.5 M13,8.6c0,0.7-0.4,2.2-1,4c0-0.5,0.1-0.9,0.2-1.4C12.4,9.5,12.8,8.8,13,8.6
						M7.2,12.3c1.6,0,1.9,0.2,1.9,1.9H4.9c0-1.8,0.3-1.8,2.1-1.9L7.2,12.3 M7,2c-6,0-3.4,6.2-3.1,9.3c0.7-0.7,1.8-1,2.9-1
						c1.2,0,2.5,0.4,3.3,1C10.4,8.4,13,2,7,2C6.7,2,7.3,2,7,2L7,2z M13.2,7.4C13.2,7.4,13.2,7.4,13.2,7.4c-2.3,0-2.3,6.8-2.3,8.6
						c0.3,0,0.8,0,0.8,0S15.7,7.4,13.2,7.4L13.2,7.4z M0.8,7.4c-2.4,0,1.4,8.6,1.6,8.6c0,0,0.2,0,0.4,0c0.2,0,0.3,0,0.3,0
						C3.1,13,3.2,7.4,0.8,7.4L0.8,7.4z M7,11.3C7,11.3,6.8,11.3,7,11.3C7.1,11.3,7.1,11.3,7,11.3L7,11.3z M7.2,11.3c-0.1,0-0.1,0-0.2,0
						c-3.1,0.1-3.1,1.1-3.1,3.9c2.3,0,3.9,0,6.2,0C10.1,12.6,10.1,11.3,7.2,11.3L7.2,11.3z"></path>
					</svg>
						<span>About the room</span>
					</h2>
				</div>						
					<!-- stavi u 3 reda -->
	
					<div class="row no-gutter">
						<div class="form-group">
							<input type="checkbox" name="essentials" value="1">
							<div class="btn-group">
								<label for="essentials" class="btn btn-default">
									<span class="glyphicon glyphicon-ok"></span>
									<span>&nbsp;</span>
								</label>
								<label for="essentials" class="btn btn-default active">Essentials</label>
							</div>
						</div>
						
						<div class="form-group">
							<input type="checkbox" name="tv" value="1">
							<div class="btn-group">
								<label for="tv" class="btn btn-default">
									<span class="glyphicon glyphicon-ok"></span>
									<span>&nbsp;</span>
								</label>
								<label for="tv" class="btn btn-default active">TV</label>
							</div>
						</div>
						
						<div class="form-group">
							<input type="checkbox" name="wifi" value="1">
							<div class="btn-group">
								<label for="wifi" class="btn btn-default">
									<span class="glyphicon glyphicon-ok"></span>
									<span>&nbsp;</span>
								</label>
								<label for="wifi" class="btn btn-default active">Wi-Fi (Internet)</label>
							</div>
						</div>
						
						<div class="form-group">
							<input type="checkbox" name="desk" value="1">
							<div class="btn-group">
								<label for="desk" class="btn btn-default">
									<span class="glyphicon glyphicon-ok"></span>
									<span>&nbsp;</span>
								</label>
								<label for="desk" class="btn btn-default active">Desk</label>
							</div>
						</div>
						
						<div class="form-group">
							<input type="checkbox" name="ac" value="1">
							<div class="btn-group">
								<label for="ac" class="btn btn-default">
									<span class="glyphicon glyphicon-ok"></span>
									<span>&nbsp;</span>
								</label>
								<label for="ac" class="btn btn-default active">Air condition (AC)</label>
							</div>
						</div>
					</div>				
			</div>
		</form>
		
		<div class="col-lg-12">
			<div class="section_div">
				<div class="section_helper margin_left">
					<h2 class="sectionH2">
					<svg version="1.1" class="svg-ico-blue" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
						<path d="M7,1c1.4,0,3,0.5,3,4c0,1-0.4,2.2-0.8,3.3L9,8.7L8.9,8.8l0,0.2c0,0.1,0,0.5,0,1.1l0,0.9v0.6l0.5,0.3
							c0.1,0,0.2,0.1,0.3,0.2c0.5,0.3,1.2,0.8,2,0.9l0.1,0c0.6,0.1,0.6,0.1,1.1,1.3c0,0.1,0,0.1,0,0.1C12.3,15,9,15,7.6,15l-0.3,0L7,15
							H6.8c-1.9,0-5.3,0-5.8-0.6c0,0,0-0.1,0-0.2c0.3-1.1,0.4-1.1,1.2-1.3c0.8-0.1,1.5-0.6,2-0.9c0.1-0.1,0.2-0.1,0.3-0.2L5,11.6l0-0.5
							C5,10.9,5,9.4,5,9l0-0.4L4.8,8.4C4.1,7.5,4,6,4,5C4,1.5,5.6,1,7,1 M7,0C4.1,0,3,2,3,5c0,1.3,0.2,2.9,1,4c0,0.5,0,1.9,0,2
							c-0.3,0.2-1.2,0.9-2,1c-0.9,0.2-1.5,0.3-2,2C0,14.3,0,14.7,0.2,15c0.7,1,3.7,1,6.6,1c0.1,0,0.1,0,0.2,0c0.2,0,0.4,0,0.6,0
							c2.8,0,5.6,0,6.3-1c0.2-0.3,0.1-0.7,0-1c-0.7-1.8-1-1.8-2-2c-0.8-0.1-1.6-0.8-2-1c0-0.9,0-1.8,0-2c0.4-1.2,1-2.7,1-4
							C10.9,2,9.8,0,7,0L7,0z"></path>
					</svg>
						<span>Pictures</span>
					</h2>
				</div>
				<div class="dropzone dz-clickable" id="my-awesome-dropzone"><div class="dz-default dz-message"><span>Click or drop files here to upload</span></div></div>
                	<div class="form-group">
                    	<button class="text-center btn-custom list-group-item">Save ad</button>
                    </div>
			</div>
		</div>
			
	</div>			
	</div>
		
	<!-- JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
	<script type="text/javascript" src="/room/resources/js/assets/jquery-ui.min.js"></script>
	<!-- DROPZONE -->
	<script type="text/javascript" src="/room/resources/js/assets/dropzone.js"></script>
	<!-- ANGULAR -->
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<script src="https://code.angularjs.org/1.2.28/angular-route.min.js"></script>
	<!-- CUSTOME JS -->
	<script type="text/javascript" src="/room/resources/js/CreateAd.js"></script>
	<script type="text/javascript" src="/room/resources/js/navSL.js"></script>
</body>
</html>