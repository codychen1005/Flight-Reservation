import java.sql.*;


class MysqlCon{
	
public static void main(String args[]) 
{
	
		try {
			Class.forName("com.sql.Jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql:"
					+ "//groupone.chnfim8mzrlx.us-east-2.rds.amazonaws.com:3306/"
					+ "GroupOne336","cody","codychen1005!");
			
			Statement stmt = con.createStatement();
			
			//uname upass are column name in the table in mysql. User is the name of the
			//table
			ResultSet rs = stmt.executeQuery("select * from emp");
			
			//while (rs.next()) {}
			
			con.close();
		}catch(Exception e) 
		{
			System.out.println(e);
		}
		
		}
}
