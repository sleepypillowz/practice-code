package my.jdbclogin;
import java.sql.*;

public class JDBCLogin {
    // JDBC driver and database URL
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3307/mydatabase";

    // Database credentials
    static final String USER = "root";
    static final String PASS = "";

    public static void main(String[] args) {
        Connection conn = null;
        Statement stmt = null;

        try {
            // Register JDBC driver
            Class.forName(JDBC_DRIVER);

            // Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // Create a statement
            stmt = conn.createStatement();

            // Create users table if it doesn't exist
            String createTableQuery = "CREATE TABLE IF NOT EXISTS users (id INT PRIMARY KEY AUTO_INCREMENT, username VARCHAR(50) NOT NULL UNIQUE, password VARCHAR(50) NOT NULL)";
            stmt.executeUpdate(createTableQuery);

            // Perform user registration
            String registerQuery = "INSERT INTO users (username, password) VALUES ('john', 'password123')";
            stmt.executeUpdate(registerQuery);
            System.out.println("User registered successfully.");

            // Perform user login
            String loginQuery = "SELECT * FROM users WHERE username = 'john' AND password = 'password123'";
            ResultSet rs = stmt.executeQuery(loginQuery);

            if (rs.next()) {
                System.out.println("Login successful. Welcome, " + rs.getString("username") + "!");
            } else {
                System.out.println("Invalid username or password.");
            }

            // Clean-up environment
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            // Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            // Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
            } // nothing we can do
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
