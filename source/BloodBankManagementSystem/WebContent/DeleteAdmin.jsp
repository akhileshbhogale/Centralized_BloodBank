<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
  
<script src="js/jquery-ui.min.js"></script>

<script src="js/bootstrap.min.js"></script>

<title>DeleteAdmin</title>
</head>
<body>
	<jsp:include page="Header.jsp" />
	<div style="margin-top: 140px;margin-left: 330px;" class="container-fluid">
		<div class="row">
			<div class="col-md-1 col-sm-1 col-xs-12"></div>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<h3 style="margin-left: 60px">Delete Admin</h3>
			</div>
			<div class="col-md-2 col-sm-2 col-xs-12"></div>
			<div class="col-md-2 col-sm-2 col-xs-12"></div>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form class="form-container" action="deleteAdmin">
					<div class="form-group">
						<label for="admin_email">Admin email : </label>
						<input type="email" id="admin_email" name="admin_email" class="form-control" />
					</div>
				 	<div class="form-row">
						<div class="col-md-2 col-sm-2 col-xs-12"></div>
							<div style="margin-left: 35px" class="form-group col-md-5 col-sm-5 col-xs-12">
								<button type="submit" class="btn btn-primary btn-block">Delete</button>
								<button type="reset" class="btn btn-block">Reset</button>
							</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>