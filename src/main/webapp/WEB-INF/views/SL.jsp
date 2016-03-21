	<div class="nav navbar-fixed-top" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a href="/room">Roommate</a>
		</div>
		
		<div ng-show="loggedOut">
			<div  class="signLog navbar-collapse collapse">
				<span ng-click="loginToggle()">Login</span>
				<span ng-click="signInToggle()">Sign in</span>
			</div>
		</div>
		
		<div class="dropdown signLog" ng-show="loggedIn">
			<span class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
		    	Hi {{name}}
		    	<span class="caret"></span>
		  	</span>
		  	<ul class="dropdown-menu dropdownOver navbar-collapse" aria-labelledby="dropdownMenu1">
		    	<li><a href="/room">Home</a></li>
		    	<li><a href="/room/Account">Account</a></li>
		    	<li><a href="/room/myAds">My ads</a></li>
		    	<li role="separator" class="divider"></li>
		    	<li ng-click="logout()"><a href="#">Log out</a></li>
		 	 </ul>
		</div>
	</div>
	

	
	<div class="signInDiv">
		<form id="signIn_form" class="col-sm-4 col-sm-offset-4 panel-default">	
			<div class="row">
				<button type="button" class="btn_close" ng-click="signInToggle()"><span aria-hidden="true">×</span></button>
			</div>
			<div class="row">
				<input class="form-control input-lg" type="email" autocomplete="on" name="email" placeholder="Email">
			</div>
			<div class="row">					
				<input class="form-control input-lg" type="password" name="password" placeholder="Password">
			</div>
			<div class="row">
				<input class="form-control input-lg" type="text" autocomplete="on" name="name" placeholder="First name">
			</div>
			<div class="row">
				<input class="form-control input-lg" type="text" autocomplete="on" name="lastName" placeholder="Last name">
			</div>

			<div class="row">
				<select class="form-control input-lg gray" name="gender">
					<option value="">--- Gender ---</option>
					<option>Male</option>
					<option>Female</option>
				</select>
			</div>
			<div class="row">
				<div class="form-control input-lg DOBheight">
					<span>Date of birth</span>
					<div class="DOB">
						<select name="day" class="form-control input-lg no_border gray">
							<option value="">Day</option>
							<option ng-repeat="day in dob.days">{{day}}</option>
						</select>
						<select name="month" class="form-control input-lg no_border gray">
							<option value="">Month</option>
							<option ng-repeat="month in dob.months">{{month}}</option>
						</select>
						<select name="year" class="form-control input-lg no_border gray">
							<option>Year</option>
							<option ng-repeat="year in dob.years">{{year}}</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<button class="form-control btn btn-primary input-lg" ng-click="signup()">Sign up</button>
			</div>
			<div id="messageReg"></div>
		</form>
	</div>
	
	<div class="loginDiv">
		<form id="login_form" class="col-sm-4 col-sm-offset-4 panel-default">
			<div class="row">
				<button type="button" class="btn_close" ng-click="loginToggle()"><span aria-hidden="true">×</span></button>
			</div>
			<div class="row">
				<input class="form-control input-lg" type="email" autocomplete="on" name="email" placeholder="Email">
			</div>
			<div class="row">					
				<input class="form-control input-lg" type="password" name="password" placeholder="Password">
			</div>
			<div class="row">
				<button class="form-control btn btn-primary input-lg" ng-click="login()">Login</button>
			</div>
		<div id="messageLog"></div>
		</form>
	</div>