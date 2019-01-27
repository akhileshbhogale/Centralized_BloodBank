<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Organize Camp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="D:/project_5/AK-47/CentralisedBloodBank/bootstrap.min.js"></script>
<script src="D:/project_5/AK-47/CentralisedBloodBank/jquery-2.1.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<jsp:include page="Header.jsp" />
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12"></div>
			<div class="col-md-4 col-sm-4 col-xs-12">
				<h4 style="margin-left: 70px;margin-top: 150px">Organize Blood Donation Camp</h4>
			</div>
			<div class="col-md-2 col-sm-2 col-xs-12"></div>
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
		</div>
	</div>
</body>
</html>