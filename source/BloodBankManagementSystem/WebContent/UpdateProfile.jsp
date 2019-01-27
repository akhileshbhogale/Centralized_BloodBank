<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 col-sm-2 col-xs-12"></div>
					<div class="col-md-8 col-sm-8 col-xs-12">
						<h3>Your Profile Details are:</h3>
					</div>
			<table border="1" style="border-collapse:collapse;" cellpadding="5" >
			<c:forEach items="${profile_list}" var="profile">
				<tr>
					<th>Name</th>
					<td>${profile.name}</td>
					</tr>
					<tr>
					<th>Email</th>
					<td>${profile.email}</td>
					</tr>
					<tr>
					<th>Contact </th>
					<td>${profile.contact}</td>
				</tr>
				
				   <tr>
				    	<td><button class="btn-info">Update</button></td>
				    </tr>
				</c:forEach>
				
			</table>
			
</body>
</html>