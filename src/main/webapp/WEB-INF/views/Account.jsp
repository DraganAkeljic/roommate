<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" media="screen" href="/room/resources/css/navSL.css">
	<link rel="stylesheet" media="screen" href="/room/resources/css/Account.css">

	<title>Account Roommate</title>
</head>
<body ng-app="Home">

	<div ng-controller="HomeController">
		<%@ include file="SL.jsp" %> 
	</div>
	
	<div class="container-fluid" ng-controller="AccountController">
		<div class="col-lg-3">
			<ul class="nav-pills nav-stacked">
				<li class="Profilebtns activeListElem" ng-click="profile()">Profile</li>
				<li class="Profilebtns" ng-click="editProfile()">Edit Profile</li>
				<li class="Profilebtns" ng-click="pass()">Password & Email</li>
				<li class="Profilebtns" ng-click="delete()">Delete Account</li>
			</ul>
			<div class="profileImg nav-stacked nav-pills">
				<img ng-src="{{img}}" class="img" />
				<form id="profileImg" ng-click="changeImg()">
					<label for="upload_img" class="text-center upload_img Profilebtns list-group-item">Change picture</label>
					<input type="file" name="profile" id="upload_img" required />
				</form>
			</div>
		</div>
		
		<div id="editContainer" class="col-lg-7">	
			<div ng-show="showProfile">
				<form id="profile_form" class="form-horizontal col-sm-offset-1 col-sm-10">
			
				<div class="form-group row borderBlack">
					<label class="labels">Name</label>
					<label class="inputName inputLbl" ng-show="show">{{info.name}}</label>
					<input type="text" class="input-sm w61" ng-show="edit" name="name" ng-value="info.name" autofocus/>
				</div>
				
				<div class="form-group row borderBlack">
					<label class="labels">Last name</label>
					<label class="inputLbl inputLastName" ng-show="show">{{info.lastName}}</label>
					<input type="text" class="input-sm w61" name="lastName" ng-value="info.lastName" ng-show="edit"/>
				</div>
				
				<div class="form-group row borderBlack">
					<label class="labels">Gender</label>
					<label class="inputLbl inputGender" ng-show="show">{{info.gender}}</label>
						<select name="gender" class="input-sm w61" ng-show="edit">
							<option>Male</option>
							<option>Female</option>
						</select>						
				</div>
				
				<div class="form-group row borderBlack" ng-controller="HomeController">
					<label class="labels">Date of birth</label>
					<label class="inputLbl inputDOB" ng-show="show">{{info.dob}}</label>
						<select name="day" class="input-sm w20" ng-show="edit">
							<option value="">Day</option>
							<option ng-repeat="day in dob.days">{{day}}</option>
						</select>
						<select name="month" class="input-sm w20" ng-show="edit">
							<option value="">Month</option>
							<option ng-repeat="month in dob.months">{{month}}</option>
						</select>
						<select name="year" class="input-sm w20" ng-show="edit">
							<option value="">Year</option>
							<option ng-repeat="year in dob.years">{{year}}</option>
						</select>
				</div>

				<div class="form-group row">				
					<label class="edit" ng-show="edit" style="padding-right: 10px;" ng-click="save()">Save</label>
				</div>
			</form>
			</div>
			
			<div ng-show="passEmail">
				<div class="form-horizontal col-sm-offset-1 col-sm-10">
					<div class="form-group row borderBlack">
						<label class="labels">Email</label>
						<label class="inputLbl inputEmail"></label>
						<input type="email" id="inputEmail" class="hideInput" name="email"/>
						<label class="edit" id="emailEdit"></label>
						<label class="edit hideInput" id="emailCancel"></label>
						<label class="edit hideInput" id="emailSave" style="padding-right: 10px;"></label>
					</div>
					
					<div class="form-group row borderBlack">
						<label class="labels" id="pass"></label>
						<label class="labels inputPass"></label>
						<input type="password" class="hideInput" id="oldPass" name="oldPass" />
						<input type="password" class="hideInput" id="newPass" name="newPass" />
						<label class="edit" id="passEdit"></label>
						<label class="edit hideInput" id="passCancel"></label>
						<label class="edit hideInput" id="passSave" style="padding-right: 10px;"></label>
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
	<!-- CUSTOME JS -->
	<script type="text/javascript" src="/room/resources/js/navSL.js"></script>
	<script type="text/javascript" src="/room/resources/js/Account.js"></script>
</body>
</html>