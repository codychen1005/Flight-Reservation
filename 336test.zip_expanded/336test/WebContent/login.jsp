<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body background = "https://allfreedesigns.com/wp-content/uploads/2016/02/lace-background-10.jpg">
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
	String userid=request.getParameter("name"); 
	//session.putValue("userid",userid); 
	String pwd=request.getParameter("password"); 
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:"
			+ "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/"
			+ "GroupOne336","cody","codychen1005!"); 
	Statement st= con.createStatement(); 
	ResultSet rs=st.executeQuery("select * from Customer where customerID='"+userid+"'and password = '"+pwd+"'");
	
	
	if(rs.next()) 
	{ 
	
		
		if(rs.getString(2).equals(pwd)) 
		{ 
			out.println("Welcome "+ userid + "<p align='right'> <a href='Seeyou.jsp'>Logout</a> </p>  <p align='center'> <a href='searchFlight.jsp'>Search Flight</a>  </p>");                       
			
		} 
		
		else 
		{ 
			out.println("Invalid password try again " + "<p align='left'> <a href='homet.jsp'>Home</a> </p>"); 
		} 
	}
	
	else
		out.println("Invalid username or password try again" + "<p align='left'> <a href='homet.jsp'>Home</a> </p>"); 
	//else
%>

</body>
</html>
