<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.3.1.min.js"></script>
<!-- <script src="js/jquery.validate.min.js"></script> -->
  
<script src="js/jquery-ui.min.js"></script>

<script src="js/bootstrap.min.js"></script>
  
<script>
  //alert("hi");
  $(document).ready(function () {
	//alert("hi");
      nameflag = false;
      emailflag = false;
      contactflag = false;


      $("#nm").blur(function () {
          var nameresult = $("#nm").val();
          var namereg = /^[A-Za-z]{1,50}$/;
          var namevalidate = namereg.test(nameresult);
          if (namevalidate == false) {
              //alert("Username should start with an alphabet and no special characters are allowed (range-(5-15))");
              $("#nm_error").text("Username should start with an alphabet and no special characters are allowed (between 1-50)")
          }
          if (namevalidate == true) {

        	  $("#nm_error").text("");

              nameflag = true;
          }
      });



      $("#pwd").blur(function () {
         var pwdresult = $("#pwd").val();
          var pwdreg = /[a-zA-Z^0-9]{1,32}$/
          var pwdvalidate = pwdreg.test(pwdresult);
          if (pwdvalidate == false) {
              //alert('Password should have atleast one alphabet,one special character and one number and minimum length is 1 till 32!))');
              $("#pwd_error").text("Password should have atleast one alphabet,one special character and one number and minimum length is 1 till 32!)")
              
          }
          if (pwdvalidate == true) {
        	  $("#pwd_error").text("");
              pwdflag = true;
          }
      });


      $("#contact").blur(function () {
          var contactresult = $("#contact").val();
          var contactreg = /^[0-9]{10}$/;
          var contactvalidate = contactreg.test(contactresult);
          if (contactvalidate == false) {
              //alert('Mobile number should have exactly 10 digits ');
              $("#contact_error").text("Mobile number should have exactly 10 digits")
          }
          if (contactvalidate == true) {

        	  $("#contact_error").text("");


              //Ajax





              contactflag = true;
          }
      });



      $("#cnfm_pwd").blur(function () {
    	  //alert("hi");
          var cnfm_pwdresult = $("#cnfm_pwd").val();
          alert(cnfm_pwdresult);
          var pwdresult = $("#pwd").val();
          alert(pwdresult);
          alert(cnfm_pwdresult!= pwdresult);
          //var cnfm_pwdreg = /[^a-zA-Z0-9]{1,32}$/l;
          //var cnfm_pwd_validate = pwdresult;
          if (cnfm_pwdresult!= pwdresult) {
              alert('Password should match ');
              $("#cnfm_pwd_error").text("Password should match");
          }
          if (cnfm_pwd= pwdresult) {
        	  $("#cnfm_pwd_error").text("");
             cnfm_pwd_flag = true;
          }
      });


     /* $("#sans").focusout(function () {
          var ansresult = $("#lname").val();
          var ansreg = /^[a-z A-Z 0-9 !@#$%^&*()]{5,15}$/;
          var ansvalidate = ansreg.test(ansresult);
          if (ansvalidate == false) {
              alert('Answer should be in range of 5 to 15 characters  ');
          }
          if (ansvalidate == true) {

              ansflag = true;
          }
      });



      $("#sub").click(function () {
          if (uidflag == true && pwdflag == true && fnameflag == true && lnameflag == true && mobileflag == true && quesflag == true && ansflag == true) {
              $("#myform").submit();
          }
      });*/

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
				                <input type="text" name="nm" id="nm" class="form-control" />
				                <span id="nm_error" style="color:red"></span>
				            </div>
				            
	            <!-- ---------------------Contact--------------------------- -->
	
				           	 <div class="form-group">
				                <label for="contact">Contact : </label>
				                <input type="text" name="contact" id="contact" class="form-control" />
				                <span id="contact_error" style="color:red"></span>
				            </div>
	            
				            
				<!-- ---------------------Password--------------------------- -->
				            
	  			            <div class="form-group">
				                <label for="pwd">Password : </label>
				                <input type="password" name="pwd"  id="pwd" class="form-control" />
				                <span id="pwd_error" style="color:red"></span>
				            </div>
				            
				<!-- ---------------------Confirm Password--------------------------- -->
				            
				            <div class="form-group">
				                <label for="cnfm_pwd">Confirm Password : </label>
				                <input type="password" id="cnfm_pwd"  name="cnfm_pwd" class="form-control" />
				                <span id="cnfm_pwd_error" style="color:red"></span>
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