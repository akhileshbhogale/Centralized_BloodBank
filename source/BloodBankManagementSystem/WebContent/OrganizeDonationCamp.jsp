<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Organize Camp</title>

<!-- 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

 -->


<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="jquery-3.3.1.min.js"></script>

  
<script src="jquery-ui.min.js"></script>

<script src="bootstrap.min.js"></script>


 <!-- 
<script>
	$(document).ready(function(){
		alert("Hii");
		var dateToday = new Date(); 
		$(function() {
		    $( "#donation_camp_date" ).datepicker({
		        minDate: dateToday
		    });
		});
	});
</script>



<script >
	var today = new Date().toISOString().split('T')[0];
	$("#donation_camp_date").attr("min","2019-01-30");
	
</script>
 -->
 
 
<script>
	$(document).ready(function() {
		//alert("ready")
		$("#donation_camp_date").click(function(){
			//alert("in function")
		    var dtToday = new Date();
		    var month = dtToday.getMonth() + 1;
		    var day = dtToday.getDate();
		    var year = dtToday.getFullYear();
			
		    if(month < 10)
		        month = '0' + month.toString();
		    if(day < 10)
		        day = '0' + day.toString();
			
		    var minDate = year + '-' + month + '-' + day;    
		    $('#donation_camp_date').attr('min', minDate);
		})
});

</script>

</head>
<body>
	<div class="container-fluid">
		<jsp:include page="Header.jsp" />
		
		<h2 class="text-center mb-5">Organize Blood Donation Camp</h2>
		<div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12"></div>
			<div class="col-md-4 col-sm-4 col-xs-12">
				
			

				<form class="form-container" action="organizeDonationCamp" >
					<div class="form-group">
						<label for="donation_camp_venue">Venue : </label>
						<input type="text" name="donation_camp_venue" id="donation_camp_venue" class="form-control" />
					</div>
					<div class="form-group">
						<label for="donation_camp_date">Date : </label>
						<div class="datepicker" data-date-start-date="+1d">
							<input type="date" min="2019-01-25" name="donation_camp_date"  id="donation_camp_date" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label for="donation_camp_time">Time : </label>
						<input type="time" name="donation_camp_time" id="donation_camp_time" class="form-control" />
					</div>
					 <div class="form-row">
					 	<div class="col-md-4 col-sm-4 col-xs-12"></div>
						<div class="form-group col-md-4 col-sm-4 col-xs-12">
							<button type="submit" value="Submit" class="btn btn-primary btn-block">Sumbit</button>
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