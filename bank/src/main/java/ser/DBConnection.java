package ser;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static final String URL = "jdbc:mysql://localhost:3306/atm"; // Update with your database name
    private static final String USERNAME = "root"; // Update with your database username
    private static final String PASSWORD = "root"; // Update with your database password

	public static Connection getConnection() throws SQLException {
		try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure the MySQL JDBC driver is available
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	}
	
}
