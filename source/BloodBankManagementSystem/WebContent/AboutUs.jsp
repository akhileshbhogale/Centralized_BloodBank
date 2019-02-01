<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.3.1.min.js"></script>

<script src="js/jquery-ui.min.js"></script>

<script src="js/bootstrap.min.js"></script>

<style>

	body, html {
	  height: 100%;
	}
	
	.bg { 
	 
	  background-image: url("images/bb_img.png");	 
	  height: 100%; 	 
	  background-position: center;
	  background-repeat: no-repeat;
	   background-size: cover;
	   
	}
	
	.jumbotron {
	   
	   background: rgba(200, 54, 54, 0.5); 
	}

</style>
</head>
<body class="bg">
	<div class="container-fluid">
		<jsp:include page="Header.jsp" />
		<div class="row">
			<div class="col-md-0.5 col-sm-1 col-xs-0" style="width: 2.499999995%"></div>
			<div class="jumbotron col-md-11 col-sm-11 col-xs-12">
				<p>
					India has a population of <b>1.2 billion</b> people and annually requires over <b>12 million</b> blood units. 
					However, only <b>9 million</b> units are collected. This means the country faces a <b>shortage of over
					 three million</b> units of blood every year.
				 </p>
				 <p>
					Over the past few years, there has been <b>wastage of blood</b> due to lack of coordination between the
					 hospitals and blood banks. Blood, including life-saving components such as plasma and red blood cells, 
					 has been disposed of as it could not be used before the <b>expiry date</b>.

				</p>
				<p>
					Blood is made up of four major components namely plasma, red blood cells, white blood cells, and platelets,
					 each one of them having unique functions. Plasma has a <b>year-long</b> shelf life, which is much longer as compared
					  to the red blood cells and whole blood that has a deadline of only <b>35 days</b>. Despite having much longer shelf 
					  life, 50 percent wastage of plasma was observed.
				</p>
				<p>
					To overcome these problems we are providing a platform where hospitals, blood banks and individuals can connect with each other.
					Hospitals and blood banks can organize blood donation camps and registered users will be notified about those camps. Users 
					can register for these camps.Users and hospitals can view available stocks of all blood groups and blood bag types as well as purchase them in time of need		 
				</p>
				
				<br/><br/>
				
				<h2><b>Blood Bag Types</b></h2>
				<p> There are 3 types of blood bags</p>
				
				
				<dl class="lead">
				  <dt>Single</dt>
				  <dd>The bag contains CPDA (Citrate Phosphate Dextrose Adenine) solution</dd>
				  <dt>Double</dt>
				  <dd>This bag contains separation of 2 different blood components (Red Blood Cells and Plasma) </dd>
				  <dt>Triple</dt>
				  <dd>This bag contains separation of 3 different blood components (Red Blood Cells, Plasma and Platelets) </dd>
				</dl>
				
				
				
				
			</div>
			<div class="col-md-1 col-sm-1 col-xs-0" style="width: 2.499999995%"></div>
		</div>
	</div>
</body>
</html>