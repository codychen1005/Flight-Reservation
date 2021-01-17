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
<body
	background="https://allfreedesigns.com/wp-content/uploads/2016/02/lace-background-10.jpg">
	<h1>
		<b>Welcome to Flightsimple</b>
	</h1>
	<h2>
		<b>All Flights with trip type: One-Way </b>
	</h2>
	<%
		String flightNumber;
		int total;
		try {

			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:" + "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/" + "GroupOne336","cody","codychen1005!"); 
			/****right now we know the attribute trip_type  = oneway, so we skip it and put it as a conditional statement***/
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT a.name, o.flight_number, departure_time, arrival_time, departure_airport, arrival_airport, operating_days, total_fare from Flight, Airline_Company as a, Operate as o where o.companyID = a.companyID and o.flight_number = Flight.flight_number;";
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
	%>


	<!--  Make an HTML table to show the results in: -->
	<table border="5" bgcolor="skyblue" cellspacing="4" cellpadding="4">
		<tr bgcolor="B1E1A7">
			<th>Airline Company</th>
			<th>Flight Number</th>
			<th>Departure Time</th>
			<th>Arrival Time</th>
			<th>Departure Airport</th>
			<th>Arrival Airport</th>
			<th>Operating Date</th>
			<th>Price</th>
			<th>Reserve</th>
		</tr>

		<%
			//parse out the results
				while (result.next()) {
					flightNumber = result.getString("flight_number");
		%>

		<tr>
			<td><%=result.getString("name")%></td>
			<td><%=result.getString("flight_number")%></td>
			<td><%=result.getString("departure_time")%></td>
			<td><%=result.getString("arrival_time")%></td>
			<td><%=result.getString("departure_airport")%></td>
			<td><%=result.getString("arrival_airport")%></td>
			<td><%=result.getString("operating_days")%></td>
			<td><%=result.getString("total_fare")%></td>
			
		</tr>
		<%
			}
		%>

	</table>
	<%
		} catch (Exception e) {
			out.print(e);
		}
	%>

	<br>
	<form method="post" action="OneWay.jsp">
		<!-- hidden type name trip_type = "1"-->
		<table>
		<tr>
				<td>Enter Trip Type again</td>
				<td><input type="text" name="trip_type"></td>
			</tr>
			<tr>
				<td>Departure Airport</td>
				<td><input type="text" name="departure_airport"></td>
			</tr>
			<tr>
				<td>Arrival Airport</td>
				<td><input type="text" name="arrival_airport"></td>
			</tr>
			<tr>
				<td>Departure Date</td>
				<td><input type="date" name="departure_date"></td>
			</tr>
		</table>
		<p>
			<select name="sortBy" size=1>
				<!-- 1 means one way, 2 means round-trip-->
				<option value="total_fare">Price</option>
				<option value="departure_time">take-off time</option>
				<option value="arrival_time">landing time</option>
			</select>&nbsp;
		</p>

		<br> <select name="flexible_or_not" size=1>
			<!-- 1 means flexible, 0 means not-->
			<option value="1">Flexible</option>
			<option value="0">Not flexible</option>
		</select>&nbsp; <br> <input type="submit" value="submit">
	</form>
	<br>
</body>
</html>
