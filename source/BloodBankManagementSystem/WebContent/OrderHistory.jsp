<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
  
<script src="js/jquery-ui.min.js"></script>

<script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
		
		
		<div class="page-header">
		  <h3>Your Order Summary</h3>
		</div>
		<table class="table table-striped">
		
					<tr>
						<th>NAME</th>
						<th>BLOODGROUP</th>
						<th>BLOODBAGTYPE</th>
						<th>QUANTITY</th>
						<th>PRICE</th>
						<th>DATE</th>
					
					</tr>
					
					<c:forEach items="${order_history_list}" var="camp">
					
						    <tr>
						    	<td>${ohistory.name}</td>
						    	<td>${ohistory.bloodgroup}</td>
						    	<td>${ohistory.bloodbagtype}</td>
						    	<td>${ohistory.quantity}</td>
						    	<td>${ohistory.price}</td>
						    	<td>${ohistory.date}</td>
						    	
						    </tr>
						</c:forEach>
						
					</table>
	</div>

</body>
</html>