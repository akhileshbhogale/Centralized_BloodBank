<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Organize Camp</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
  
<script src="js/jquery-ui.min.js"></script>

<script src="js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container-fluid">
		<jsp:include page="Header.jsp" />
		
		<h2 class="text-center mb-5">Organize Blood Donation Camp</h2>
		<div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12"></div>
			<div class="col-md-4 col-sm-4 col-xs-12">
				
			

				<form class="form-container" action="organizeDonationCamp">
					<div class="form-group">
						<label for="donation_camp_venue">Venue : </label>
						<input type="text" id="donation_camp_venue" class="form-control" />
					</div>
					<div class="form-group">
						<label for="donation_camp_date">Date : </label>
						<input type="date" id="donation_camp_date" class="form-control" />
					</div>
					<div class="form-group">
						<label for="donation_camp_time">Time : </label>
						<input type="time" id="donation_camp_time" class="form-control" />
					</div>
					 <div class="form-row">
					 	<div class="col-md-4 col-sm-4 col-xs-12"></div>
						<div class="form-group col-md-4 col-sm-4 col-xs-12">
							<button type="submit" class="btn btn-primary btn-block">Sumbit</button>
						</div>
					 </div>
					 <div class="form-row">
					 	<div class="col-md-4 col-sm-4 col-xs-12"></div>
						<div class="form-group col-md-4 col-sm-4 col-xs-12">
							<button type="reset" class="btn btn-primary btn-block">Cancel</button>
						</div>
					 </div>
				</form>
				
			</div>
			<div class="col-md-4 col-sm-4 col-xs-12"></div>
		</div>
	</div>
</body>
</html>