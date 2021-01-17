<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body
	background="https://allfreedesigns.com/wp-content/uploads/2016/02/lace-background-10.jpg">
	<h1>
		<b>Welcome to Flightsimple</b>
	</h1>
	
	<h2>
	Please Select a Trip Type below (*Required):
	</h2>
	<br>
	<form method="post" action="searchFlight2.jsp">
		<select name="trip_type" size=1>
			<!-- 1 means one way, 2 means round-trip-->
			<option value="oneway">One-way</option>
			<option value="round">Round trip</option>	
		</select>&nbsp;<br> <input type="submit" value="submit">
	<br>
	</form>
</body>
</html>