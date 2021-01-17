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
	
	<% //Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection(
					"jdbc:mysql:" + "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/" + "GroupOne336",
					"cody", "codychen1005!");
			
			String departureAirport = request.getParameter("departure_airport");// request.setAttribute("departureAirport", departureAirport);
			String arrivalAirport = request.getParameter("arrival_airport"); //request.setAttribute("arrivalAirport", arrivalAirport);
			String departureDate = request.getParameter("departure_date"); //request.setAttribute("departureDate", departureDate);
			String flightNum = request.getParameter("flight_number");
			
			//int total = Integer.parseInt((request.getParameter("total_fare")));
			String specialMeal = request.getParameter("special_meal");
			String flightClass = request.getParameter("class");
			String tripType = request.getParameter("trip_type");
			
			int change = 1;
			
			if(flightClass.equals("Economy")){
				change = 0;
			}
			
			
			String str = "select current_date() as d";
			Statement stmt1 = con.createStatement();
			//Run the query against the database.
			ResultSet result = stmt1.executeQuery(str);
			result.next();
			
			String str2 = "select (current_time() - INTERVAL 4 HOUR) as t";
			Statement stmt2 = con.createStatement();
			//Run the query against the database.
			ResultSet result2 = stmt2.executeQuery(str2);
			result2.next();
			
			/*
			//dep time
			String str3 = "SELECT weekday('" + departureDate + "') as t";
			Statement stmt3 = con.createStatement();
			//Run the query against the database.
			ResultSet result1 = stmt1.executeQuery(str3);
			result1.next();
			*/
			
			/*String fare = "SELECT a.name, f.departure_time, f.arrival_time, f.departure_airport, f.arrival_airport, f.operating_days, f.total_fare from Flight as f, Airline_Company as a, Operate as o where o.companyID = a.companyID and o.flight_number = f.flight_number and f.departure_airport = ('"
					+ departureAirport + "') and f.arrival_airport =('" + arrivalAirport
					+ "') and f.operating_days like '%" + result1.getString("t") + "%' and f.flight_number ='"+flightNum+"' ORDER BY total_fare";
			Statement state = con.createStatement();
			//Run the query against the database.
			ResultSet results = state.executeQuery(fare);
			*/
			
			
			Statement stmt = con.createStatement();
			//String query_relate = "insert into Relates_to (flight_number,ticket_number,daparture_date) values ('" +flightNum +"','"+ departureDate+"')";
			int query_ticket = stmt.executeUpdate("insert into Ticket (trip_type, valid_for_change, special_meal, class, date_of_purchase, time_of_purchase, booking_fee) values ('"+tripType+"', '"+change+"', '"+specialMeal+"', '"+flightClass+"', '"+ result.getString("d")+"', '"+result2.getString("t")+"', 30);");                                    
			out.println("successfully added!");
			//String str4 = "select max(ticket_number)as t from Ticket;";
			//Statement stmt5 = con.createStatement();
			//Run the query against the database.
			//ResultSet result4 =
			//result2.next();
			
			//Statement stmt4 = con.createStatement();
			//String query_relate = "insert into Relates_to (flight_number,ticket_number,daparture_date) values ('" +flightNum +"','"+ departureDate+"')";
			//int query_relatesTo = stmt4.executeUpdate("insert into Relates_to (flight_number, ticket_number, departure_date) values ('"+flightNum+"', '"+result4.getString("t")+"', '"+departureDate+"');"); 
	%>
</body>
</html>