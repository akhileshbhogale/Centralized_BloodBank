<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
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
		  <h3>Your Donation Summary</h3>
		</div>

		<table class="table table-striped">
					<tr>
						<th>VENUE</th>
						<th>DATE</th>
						<th>TIME</th>
					</tr>
					
					<c:forEach items="${donation_history_list}" var="dhistory">			
						    <tr>
						    	<td>${dhistory.c_venue}</td>
						    	<td>${dhistory.c_date}</td>
						    	<td>${dhistory.c_timing}</td>
						    </tr>
						</c:forEach>
						
		</table>
	</div>
</body>
</html>