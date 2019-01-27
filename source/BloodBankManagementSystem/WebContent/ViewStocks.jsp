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

function ajaxFetch() {
	//alert("Hi");
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
					str+="<td>";
	    				str+=""+jsonObject.seller_name;
	    			str+="</td>";
	    			
	    			str+="<td>";
    					str+=""+jsonObject.blood_group;
    				str+="</td>";
    			
    				str+="<td>";
						str+=""+jsonObject.blood_bag_type;
					str+="</td>";
					
					str+="<td>";
	    				str+=""+jsonObject.quantity;
	    			str+="</td>";
	    			
	    			str+="<td>";
    					str+=""+jsonObject.price;
    				str+="</td>";
    			
    				str+="<td>";
    					str+= "<div class='checkbox'><input type='checkbox' value='"+jsonObject.stock_id+"'></div>"
					str+="</td>";
									    
			    str+="</tr>";
			});
			$('#stocks').html(str);
		}
	});
}
	
	$(document).ready(function() {
		
		$('#cities').change(ajaxFetch);
		$('#blood_groups').change(ajaxFetch);
		$('#blood_bag_types').change(ajaxFetch);
		
	});
	
</script>


</head>
<body>

	<div class="container-fluid">
	
		<jsp:include page="Header.jsp" />
		
		<form class="form-inline">
			
			<select name="cities" id="cities" class="form-control">	
				<option>Select City</option>	
			  	<c:forEach items="${city_list}" var="city">
				    <option value="${city}">${city}</option>
				</c:forEach>
			</select>
			
			
			
			<select name="blood_groups" id="blood_groups" class="form-control">	
				<option>Select Blood Group</option>	
			  	<c:forEach items="${bg_list}" var="bg">
				    <option value="${bg.blood_group_id}">${bg.blood_group}</option>
				</c:forEach>
			</select>
			
			
			
			<select name="blood_bag_types" id="blood_bag_types" class="form-control">
				<option>Select Blood Bag Type</option>	
			  	<c:forEach items="${bbt_list}" var="bbt">
				    <option value="${bbt.blood_bag_type_id}">${bbt.blood_bag_type}</option>
				</c:forEach>
			</select>
			
			
		</form>
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