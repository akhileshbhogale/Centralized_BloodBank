<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="css/bootstrap.min.css">

jQuery library
<script src="js/jquery-3.3.1.min.js"></script>



Latest compiled JavaScript
<script src="js/bootstrap.min.js"></script>
 -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
			      <a class="navbar-brand" href="#">Blood Bank</a>
			    </div>
			    <form class="form-inline" action="logincheck" method="post">
			    	
				    <ul class="nav navbar-nav">
				      <li class="active"><a href="#">Home</a></li>
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
				      <li><a href="RegistrationPage.jsp">Register</a></li>			      
				    </ul>
			    </form>
			  
			</nav>
	  
			
	  </c:if>
	
	  <c:if test="${typeidAttribute =='1'}">
			<h1>WELCOME ${session.userobj.name} TO OUR ONLINE BLOOD BANK!!</h1>	
				<nav class="navbar navbar-default">
			  	
			    <div class="navbar-header">
			      <a class="navbar-brand" href="#">Blood Bank</a>
			    </div>
			    <ul class="nav navbar-nav">
			      <li class="active"><a href="home">Home</a></li>
			      <li><a href="#">Dashboard</a></li>
			       <li><a href="History.jsp">History</a></li>
			      <li><a href="#">Profile</a></li>	
			      <li><a href="ViewStocks.jsp">View Stocks</a></li>
			      
			       <li><a href="logout">Logout</a></li>
			      
			      			      
			    </ul>
			  
			</nav>
	  </c:if>
	  
	  <c:if test="${typeidAttribute =='2'|| typeidAttribute =='3'}">
			<h1>WELCOME ${session.userobj.name} TO OUR ONLINE BLOOD BANK!!</h1>	
				<nav class="navbar navbar-default">
			  	
			    <div class="navbar-header">
			      <a class="navbar-brand" href="#">Blood Bank</a>
			    </div>
			    <ul class="nav navbar-nav">
			      <li class="active"><a href="#">Home</a></li>
			      <li><a href="#">Dashboard</a></li>
			      <li><a href="#">Update Stocks</a></li>
			     <li><a href="#">History</a></li>
			      <li><a href="#">Profile</a></li>	
			      <li><a href="#">View Stocks</a></li>
			      <li><a href="#">Organize Donation Camp</a></li>
			       <li><a href="#">Logout</a></li>
			       
			    </ul>
			  
			</nav>
	  </c:if>
	  
	  <c:if test="${type_id=='4'}">
			<h1>WELCOME ${session.userobj.name} TO OUR ONLINE BLOOD BANK!!</h1>	
				<nav class="navbar navbar-default">
			  	
			    <div class="navbar-header">
			      <a class="navbar-brand" href="#">Blood Bank</a>
			    </div>
			    <ul class="nav navbar-nav">
			      <li class="active"><a href="#">Home</a></li>
			      <li><a href="#">Add Admin</a></li>
			      <li><a href="#">Remove Admin</a></li>	
			      <li><a href="#">Add Hospital/Blood Bank</a></li>
			      <li><a href="#">Remove Hospital/Blood Bank</a></li>		      
			    </ul>
			  
			</nav>
	  </c:if>
	  
	  
	  
	</div>
</body>
</html>