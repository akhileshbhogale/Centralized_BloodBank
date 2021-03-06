<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Centralized Blood Bank</title>
<!-- <link rel="stylesheet" href="css/bootstrap.min.css">

jQuery library
<script src="js/jquery-3.3.1.min.js"></script>



Latest compiled JavaScript
<script src="js/bootstrap.min.js"></script>
 -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
  <script type="text/javascript">
    $(document).ready(function () {
        var url = window.location;
        $('ul.nav a[href="'+ url +'"]').parent().addClass('active');
        $('ul.nav a').filter(function() {
             return this.href == url;
        }).parent().addClass('active');
    });
</script> 
  
</head>
<body>
	<div class="container-fluid">
		<%
			int type_id=-1;
		HttpSession sess=request.getSession(false);
		Integer i=(Integer)request.getSession(false).getAttribute("type_id");
		
		    if(i!= null) 
		    {
		    	type_id=i;   
		    	  
		    }
		    pageContext.setAttribute("typeidAttribute", type_id);
		    
		%>
		<c:if test="${typeidAttribute =='-1'}">
			<h1>WELCOME TO OUR ONLINE BLOOD BANK!!</h1>
			<nav class="navbar navbar-default">
			  	
			    <div class="navbar-header">
			      <a class="navbar-brand" href="AboutUs.jsp">Centralized Blood Bank</a>
			    </div>
			    <form class="form-inline" action="logincheck" method="post">
			    	
				    <ul class="nav navbar-nav">
				      <li><a href="home">Home</a></li>
				      <li><a href="ViewStocks.jsp">View Stocks</a></li>
				      <li><a href="RegistrationPage.jsp">Register</a></li>
				      <li>
				      	<div class="form-group">
				      		
				    		<input name="emailid" placeholder="EmailID" type="text" class="form-control">
				    		
				    	</div>				      
				      </li>
				      <li>
				      	<div class="form-group">
				    		<input name="pwd" placeholder="Password" type="password" class="form-control">
				    	</div>				      
				      </li>
				      <li>
				      	<div class="form-group">
				    		<input name="Submit" value="Login" type="submit" class="form-control">
				    	</div>	
				      </li>
				      
				      <li><h4 class="text-danger">${cookie.error_cookie.value}</h4></li>			      
				    </ul>
				    
			    </form>
			    
			  
			</nav>
	  
			
	  </c:if>
	
	  <c:if test="${typeidAttribute =='1'}">
			<h1>WELCOME ${curr_user.user_name}!!</h1>	
				<nav class="navbar navbar-default">
			  	
			    <div class="navbar-header">
			      <a class="navbar-brand" href="AboutUs.jsp">Centralized Blood Bank</a>
			    </div>
			    <ul class="nav navbar-nav">
			      <li><a href="AboutUs.jsp">About Us</a></li>
			      <li><a href="upcomingdonationcamps">Upcoming Donation Camps</a></li>
			       <li><a href="History.jsp">Activity Summary</a></li>
			      <li><a href="UpdateProfile.jsp">Profile</a></li>	
			      <li><a href="ViewStocks.jsp">View Stocks</a></li>
			      
			       <li><a href="logout">Logout</a></li>
			      
			      			      
			    </ul>
			  
			</nav>
	  </c:if>
	  
	  <c:if test="${typeidAttribute =='2'|| typeidAttribute =='3'}">
			<h1>WELCOME ${curr_user.user_name}!!</h1>	
				<nav class="navbar navbar-default">
			  	
			    <div class="navbar-header">
			      <a class="navbar-brand" href="AboutUs.jsp">Centralized Blood Bank</a>
			    </div>
			    <ul class="nav navbar-nav">
			      <li><a href="AboutUs.jsp">Home</a></li>
			      <li><a href="mystocks">Update Stocks</a></li>
			     <li><a href="orderhistory">Order Summary</a></li>
			      <li><a href="UpdateProfile.jsp">Profile</a></li>	
			      <li><a href="ViewStocks.jsp">View Stocks</a></li>
			      <li><a href="OrganizeDonationCamp.jsp">Organize Donation Camp</a></li>
			       <li><a href="logout">Logout</a></li>
			       
			    </ul>
			  
			</nav>
	  </c:if>
	  
	  <c:if test="${type_id=='4'}">
			<h1>WELCOME ADMIN!!</h1>	
				<nav class="navbar navbar-default">
			  	
			    <div class="navbar-header">
			      <a class="navbar-brand" href="AboutUs.jsp">Centralized Blood Bank</a>
			    </div>
			    <ul class="nav navbar-nav">
			      <li><a href="AddAdmin.jsp">Add Admin</a></li>
			      <li><a href="DeleteAdmin.jsp">Remove Admin</a></li>	
			      <li><a href="AddHospital.jsp">Add Hospital</a></li>
			      <li><a href="RemoveHospital.jsp">Remove Hospital</a></li>
			      <li><a href="AddBloodBank.jsp">Add Blood Bank</a></li>			      
			      <li><a href="RemoveBloodBank.jsp">Remove Blood Bank</a></li>
			      <li><a href="logout">Logout</a></li>		      
			    </ul>
			  
			</nav>
	  </c:if>
	  
	  
	  
	</div>
</body>
</html>