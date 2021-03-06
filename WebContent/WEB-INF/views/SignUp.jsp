<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Sign Up Form</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css" />
	 
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Register Form</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" action="SignUp" method="post">
							<fieldset>
								<div class="form-group">

									<label class="col-lg-2 control-label">Full Name</label>
									<div class="col-lg-10">
										<input type="text" name="fullname" class="form-control"
											placeholder="Enter Full name"
											pattern="^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$"
											title=" username is 8-20 characters long ">
									</div>
								</div>
								<div class="form-group">

									<label class="col-lg-2 control-label">Email</label>
									<div class="col-lg-10">
										<input type="text" name="email" class="form-control"
											placeholder="Enter your Email"
											pattern="(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])"
											title=" email address ">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword" class="col-lg-2 control-label">Password</label>
									<div class="col-lg-10">
										<input type="password" name="password" class="form-control"
											placeholder="Password"
											pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"
											title="Password complexity should be at least 6 letters and have at least one capital letter, one small letter, one number"
											id="txtNewPassword">
									</div>
								</div>

								<div class="form-group">
									<label for="inputPassword" class="col-lg-2 control-label">Repeat Password</label>
									<div class="col-lg-10">
										<input type="password" name="passwordRepeat"
											class="form-control" placeholder="Repeat Password"
											pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"
											title="Password complexity should be at least 6 letters and have at least one capital letter, one small letter, one number"
											id="txtConfirmPassword" onChange="checkPasswordMatch();" />
									</div>
								</div>

								<div class="registrationFormAlert" id="divCheckPasswordMatch" style="color:red;"></div>

									<div class="form-group">
										<label class="col-lg-2 control-label">Gender</label>
										<div class="col-lg-10">
											<div class="radio">
												<label> <input type="radio" name="gender" value="1"
													checked> Male
												</label> <label> <input type="radio" name="gender" value="2">
													FeMale
												</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="select" class="col-lg-2 control-label">State</label>
										<div class="col-lg-10">
											<select class="form-control" id="select" name="state">
												<option value="AL">Alabama</option>
												<option value="AK">Alaska</option>
												<option value="AZ">Arizona</option>
												<option value="AR">Arkansas</option>
												<option value="CA">California</option>
												<option value="CO">Colorado</option>
												<option value="CT">Connecticut</option>
												<option value="DE">Delaware</option>
												<option value="DC">District of Columbia</option>
												<option value="FL">Florida</option>
												<option value="GA">Georgia</option>
												<option value="HI">Hawaii</option>
												<option value="ID">Idaho</option>
												<option value="IL">Illinois</option>
												<option value="IN">Indiana</option>
												<option value="IA" selected>Iowa</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
												<option value="LA">Louisiana</option>
												<option value="ME">Maine</option>
												<option value="MD">Maryland</option>
												<option value="MA">Massachusetts</option>
												<option value="MI">Michigan</option>
												<option value="MN">Minnesota</option>
												<option value="MS">Mississippi</option>
												<option value="MO">Missouri</option>
												<option value="MT">Montana</option>
												<option value="NE">Nebraska</option>
												<option value="NV">Nevada</option>
												<option value="NH">New Hampshire</option>
												<option value="NJ">New Jersey</option>
												<option value="NM">New Mexico</option>
												<option value="NY">New York</option>
												<option value="NC">North Carolina</option>
												<option value="ND">North Dakota</option>
												<option value="OH">Ohio</option>
												<option value="OK">Oklahoma</option>
												<option value="OR">Oregon</option>
												<option value="PA">Pennsylvania</option>
												<option value="RI">Rhode Island</option>
												<option value="SC">South Carolina</option>
												<option value="SD">South Dakota</option>
												<option value="TN">Tennessee</option>
												<option value="TX">Texas</option>
												<option value="UT">Utah</option>
												<option value="VT">Vermont</option>
												<option value="VA">Virginia</option>
												<option value="WA">Washington</option>
												<option value="WV">West Virginia</option>
												<option value="WI">Wisconsin</option>
												<option value="WY">Wyoming</option>
											</select>
										</div>
									</div>

									<div class="form-group">
										<label class="col-lg-2 control-label">ZipCode</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" name="zipcode"
												placeholder="Enter Zip Code" pattern="[0-9]{5}"
												title=" 5 digit zip code ">
										</div>
									</div>

									<div class="form-group">
										<label class="col-lg-2 control-label">Street</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" name="street"
												placeholder="Enter Street Address">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label">City</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" name="city"
												placeholder="Enter your city" pattern="^([A-Za-z]{3,200})$"
												title=" city name formed by letters">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label">Birth-Year</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" name="birthyear"
												placeholder="Enter birth Year (YYYY)" pattern="19[0-9]{2}"
												title=" only members with 18+ years old are allowed to use the application">
										</div>
									</div>

									<div class="form-group">
										<div class="col-lg-10 col-lg-offset-2">
											<button type="reset" class="btn btn-default">Cancel</button>
											<button type="submit" class="btn btn-primary">Submit</button>
										</div>
									</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
	
	<%--<script src="checkPassword.js" type="text/javascript"></script> --%>
	<script>
//  the JavaScript code for checking if the two input password are the same
	 console.log("check Password file is triggered")
	function checkPasswordMatch() {
	    var password = $("#txtNewPassword").val();
	    var confirmPassword = $("#txtConfirmPassword").val();

	    if (password != confirmPassword)
	        $("#divCheckPasswordMatch").html("Passwords do not match!");
	    else
	        $("#divCheckPasswordMatch").html("Passwords match.");
	    console.log("check Password methd is triggered")
	}

	$(document).ready(function () {
	   $("#txtNewPassword, #txtConfirmPassword").keyup(checkPasswordMatch);
	});
	/**
	 * 
	 */
	</script>

</body>
</html>