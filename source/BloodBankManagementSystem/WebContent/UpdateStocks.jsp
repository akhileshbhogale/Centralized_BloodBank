<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
  
<script src="js/jquery-ui.min.js"></script>

<script src="js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		//alert("ready")
		$(".update_stock").click(function(){
			//alert("in funct");
			var quantity=$(this).parent().prev().prev().html();
			var price=$(this).parent().prev().html();
			//alert($(this).parent().prev().prev().html());
			$(this).parent().prev().prev().html("<input type='number' name='quantity' value='"+quantity+"' required/>");
			$(this).parent().prev().html("<input type='number' name='price' value='"+price+"' required/>")
			//$(this).parent().prev().html("<input type='number' name='price' value='"+price+"' />")
			$(this).next().attr("name","stock_id");
			$("#submit_button").css("display","block");
		})
	})
</script>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="Header.jsp" />
		<div class="panel-group">
			<div class="panel-heading"></div>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<h3>Your Stocks Summary:</h3>
					</div>
					
					<form action="updatestocks">
						<div class="panel-body">
							<table class="table" id="table table-stripped">
							
								<tr>
									<th>Blood Group</th>
									<th>Blood Bag Type</th>
									<th>Quantity</th>
									<th>Price</th>
									<th></th>
									
								</tr>
								<c:forEach items="${ owner_stock_list}" var="stock">
									<tr>
										<td>${stock.blood_group}</td>
										<td>${stock.blood_bag_type}</td>
										<td class="stock_quantity">${stock.quantity}</td>
										<td class="stock_price">${stock.price}</td>
										<td><input type="button" value="Update" class="update_stock"><input type="hidden" value="${stock.stock_id }"></td>
									</tr>
								</c:forEach>
								
								
								
							</table>
							
						</div>
							
						<div id="submit_button" style="display:none;" class="panel-footer">
							<input type="submit" value="Submit Changes" class="btn btn-block btn-primary">
						</div>
				</form>
				
				<br/><br/><br/><br/><br/><br/><br/>
			
		</div>
	</div>
</body>
</html>