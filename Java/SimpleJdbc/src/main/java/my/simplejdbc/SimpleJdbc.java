package my.simplejdbc;
import java.sql.*;

public class SimpleJdbc {

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        
        // Load the JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("Driver loaded");
        
        try ( // Connect to a database
                Connection connection = DriverManager.getConnection
                        ("jdbc:mysql://localhost/javabook" , "root", "password")) {
            System.out.println("Database connected");
            // Create a statement
            Statement statement = connection.createStatement();
            // Execute a statement
            ResultSet resultSet = statement.executeQuery
                ("select firstName, mi, lastName from Student where lastName" + " = 'Smith'");
            // Iterate through the result and print the student name
            while (resultSet.next()) {
                System.out.println(resultSet.getString(1) + "\t" +
                        resultSet.getString(2) + "\t" + resultSet.getString(3));
            }
            // Close the connection
        }
        
    }
}
