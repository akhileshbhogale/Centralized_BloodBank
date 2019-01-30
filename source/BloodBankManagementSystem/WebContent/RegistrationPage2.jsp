<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

  <!-- 
 <link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.validate-1.17.0.js"></script>
  
  <script>
  $(document).ready(function(){
		alert("bye");
		
		$(function() {
			$.validator.setDefaults({
		    errorClass: 'help-block',
		    highlight: function(element) {
		      $(element)
		        .closest('.form-group')
		        .addClass('has-error');
		    },
		    unhighlight: function(element) {
		      $(element)
		        .closest('.form-group')
		        .removeClass('has-error');
		    },
		    errorPlacement: function (error, element) {
		      if (element.prop('type') === 'checkbox') {
		        error.insertAfter(element.parent());
		      } else {
		        error.insertAfter(element);
		      }
		    }
		  });
			alert("bye");
		  $.validator.addMethod('strongPassword', function(value, element) {
		    return this.optional(element) 
		      || value.length >= 6
		      && /\d/.test(value)
		      && /[a-z]/i.test(value);
		  }, 'Your password must be at least 6 characters long and contain at least one number and one char\'.')
		
		  $("#registration").validate({
		    rules: {
		      email_id: {
		        required: true,
		        email: true,
		        remote: "checkemailexists"
		      },
		      password: {
		        required: true,
		        strongPassword: true
		      },
		      password2: {
		        required: true,
		        equalTo: '#password'
		      },
		      firstName: {
		        required: true,
		        nowhitespace: true,
		        lettersonly: true
		      },
		      secondName: {
		        required: true,
		        nowhitespace: true,
		        lettersonly: true
		      },
		      businessName: {
		        required: true
		      },
		      phone: {
		        required: true,
		        digits: true,
		        phonesUK: true
		      },
		      address: {
		        required: true
		      },
		      town: {
		        required: true,
		        lettersonly: true
		      },
		      postcode: {
		        required: true,
		        postcodeUK: true
		      },
		      terms: {
		        required: true
		      }
		    },
		    messages: {
		      email_id: {
		        required: 'Please enter an email address.',
		        email: 'Please enter a <em>valid</em> email address.',
		        remote: $.validator.format("{0} is already associated with an account.")
		      }
		    }
		  });
		
		});
	});
  </script>
   -->
  <script src="validation/ValidateRegistration.js"></script>


</head>
<body>

	<div class="container-fluid">
	
		<jsp:include page="Header.jsp" />  
		<div class="row">
			
			<div class="col-md-2 col-sm-2 col-xs-12"></div>
			
			<div class="col-md-8 col-sm-8 col-xs-12">
		        <form name="registration" id="registration" class="form-container" action="register" method="post">
		        
		        <!-- ---------------------User Type--------------------------- -->
				            
				            <div class="form-group">
				            	<label for="user_type">Select Your User Type : </label>
				                <select name="user_type" id="user_type" class="form-control" required>	
									<option>Select Your User Type</option>	
								  	<option value="1">Individual User</option>
								  	<option value="2">Hospital</option>
								  	<option value="3">Blood Bank</option>
									
								</select>
				            </div>
				            		               	
		            		
		       	<!-- ---------------------Email Id--------------------------- -->
				            
				            <div class="form-group">
				                <label for="email_id">Email ID : </label>
				                <input type="email" name="email_id" id="email_id" class="form-control" />
				                <span id="email_id_error" style="color:red"></span>
				            </div>
				            
				<!-- ---------------------Name--------------------------- -->
				
				            <div class="form-group">
				                <label for="nm">Name : </label>
				                <input type="text" name="nm" id="nm" class="form-control" />
				                <span id="nm_error" style="color:red"></span>
				            </div>
				            
				<!-- ---------------------Password--------------------------- -->
				            
				            <div class="form-group">
				                <label for="pwd">Password : </label>
				                <input type="password" name="pwd" id="pwd" class="form-control" />
				                <span id="pwd_error" style="color:red"></span>
				            </div>
				            
				<!-- ---------------------Confirm Password--------------------------- -->
				            
				            <div class="form-group">
				                <label for="cnfm_pwd">Confirm Password : </label>
				                <input type="password" name="cnfm_pwd" id="cnfm_pwd" class="form-control" />
				                <span id="cnfm_pwd_error" style="color:red"></span>
				            </div>
				            
				            
				            
				<!-- ---------------------Contact--------------------------- -->
				            
				            <div class="form-group">
				                <label for="contact">Contact : </label>
				                <input type="number" name="contact" id="contact" class="form-control" />
				                <span id="contact_error" style="color:red"></span>
				            </div>
				            
				            
				            
				        
				<!-- ---------------------Address--------------------------- -->            
		            
		            <div class="form-row">
		            	
			            <div class="form-group col-md-6 col-sm-6 col-xs-12">
			                <label for="address">Enter Address : </label>
			                <textarea rows=4 name="address" id="address" class="form-control" ></textarea>
			            </div>
			            
			            <div class="form-group col-md-3 col-sm-3 col-xs-12">
			                <label for="city">City : </label>
			                <input type="text" name="city" id="city" class="form-control">
			            </div>
			            <div class="form-group col-md-3 col-sm-3 col-xs-12">
			            <br/>
		                <input type="button" value="Add Address" class="btn btn-primary btn-block"/>
		            </div>
		            	           
			         </div>
			         
				<!-- ---------------------Register--------------------------- -->
			         
		            <div class="form-row">
		            	<div class="col-md-4 col-sm-4 col-xs-12"></div>
			            <div class="form-group col-md-4 col-sm-4 col-xs-12">
			                <button type="submit" class="btn btn-primary btn-block" >REGISTER</button>
			            </div>
			            <div class="col-md-4 col-sm-4 col-xs-12"></div>
		            </div>
		        </form>
			</div>
			
			<div class="col-md-2 col-sm-2 col-xs-12"></div>
			
        </div>
    </div>

</body>
</html>