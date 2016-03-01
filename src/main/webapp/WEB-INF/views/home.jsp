<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/home.css" />">
	<link rel="stylesheet" href="<c:url value="/resources/css/navSL.css" />">
	<link rel="stylesheet" href="<c:url value="/resources/css/assets/animate.css" />">
	
	<title>Roommate</title>
</head>
<body ng-app="Home">
	
	<!-- NAVIGATION SIGNUP LOGIN SECTION -->
	<div ng-controller="HomeController">
		<%@ include file="SL.jsp" %> 
	</div>
	
	<div class="main">
		<div class="mainScreen">
			<div class="text-center titleDiv">
				<span class="title animated zoomIn dd1">R</span>
				<span class="title animated zoomIn dd2">O</span>
				<span class="title animated zoomIn dd3">O</span>
				<span class="title animated zoomIn dd4">M</span>
				<span class="title animated zoomIn dd5">M</span>
				<span class="title animated zoomIn dd6">A</span>
				<span class="title animated zoomIn dd7">T</span>
				<span class="title animated zoomIn dd8">E</span>
			</div>
			<div class="text-center">
				<a href="/room/CheckAd" class="btn-plain animated bounceInDown ddbtns" id="Check">Check ads</a>
				<a href="/room/CreateAd" class="btn-plain animated bounceInDown ddbtns" id="Create">Create ad</a>
			</div>			
		</div>
		
		<div class="last_ads" ng-controller="GetAdsController">
			<h2 class="white text-center">Last uploaded ads</h2>
			<div class="ads_list">
				<div ng-repeat="ad in Ads" class="col-xs-2">
					<div class="text-center">
						<div class="img_div">
							<a href="{{ ad.url }}">
								<img ng-src="{{ ad.img }}" class="ad_img"/>
							</a>
						</div>
						<div class="title_div">
							<a href="{{ ad.url }}"> <span class="ad_title"> {{ ad.title }} </span></a>
							<div>
								<span class="ad_roomType">Room type:  {{ ad.roomType }} </span>
							</div>
							<div>
								<span class="ad_date">Uploaded: {{ ad.created }}</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	
	<!-- JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<!-- ANGULAR -->
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<script src="https://code.angularjs.org/1.2.28/angular-route.min.js"></script>
	<!-- CUSTOME JS -->
	<script src="<c:url value="/resources/js/navSL.js" />"></script>
	<script src="<c:url value="/resources/js/home.js" />"></script>
	
</body>
</html>
