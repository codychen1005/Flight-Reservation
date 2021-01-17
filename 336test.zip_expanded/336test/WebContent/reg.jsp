<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body background = "https://allfreedesigns.com/wp-content/uploads/2016/02/lace-background-10.jpg">
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String user=request.getParameter("userid"); 
session.putValue("userid",user); 
String pwd=request.getParameter("pwd"); 
//String fname=request.getParameter("fname"); 
//String lname=request.getParameter("lname"); 
//String email=request.getParameter("email"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:"
		+ "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/"
		+ "GroupOne336","cody","codychen1005!"); 
Statement st= con.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("insert into Customer values ('"+user+"','"+pwd+"')"); 

out.println("Registered"); 


%>
<a href ="logint.jsp">Login</a><br/><br/>
<a href="homet.jsp">Home</a>
</body>
</html>