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
	
		
	

	<%
		//1 means one way, 2 means round-trip
		String tripType = request.getParameter("trip_type");
		if(tripType.equals("oneway")){
			out.println("Selected trip type: One-Way =============> "+ "<p align='left'> <a href='searchFlight3.jsp'> Continue to Search Flight</a>  </p>");
		}
		
		else if(tripType.equals("round")){
			out.println("Selected trip type: Round trip =============> "+ "<p align='left'> <a href='searchFlight4.jsp'> Continue to Search Flight</a>  </p>");
		}
		
		else{
			out.println("Error"); 
		}
	
	
	%>
		<form method="post" action="flight3.jsp">
		<input type="hidden" name="trip_type" value="<%=request.getParameter("trip_type")%>" />
		</form>
		<form method="post" action="flight4.jsp">
		<input type="hidden" name="trip_type" value="<%=request.getParameter("trip_type")%>" />
		</form>
</body>
</html>