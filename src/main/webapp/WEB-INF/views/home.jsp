<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/home.css" />">
	
	<title>Roommate</title>
</head>
<body ng-app="Home" ng-controller="HomeController">
	
	<div class="nav navbar-fixed-top">
		<a href="/room">Roommate</a>
		<div class="signLog">
			<span>Login</span>
			<span ng-click="signIn()">Sign in</span>
		</div>
	</div>
	<div class="main">
		<div class="mainScreen">
		
		</div>
	</div>
	
	<div class="signInDiv">
		<form id="signIn_form" class="col-sm-4 col-sm-offset-4 panel-default">	
			<div class="row">
			<button type="button" class="btn_close" ng-click="signIn()"><span aria-hidden="true">×</span></button>
			
				<input class="form-control input-lg" id="Email_reg_placeh" type="email" autocomplete="on" name="email" placeholder="Email">
			</div>
			<div class="row">					
				<input class="form-control input-lg" id="Password_reg_placeh" type="password" name="passwordReg" placeholder="Password">
			</div>
			<div class="row">
				<input class="form-control input-lg" id="First_name_placeh" type="text" autocomplete="on" name="first_name" placeholder="First name">
			</div>
			<div class="row">
				<input class="form-control input-lg" id="Last_name_placeh" type="text" autocomplete="on" name="last_name" placeholder="Last name">
			</div>

			<div class="row">
				<select class="form-control input-lg gray" name="gender">
					<option value="" id="Gender">--- Gender ---</option>
					<option id="Male">Male</option>
					<option id="Female">Female</option>
				</select>
			</div>

			</div>
				
			</form>
	</div>

	<!-- JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<!-- CUSTOME JS -->
	<script src="<c:url value="/resources/js/home.js" />"></script>
	
</body>
</html>
