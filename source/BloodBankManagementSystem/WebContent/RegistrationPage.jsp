<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="js/jquery.validate.min.js"></script>
  <script src="js/jquery-ui.min.js"></script>
  <script >
  	
  $(document).ready(function () {
      $.validator.addMethod("alphaonly", function (value, element) {
          return  /^([a-zA-Z]{1,50})$/.test(value);
          });

      $.validator.addMethod("special", function (value, element) {
          return /[^a-zA-Z0-9]/.test(value);
      });
      $("form[name='registration']").validate({
          rules: {
              nm: 
                  {
                      required: true,
                      alphaonly: true
                  },
             
              email_id: 
                  {
                      required: true,
                      email: true
                  },
              pwd:
                  {
                      required: true,
                      minlength: 10,
                      special: true
                  }
          },
          messages: {
              nm:
                  {
                      required: "Name is required",
                      alphaonly: "only alphabets,spaces and max length should be 50 characters!"
                  },
             
              email_id: 
                  {
                      required: "Email required",
                      email: "your email is not valid"
                  },
              pwd: 
                  {
                      required: "Password is required",
                      minlength: "min length is 10",
                      special: "one special character required"
                  }
          },
          submitHandler: function (form) {
              alert("form is getting submitted");
              form.submit();
          }
          
      });
  });
  
  </script>


</head>
<body>

	<div class="container-fluid">
	
		<jsp:include page="Header.jsp" />  
		<div class="row">
			
			<div class="col-md-2 col-sm-2 col-xs-12"></div>
			
			<div class="col-md-8 col-sm-8 col-xs-12">
		        <form name="registration" class="form-container" action="">		               	
		            		
		       	<!-- ---------------------Email Id--------------------------- -->
				            
				            <div class="form-group">
				                <label for="email_id">Email ID : </label>
				                <input type="email" name="email_id" class="form-control" />
				            </div>
				            
				<!-- ---------------------Name--------------------------- -->
				
				            <div class="form-group">
				                <label for="nm">Name : </label>
				                <input type="text" name="nm" class="form-control" />
				            </div>
				            
				<!-- ---------------------Password--------------------------- -->
				            
				            <div class="form-group">
				                <label for="pwd">Password : </label>
				                <input type="password" name="pwd" class="form-control" />
				            </div>
				            
				<!-- ---------------------Confirm Password--------------------------- -->
				            
				            <div class="form-group">
				                <label for="cnfm_pwd">Confirm Password : </label>
				                <input type="password" id="cnfm_pwd" class="form-control" />
				            </div>
				        
				<!-- ---------------------Address--------------------------- -->            
		            
		            <div class="form-row">
		            	
			            <div class="form-group col-md-6 col-sm-6 col-xs-12">
			                <label for="address">Enter Address : </label>
			                <textarea rows=4 id="address" class="form-control" ></textarea>
			            </div>
			            
			            <div class="form-group col-md-3 col-sm-3 col-xs-12">
			                <label for="city">City : </label>
			                <input type="text" id="city" class="form-control">
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