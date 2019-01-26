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
	
		
	<select name="blood_groups">	  `	
	  	<c:forEach items="${bg_list}" var="bg">
		    <option value="${bg.blood_group_id}">${bg.blood_group}</option>
		</c:forEach>
	</select>
	
	<select name="blood_bag_types">	  `	
	  	<c:forEach items="${bbt_list}" var="bbt">
		    <option value="${bbt.blood_bag_type_id}">${bbt.blood_bag_type}</option>
		</c:forEach>
	</select>
	
	
</body>
</html>