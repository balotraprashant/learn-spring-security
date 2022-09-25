<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
	<h3>
		Hey, <!-- Username -->
		<security:authentication property="principal.username" />
	</h3>	
	<!-- Role(s):  -->
	<security:authentication property="principal.authorities" />
	
	
	<p>Welcome to Hustle crafts!!</p>
	
	<hr>
	
	<security:authorize access="hasRole('MANAGER')">
		<!-- Add a link to navigate to /leaders (For Managers)  -->
		<p><a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a></p>
		(Only for Manager Peeps)
	<hr>
	</security:authorize>
	
	<security:authorize access="hasRole('ADMIN')">
		<p><a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a></p>
		(Only for Admin Peeps)
	<hr>
	</security:authorize>
	
	<form:form action="${pageContext.request.contextPath}/logout"
		method="POST">
		<input type="submit" value="Logout" />
	</form:form>
</body>
</html>