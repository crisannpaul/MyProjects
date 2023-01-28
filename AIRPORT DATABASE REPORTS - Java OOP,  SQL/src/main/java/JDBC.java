import java.sql.*;

public class JDBC {
	
	static final String hostname = "127.0.0.1";
	static final String port = "3306";
	static final String dbName = "crisan paul";
	static final String username = "root";
	static final String password = "root";
	static final String url = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName; 
	
	public static Connection connect() {
		Connection conn = null; 
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("Connection succesful\n\n");
			return conn;
		} catch (Exception e) {
			System.out.println("Connection unsuccesful\n\n");
			return null;
		}
	}
}
