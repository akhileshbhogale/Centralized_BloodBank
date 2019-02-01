<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
  
<script src="js/jquery-ui.min.js"></script>

<script src="js/bootstrap.min.js"></script>
<script>
$(document).ready(function () {
    /*
	$("#quantity").on('change',function () {
    	alert("in function");
    	var price=parseInt($("#stock_price").html());
    	//alert(parseInt($("#stock_price").html()));
    	var amount=parseInt(($(this).val()))*price
        //alert(amount);
        $("#amount").html(amount);
    	});
    */
    
    
    $(".quantity").on('change',function () {
    	//alert("in function");
    	//alert($(this).val());
    	//alert($(this).parent().prev().prev().text());
    	var price=parseInt($(this).parent().prev().prev().text());
    	//alert(price);
    	var amount=parseInt(($(this).val()))*price
        //alert(amount);
        $(this).parent().next().text(amount);
    	});
    
    $("#delivery").click(function () {
    	//alert("in fucn")
    	var deliveryType=$(this).val()
    	//alert(deliveryType)
    	if(deliveryType == "DELIVERY")
    		$("#addressTab").css("display","block")
    })
    $("#pickup").click(function () {
    	//alert("in fucn")
    	var deliveryType=$(this).val()
    	//alert(deliveryType)
    	if(deliveryType == "PICKUP")
    		$("#addressTab").css("display","none")
    })
    
    /*
    $("#add_new_address").click(function(){
    	//alert("in fucn")
    	$("#textArea").toggle();
    	$(".address_radio").prop("checked", false);
    })
    */
});

</script>
</head>
<body>
	delete order date attribute from orders bean because order_date is auto generated
	<div class="container-fluid">
	
		<jsp:include page="Header.jsp" />
		
		<div>
		
			<form action="confirmorder">
			
				<table class="table table-striped" >
					<thead>
						<tr>
							<th>Supplier Name</th>
							<th>Blood Group</th>
							<th>Blood Bag Type</th>
							<th>Price</th>
							<th>Avl.Quantity</th>
							<th>Required Quantity</th>
							<th>Total Amount</th>
						</tr>
					</thead>
					<tbody>
						<!-- <tr>
							<td>Jijamata Hospital</td>
							<td>A+</td>
							<td>Plasma</td>
							<td id="stock_price">250</td>
							<td>10</td>
							<td><select name="quantity" id="quantity" >
				    					<option value="(select one)">(select one)</option>
									  	<c:forEach var="i" begin="1" end="10">
										    <option value="${i}">${i}</option>
										</c:forEach>
									</select>
							</td>
							<td><span id="amount">0</span></td>
						</tr> -->
						
						<c:forEach items="${stocks_list}" var="stock">
				    		<tr>
				    			<td>${stock.supplier_name}</td>
				    			<td>${stock.blood_group}</td>
				    			<td>${stock.blood_bag_type}</td>
				    			<td class="stock_price">${stock.price}</td>
				    			<td>${stock.quantity}</td>
				    			<td>
				    				<select name="quantity" class="quantity" >
				    					<option value="0">(select one)</option>
									  	<c:forEach var="i" begin="1" end="${stock.quantity}">
										    <option value="${i}">${i}</option>
										</c:forEach>
									</select>
				    			</td>
				    			<td class="amount"></td>
				    		</tr>
						</c:forEach>
					</tbody>	
				</table>
				<br/>
				<br/>
				Select Order type:-
				<div class="radio-inline">
					<input type="radio" id="pickup" name=delivery_type value="PICKUP" required />Pick Up
				</div>
				
				<div class="radio-inline">
					<input type="radio" id="delivery" name=delivery_type value="DELIVERY"/>Delivery
				</div>
				
				<br/><br/>
				<div id="addressTab" style="display:none">
					
					<!-- Sample radio buttons 
						<input type="radio" name=address value="Address1">Address1<br/><br/>
						<input style="margin-left: 115px" type="radio" name=address value="Address1">Address2<br/>
					-->
					<!-- Actual radio buttons after DB Connection -->
					<div class="row">
					
						<div class="col-md-2 col-sm-2 col-xs-1">Select Address:-</div>
						<div class="col-md-10 col-sm-10 col-xs-11">
							
							<div class="radio">
								<c:forEach items="${address_list}" var="add">
									<input type="radio" name=address value="${add.address_id}" class="address_radio">${add.address}<br/>
								</c:forEach>
									<!-- <input type="hidden" name="address" value="-1"> --> 
							</div>
						</div>
					</div>
						<!-- 
								<br/><br/>
								<input type="button" value="Add New Address" id="add_new_address"><br/><br/>
								<div class="row">
									<div id="textArea" style="display:none" class="form-group col-md-4 col-sm-4 col-xs-12">
										Enter your new address:<br/>
										<textarea name="new_address" rows="3" cols="50" class="form-control"></textarea>
									</div>
								</div>
						 -->
				</div>
				<button type="submit" value="Submit" class="btn-primary">Confirm Order</button>
			</form>
		</div>
	</div>
</body>
</html>