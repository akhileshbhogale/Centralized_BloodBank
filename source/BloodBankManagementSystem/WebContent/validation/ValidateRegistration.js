$(document).ready(function () {
	//alert("hi");
      nameflag = false;
      emailflag = false;
      contactflag = false;
      
      function ajaxCheckEmail() {
    		//alert("Hi");
    		$.ajax({
    			url : 'checkemailexists',
    			data : {
    				email_id:$("#email_id").val()
    			},
    			success : function(responseText) {
    				
    				//alert("Hi");
    				
    				if(responseText=="EXISTS")
    				{
    					$("#email_id_error").text("Email Already exixts! Please cooose another email.");
    				}
    				else
    				{
    					$("#email_id_error").text("");
    				}
    				
    			}
    		});
    	}
      
      $("#email_id").blur(function () {
          var emailresult = $("#email_id").val();
          var emailreg = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
          var emailvalidate = emailreg.test(emailresult);
          if (emailvalidate == false) {
              //alert("Username should start with an alphabet and no special characters are allowed (range-(5-15))");
              $("#email_id_error").text("Email Id should be of the format abc@something.anything ( Max length 50)")
          }
          if (emailvalidate == true) {

        	  $("#email_id_error").text("");
        	  
        	  ajaxCheckEmail();

              emailflag = true;
          }
      });


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
          var pwdreg = new RegExp("^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{5,32})");
          var pwdvalidate = pwdreg.test(pwdresult);
          if (pwdvalidate == false) {
              //alert('Password should have atleast one alphabet,one special character and one number and minimum length is 1 till 32!))');
              $("#pwd_error").text("Password should have atleast one alphabet,one special character and one number and minimum length is 5 till 32!)")
              
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
		
 
