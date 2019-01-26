<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<select name="cities">	  `	
	  	<c:forEach items="${city_list}" var="city">
		    <option value="${city}">${city}</option>
		</c:forEach>
	</select>
</body>
</html>