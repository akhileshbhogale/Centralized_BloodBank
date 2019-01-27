<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="C:/New folder/CBB/BootStrap-js/bootstrap.min.js"></script>
<script>
$(document).ready(function () {
    $("#quantity").on('change',function () {
    	//alert("in function");
    	var price=parseInt($("#stock_price").html());
    	//alert(parseInt($("#stock_price").html()));
    	var amount=parseInt(($(this).val()))*price
        //alert(amount);
        $("#amount").html(amount);
    	});
    $("#delivery").click(function () {
    	//alert("in fucn")
    	var deliveryType=$(this).val()
    	//alert(deliveryType)
    	if(deliveryType == "DELIVERY")
    		$("#addressTab").css("display","block")
    })
    $("#add_new_address").click(function(){
    	//alert("in fucn")
    	$("#textArea").css("display","block")
    })
});

</script>
</head>
<body>
	delete order date attribute from orders bean
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 col-sm-2 col-xs-12"></div>
					<div class="col-md-8 col-sm-8 col-xs-12">
						<h3>Enter Your Order Details:</h3>
					</div>
			<table border="1" style="border-collapse:collapse;" cellpadding="5" >
				<tr>
					<th>Supplier Name</th>
					<th>Blood Group</th>
					<th>Blood Bag Type</th>
					<th>Price</th>
					<th>Avl.Quantity</th>
					<th>Required Quantity</th>
					<th>Total Amount</th>
				</tr>
				<tr>
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
				</tr>
				<c:forEach items="${stock_list}" var="stock">
		    		<tr>
		    			<td>${stock.supplier_name}</td>
		    			<td>${stock.blood_group}</td>
		    			<td>${stock.blood_bag_type}</td>
		    			<td id="stock_price">${stock.price}</td>
		    			<td>${stock.quantity}</td>
		    			<td>
		    				<select name="quantity" id="quantity" >
		    					<option value="(select one)">(select one)</option>
							  	<c:forEach var="i" begin="1" end="${stock.quantity}">
								    <option value="${i}">${i}</option>
								</c:forEach>
							</select>
		    			</td>
		    		</tr>
				</c:forEach>	
			</table>
			<br/>
			<br/>
			Select Order type:-
			<input type="radio" name=delivery_type value="PICKUP">Pick Up
			<input type="radio" id="delivery" name=delivery_type value="DELIVERY">Delivery<br/><br/>
			<div id="addressTab" style="display:none">
				Select Address:-
				<!-- Sample radio buttons -->
					<input type="radio" name=address value="Address1">Address1<br/><br/>
					<input style="margin-left: 115px" type="radio" name=address value="Address1">Address2<br/>
				
				<!-- Actual radio buttons after DB Connection -->
					<c:forEach items="${address_list}" var="add">
						<input type="radio" name=address value="${add.address_id}">"${add.address}"<br/>
					</c:forEach><br/><br/>
					<input type="button" value="Add New Address" id="add_new_address"><br/><br/>
					<div id="textArea" style="display:none">
						Enter your new address:<br/>
						<textarea  rows="3" cols="50"></textarea>
					</div>
			</div>
			<button type="submit" value="Submit">Confirm Order</button>
		</div>
	</div>
</body>
</html>