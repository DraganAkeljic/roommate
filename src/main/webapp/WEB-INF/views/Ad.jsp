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
<title>Insert title here</title>
</head>
<body ng-app="Home">
	<div ng-controller="HomeController">
		<%@ include file="SL.jsp" %>
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