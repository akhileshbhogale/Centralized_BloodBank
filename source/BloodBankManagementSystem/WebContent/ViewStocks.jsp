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
  

<script>
	
	$(document).ready(function() {
		alert("ready");
		$('#cities').change(function() {
			alert("Hi");
			$.ajax({
				url : 'fetchstocks',
				data : {
					city : $('#cities').val(),
					blood_group:$('#blood_groups').val(),
					blood_bag_type:$('#blood_bag_types').val()
				},
				success : function(responseText) {
					
					var jsonArray = JSON.parse(responseText);
					var str="";
					$.each(jsonArray, function(index,jsonObject){
						str+="<tr>";
					    $.each(jsonObject, function(key,val){
					        //console.log("key : "+key+" ; value : "+val);
					    	if(key=="stock_id")
					    	{
					    		str+= "<div class='checkbox'><input type='checkbox' value='"+val+"'></div>"
					    	}
					    	else
					    	{
					    		str+="<td>";
					    			str+=""+val;
					    		str+="</td>";
					    	}
					        
					    });
					    str+="</tr>";
					});
					$('#stocks').html(str);
				}
			});
		});
	});
	
</script>


</head>
<body>

	<div class="container-fluid">

		<select name="cities" id="cities">	  `	
		  	<c:forEach items="${city_list}" var="city">
			    <option value="${city}">${city}</option>
			</c:forEach>
		</select>
		
			
		<select name="blood_groups" id="blood_groups">	  `	
		  	<c:forEach items="${bg_list}" var="bg">
			    <option value="${bg.blood_group_id}">${bg.blood_group}</option>
			</c:forEach>
		</select>
		
		<select name="blood_bag_types" id="blood_bag_types">	  `	
		  	<c:forEach items="${bbt_list}" var="bbt">
			    <option value="${bbt.blood_bag_type_id}">${bbt.blood_bag_type}</option>
			</c:forEach>
		</select>
		
		
	<table class="table table-striped">
	    <thead>
	      <tr>
	        <th>Seller Name</th>
	        <th>Blood Group</th>
	        <th>Blood Bag Type</th>
	        <th>Available Quantity</th>
	        <th>Price per Unit</th>
	        <th>Select</th>
	      </tr>
	    </thead>
	    <tbody id="stocks">
	      
	    </tbody>
	  </table>
	</div>
</body>
</html>