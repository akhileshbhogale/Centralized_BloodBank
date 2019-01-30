<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Profile</title>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
  
<script src="js/jquery-ui.min.js"></script>

<script src="js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		//alert("ready")
		$("#update").click(function(){
			//alert("in funct")
			alert($("#text_name").html());
			$("#text_name").html("<input type='text' name='user_name' value='${curr_user.user_name}' />")
			$("#text_contact").html("<input type='text' name='user_contact' value='${curr_user.user_contact}'/>")
			$("#done").html("<input type='submit' value='Submit'>")
		})
	})
</script>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="Header.jsp" />
		<div class="row">
			<div class="col-md-2 col-sm-2 col-xs-12"></div>
					<div class="col-md-8 col-sm-8 col-xs-12">
						<h3>Your Profile Details are:</h3>
					</div>
			<form action="updateprofile">
				<table border="1" style="border-collapse:collapse;" cellpadding="5" class="table" >
				
					<tr>
						<th>Name</th>
						<td id="text_name">${curr_user.user_name}</td>
					</tr>
					<tr>
						<th>Email</th>
						<td>${curr_user.user_email}</td>
					</tr>
					<tr>
						<th>Contact </th>
						<td id="text_contact">${curr_user.user_contact}</td>
					</tr>
				
					   <tr>
					    	<td><input type="button" id="update" class="btn btn-primary" value="Update"/></td>
					    	<td id="done"></td>
					    </tr>
					
					
				</table>
			</form>
		</div>
	</div>	
</body>
</html>