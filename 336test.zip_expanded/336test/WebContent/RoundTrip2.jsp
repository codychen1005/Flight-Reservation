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
	
	<h2>This is the table for Round trip.</h2>

	<%
	String flightNumber;
		try {

			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection(
					"jdbc:mysql:" + "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/" + "GroupOne336",
					"cody", "codychen1005!");
			//Get the inputs from the searchFlight3.jsp
			String departureAirport = request.getParameter("departure_airport");
			String arrivalAirport = request.getParameter("arrival_airport");
			String departureDate = request.getParameter("departure_date");
			String returnDate = request.getParameter("return_date");
			String isFlexible = request.getParameter("flexible_or_not");
			String sortFlight = request.getParameter("sortBy");
			
			/****right now we know the attribute trip_type  = oneway, so we skip it and put it as a conditional statement***/

			String str1 = "SELECT weekday('" + returnDate + "') as t";
			Statement stmt1 = con.createStatement();
			//Run the query against the database.
			ResultSet result1 = stmt1.executeQuery(str1);
			result1.next();


			//flexible
			int dayNum = Integer.valueOf(result1.getString("t")); // this is the number use for decrement
			int dayNum2 = Integer.valueOf(result1.getString("t"));// this is the number use for increment
			int[] before = new int[3];
			int[] after = new int[3];
			for(int i = 0; i < 3; i++ ){
				dayNum -= 1;
				dayNum2 += 1;
				if(dayNum < 0){
					dayNum = 6;
				}
				if(dayNum2 > 6){
					dayNum2 = 0;
				}
				before[i] = dayNum;
				after[i] = dayNum2;
			}			
			//end of counting flexible day
			
			
			String str;
			if(isFlexible.equals("0")){
			 str = "SELECT a.name, f.departure_time, f.arrival_time, f.departure_airport, f.arrival_airport, f.operating_days, f.total_fare from Flight as f, Airline_Company as a, Operate as o where o.companyID = a.companyID and o.flight_number = f.flight_number and f.departure_airport = ('"
					+ arrivalAirport + "') and f.arrival_airport =('" + departureAirport
					+ "') and f.operating_days like '%" + result1.getString("t") + "%' ORDER BY " + sortFlight;
			
			}
			
			else{
				str = "SELECT a.name, o.flight_number, f.departure_time, f.arrival_time, f.departure_airport, f.arrival_airport, f.operating_days, f.total_fare from Flight as f, Airline_Company as a, Operate as o where o.companyID = a.companyID and o.flight_number = f.flight_number and f.departure_airport = ('"
						+ arrivalAirport + "') and f.arrival_airport =('" + departureAirport
						+ "') and (f.operating_days like '%" + result1.getString("t") + "%' or f.operating_days like '%" + before[0] + "%' or f.operating_days like '%" + before[1] + "%' or f.operating_days like '%" + before[2] + "%' or f.operating_days like '%" + after[0] + "%' or f.operating_days like '%" + after[1] + "%' or f.operating_days like '%" + after[2] + "%') ORDER BY " + sortFlight;               
			}
			
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
	%>
	<h2>This is the table for departure from</h2>
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
		<%--
			if (departureAirport.equals(result.getString("departure_airport"))
							&& arrivalAirport.equals(result.getString("arrival_airport"))
							&& departureDate.equals(result.getString("departure_date")) && isFlexible.equals(result.getString("flexible_or_not"))) {
		--%>
		<tr>
			<td><%=result.getString("name")%></td>
			<td><%=result.getString("flight_number")%></td>
			<td><%=result.getString("departure_time")%></td>
			<td><%=result.getString("arrival_time")%></td>
			<td><%=result.getString("departure_airport")%></td>
			<td><%=result.getString("arrival_airport")%></td>
			<td><%=result.getString("operating_days")%></td>
			<td><%=result.getString("total_fare")%></td>
						<td>
				<form action="reserveR2.jsp">
					<input type="hidden" name="sortBy"
						value="<%=request.getParameter("sortBy")%>" /> <input
						type="hidden" name="flexible_or_not"
						value="<%=request.getParameter("flexible_or_not")%>" /> <input
						type="hidden" name="departure_airport"
						value="<%=request.getParameter("departure_airport")%>" /> <input
						type="hidden" name="arrival_airport"
						value="<%=request.getParameter("arrival_airport")%>" /> <input
						type="hidden" name="departure_date"
						value="<%=request.getParameter("departure_date")%>" /> 
						<input
			type="hidden" name="return_date"
			value="<%=request.getParameter("return_date")%>" /><input
						type="submit" value="Reserve">
				</form>



			</td>
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

	<form method="post" action="reserve.jsp">
			
		
		<input type="hidden" name="sortBy"
			value="<%=request.getParameter("sortBy")%>" /> <input type="hidden"
			name="flexible_or_not"
			value="<%=request.getParameter("flexible_or_not")%>" /> <input
			type="hidden" name="departure_airport"
			value="<%=request.getParameter("departure_airport")%>" /> <input
			type="hidden" name="arrival_airport"
			value="<%=request.getParameter("arrival_airport")%>" /> <input
			type="hidden" name="departure_date"
			value="<%=request.getParameter("departure_date")%>" /> 
			<input type="hidden" name="return-date"
			value="<%=request.getParameter("return-date")%>" />
			<input type="submit" value="submit">
	
			
</form>
<br>
	
</body>
</html>