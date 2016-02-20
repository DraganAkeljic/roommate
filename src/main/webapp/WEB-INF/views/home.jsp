<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/home.css" />">
	<link rel="stylesheet" href="<c:url value="/resources/css/navSL.css" />">
	
	<title>Roommate</title>
</head>
<body ng-app="Home" ng-controller="HomeController">
	
	<!-- NAVIGATION SIGNUP LOGIN SECTION -->
	<div ng-view></div>
	
	<div class="main">
		<div class="mainScreen">
		
		</div>
	</div>
	

	
	<!-- JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<script src="https://code.angularjs.org/1.2.28/angular-route.min.js"></script>
	<!-- CUSTOME JS -->
	<script src="<c:url value="/resources/js/home.js" />"></script>
	<script src="<c:url value="/resources/js/navSL.js" />"></script>
	
</body>
</html>
