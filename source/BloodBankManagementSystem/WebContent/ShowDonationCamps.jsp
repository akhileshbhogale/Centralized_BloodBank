<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="js/jquery.validate.min.js"></script>
  <script src="js/jquery-ui.min.js"></script>
</head>
<body>

	<div class="container-fluid">
		<jsp:include page="Header.jsp" />
		<div class="jumbotron">
			<h1>Upcoming Donation Camps</h1>
			<form action="registerfordonationcamp">
			<span class="text-success">${registeredforcamp }</span>
				<table class="table table-striped">
				<c:forEach items="${camp_list}" var="camp">
					    <tr>
					    	<td>${camp.camp_venue}</td>
					    	<td>${camp.camp_date}</td>
					    	<td>${camp.camp_time}</td>
					    	<td><button type="submit" value="Submit" class="btn-info">Register</button><input type="hidden" name="camp_id" value="${camp.camp_id}"></td>
					    </tr>
					</c:forEach>
					
				</table>
			</form>
		</div>
	</div>
</body>
</html>