<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Systems</title>
</head>
<body>
	<h3>
		Welcome Admins
	</h3>	
	
	<p>
		We have our annual holiday Carribean Cruise coming up, Register now..!
		<br>
		Keep this trip a secret, don't tell the regular employees LOL :-)
	</p>
	
	<hr>
	
	<a href="${pageContext.request.contextPath}/">Back to home</a>
</body>
</html>