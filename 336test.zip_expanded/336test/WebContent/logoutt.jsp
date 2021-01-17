<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body background = "https://allfreedesigns.com/wp-content/uploads/2016/02/lace-background-10.jpg">
<h1><b>Welcome to Flightsimple</b> </h1>
<a href="http://localhost:8080/336test/logoutt.jsp"> Logout</a>
<%

session.invalidate();

//redirect user to home page after logout
response.sendRedirect("homet.jsp");

%>

</body>
</html>