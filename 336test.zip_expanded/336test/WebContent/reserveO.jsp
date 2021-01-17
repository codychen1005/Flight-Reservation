<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body background = "https://allfreedesigns.com/wp-content/uploads/2016/02/lace-background-10.jpg">
<!-- connect to the webpage, last three black words in column is the 
word shows on the webpage -->

<h1><b>Welcome to Flightsimple</b> </h1>
<%

//String departureAirport = session.getAttribute("departure_airport");


%>
<br>
	<form method="post" action = "2reserveO.jsp">
		<!-- hidden type name trip_type = "1"-->
		<table>
			<tr>
				<td>Special Meal</td>
				<td><input type="text" name="special_meal"></td>
			</tr>
			
			<tr>
				<td>Please Enter the Flight Number you wish to reserve</td>
				<td><input type="text" name="flight_number"></td>
			</tr>
			
			
		</table>
		
		<p>
			<select name="class" size=1>
				<option value="Economy">Economy</option>
				<option value="First">First</option>
				<option value="Business">Business</option>
			</select>&nbsp;
		</p>
		
		
		
		
		<input type="hidden" name="trip_type" value="<%=request.getParameter("trip_type")%>" />
		<input type="hidden" name="flight_number" value="<%=request.getParameter("flight_number")%>" />
		<input type="hidden" name="departure_airport" value="<%=request.getParameter("departure_airport")%>" /> 
		<input type="hidden" name="arrival_airport" value="<%=request.getParameter("arrival_airport")%>" /> 
		<input type="hidden" name="departure_date" value="<%=request.getParameter("departure_date")%>" />
		<input type="submit" value="submit">
	</form>
</body>
</html>