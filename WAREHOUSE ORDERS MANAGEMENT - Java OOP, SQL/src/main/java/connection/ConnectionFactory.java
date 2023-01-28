package connection;

import java.sql.*;
import java.util.logging.Logger;

public class ConnectionFactory {
    private static final Logger LOGGER = Logger.getLogger(ConnectionFactory.class.getName());
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/ordersmanagement";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    private static ConnectionFactory connectionFactory = new ConnectionFactory();

    private ConnectionFactory() {
        try {
            Class.forName(DRIVER);
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    private Connection createConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            if (conn == null) {
                System.out.println("Failed to make connection!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static Connection getConnection() {
        return connectionFactory.createConnection();
    }

    public static void close(Connection c) {
        try {
            c.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void close(ResultSet rs) {
        try {
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void close(Statement s) {
        try {
            s.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
