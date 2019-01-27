<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="container-fluid">
		<%
			int type_id=-1;
		HttpSession sess=request.getSession(false);
		Integer i=(Integer)request.getSession(false).getAttribute("type_id");
		
		    if(i!= null) 
		    {
		    	type_id=i;   
		    	  
		    }
		    pageContext.setAttribute("typeidAttribute", type_id);
		    
		%>
		
		<jsp:include page="Header.jsp" />
		
		<c:choose >
			<c:when test="${typeidAttribute =='1'}">
				<jsp:include page="OrderHistory.jsp" />
				<jsp:include page="DonationHistory.jsp" />
				
			</c:when>
			
			<c:when test="${typeidAttribute =='2'|| typeidAttribute =='3'}">
				<jsp:include page="OrderHistory.jsp" />	
			</c:when>
			  
			  <c:otherwise>					
					<c:redirect url="/home"></c:redirect>
			  </c:otherwise>
		  </c:choose>
		  
		  
		  
		</div>

</body>
</html>