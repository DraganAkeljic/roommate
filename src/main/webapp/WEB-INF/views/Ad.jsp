<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" media="screen" href="/room/resources/css/navSL.css">
	<link rel="stylesheet" media="screen" href="/room/resources/css/Ad.css">
	<link rel="stylesheet" media="screen" href="/room/resources/css/assets/bootstrap-carousel.min.css">
<title>Ad</title>
</head>
<body ng-app="Home">
	<div ng-controller="HomeController">
		<%@ include file="SL.jsp" %>
	</div>
	<div ng-controller="AdController">
		<div class="modal fade modal-fullscreen force-fullscreen" id="gallery" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content" id="modal-content">
					<div class="modal-body" id="modal-body">
						<div id="myCarousel" class="carousel slide carousel-fit" >
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
								<li data-target="#myCarousel" data-slide-to="3"></li>
								<li data-target="#myCarousel" data-slide-to="4"></li>
							</ol> 
							
							<div class="carousel-inner">
								<div class="item" ng-repeat="img in AdData.imgs">
									<img class="imgH" ng-src="{{img}}"/>
								</div>
							</div>
							<a class="left carousel-control" href="#myCarousel" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> </a>
							<a class="right carousel-control" href="#myCarousel" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> </a>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="main">
			<div class="main-img" id="images">
				<img class="cover_img" ng-src="{{AdData.imgs[0]}}" ng-click="gallery()"/>
			</div>
			<div class="summary"> <span class="title"> {{AdData.title}} </span> </div>
			<div class="contact_info_div">
				<div class="contact">
					<div class="contact_info"> <span> Contact info </span> </div>
					<ul>
						<li>User: {{AdData.name}} </li>
						<li>Mobile: {{AdData.mobile}} </li>
						<li>Email: {{AdData.email}} </li>
					</ul>
				</div>
			</div>
			<div class="form-horizontal col-sm-offset-4 col-xs-offset-1 about">
				<div class="section_div">
					<div class="section_helper">
						<h2 class="sectionH2">
							<svg version="1.1" class="svg-ico-orange" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
								<path d="M9.7,16H3.3C0.7,16,0,15.3,0,12.7V3.3C0,0.7,0.7,0,3.3,0v0.5V0l4.8,0L13,5v7.7C13,15.3,12.3,16,9.7,16z
								 M3.3,1L3.3,1C1.2,1,1,1.2,1,3.3v9.4C1,14.8,1.2,15,3.3,15h6.5c1.9,0,2.3-0.2,2.3-2.3V6L9.2,6C8.4,6,7.8,6,7.4,5.6
								C7.1,5.3,7,4.9,7,4.3V1L3.3,1z M8,1.3v2.9c0,0.5,0.1,0.6,0.1,0.6C8.2,5,8.7,5,9.1,5l2.5,0L8,1.3z M9.5,12H3v-1h6.5V12z M9.5,9H3V8
								h6.5V9z M4.8,6H3V5h1.8V6z"></path>
							</svg>
							<span> Details </span>
						</h2>
					</div>
					<div class="details">
						<span> {{AdData.details}} </span>
					</div>
				</div>
				<div class="section_div">
					<div class="section_helper">
						<h2 class="sectionH2">
						<svg version="1.1" class="svg-ico-orange" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
							<path d="M6.5,18l-0.4-0.4C5.9,17.3,0,10.8,0,6.5C0,2.9,2.9,0,6.5,0C10.1,0,13,2.9,13,6.5c0,4.2-5.9,10.8-6.1,11.1L6.5,18z M6.5,1
								C3.4,1,1,3.4,1,6.5c0,3.3,4.2,8.5,5.5,10C7.8,15,12,9.7,12,6.5C12,3.4,9.6,1,6.5,1z"></path>
							<path d="M6.5,8.4C5.7,8.4,5,7.7,5,6.8s0.7-1.6,1.5-1.6S8,5.9,8,6.8S7.3,8.4,6.5,8.4z M6.5,6.3C6.2,6.3,6,6.5,6,6.8s0.2,0.5,0.5,0.5
								S7,7.1,7,6.8S6.8,6.3,6.5,6.3z"></path>
						</svg>
							<span>Location</span>
						</h2>
					</div>			
					<div>
						<ul>
							<li> City: {{AdData.city}}</li>
							<li> Hood: {{AdData.hood}}</li>
							<li> Address: {{AdData.address}}</li>
						</ul>
					</div>
				</div>
				<div class="section_div">
					<div class="section_helper">
						<h2 class="sectionH2">
						<svg version="1.1" class="svg-ico-orange" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
							<path d="M12.7,16H3.3C1.8,16,1,15.2,1,13.6V9.1L0.2,8.3C0,8.1,0,7.9,0.2,7.7l7.5-7.5C7.9,0,8.1,0,8.3,0.2l7.5,7.5
								c0.2,0.2,0.2,0.5,0,0.7L15,9.1v4.5C15,15.2,14.3,16,12.7,16z M11,15h1.7c1.1,0,1.4-0.3,1.4-1.4V8.9c0-0.1,0-0.2,0.1-0.3L14.8,8
								L8,1.2L1.2,8l0.6,0.6c0.1,0.1,0.1,0.2,0.1,0.3v4.7c0,1,0.4,1.4,1.4,1.4H5c0,0,0,0,0,0v-3.5C5,10.3,6.3,9,8,9s3,1.3,3,2.5L11,15
								C11,15,11,15,11,15z M9.9,15H10c0,0,0,0,0,0v-3.5c0-0.6-0.9-1.5-2-1.5c-1.1,0-2,0.8-2,1.5V15c0,0,0,0,0,0H9.9z"></path>
						</svg>
							<span>About accomodation</span>
						</h2>
					</div>			
					<div>
						<ul>
							<li> Room type: {{AdData.roomType}} </li>
							<li> Number of Rooms: {{AdData.roomNum}} </li>
							<li> Quadrature: {{ AdData.placeSize}} <sup>2</sup> </li>
						</ul>
					</div>
				</div>
				<div class="section_div">
					<div class="section_helper">
						<h2 class="sectionH2">
							<svg version="1.1" class="svg-stroke-orange" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
								<circle stroke-linecap="round" stroke-miterlimit="2" cx="8" cy="8" r="7.5"></circle>
								<circle stroke-miterlimit="2" cx="8" cy="12" r="0.5"></circle>
								<path stroke-linecap="round" stroke-miterlimit="2" d="M8.5,9.1c0,0.2-0.2,0.4-0.4,0.4H7.9
								c-0.2,0-0.4-0.2-0.4-0.4V3.9c0-0.2,0.2-0.4,0.4-0.4h0.2c0.2,0,0.4,0.2,0.4,0.4V9.1z"></path>
	
	           				 </svg>
							<span>Rent</span>
						</h2>
					</div>			
					<div>
						<ul>
							<li>Rent: {{AdData.rent}} </li>
							<li>Available from: {{AdData.available}} </li>
						</ul>
					</div>
			</div>
			</div>
		</div>
	</div>
	
	<!-- JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<!-- ANGULAR -->
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<!-- CUSTOME JS -->
	<script type="text/javascript" src="/room/resources/js/navSL.js"></script>
	<script type="text/javascript" src="/room/resources/js/Ad.js"></script>
</body>
</html>