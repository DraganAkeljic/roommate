<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" media="screen" href="/room/resources/css/WriteProfile.css">
	<link rel="stylesheet" media="screen" href="/room/resources/css/navSL.css">
<title>Write ad (Profile)</title>
</head>
<body ng-app="Home" ng-controller="HomeController">
	
	<div ng-view></div>
	
	<div class="main">
		<div id="form-content" class="col-sm-6 col-sm-offset-3 panel panel-default"> 
		<h1>Create ad</h1>

		<form id="ad_room_form" class="form-horizontal col-sm-offset-1 col-sm-10" novalidate="novalidate">
		
		</form>
		
			
	</div>			
	</div>
		
	<!-- JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
	<!-- ANGULAR -->
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<script src="https://code.angularjs.org/1.2.28/angular-route.min.js"></script>
	<!-- CUSTOME JS -->
	<script type="text/javascript" src="/room/resources/js/WriteProfile.js"></script>
	<script type="text/javascript" src="/room/resources/js/navSL.js"></script>
</body>
</html>