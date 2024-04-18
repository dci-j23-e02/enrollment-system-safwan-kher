package util;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;

public class DatabaseConnection {

  // JDBC URL, username, and password of PostgreSQL server
  private static final String JDBC_URL = "jdbc:postgresql://localhost:5432/enrollment";
  private static final String USERNAME = "safwankherallah";
  private static final String PASSWORD = "123456";


  // Methods to establish a connection to the database
  public static Connection getConnection() throws SQLException {
    try{
      // Register JDBC driver
        Class.forName("org.postgresql.Driver");
      // Open a connection
      return DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
    }catch(ClassNotFoundException | SQLException e){
      e.printStackTrace();
      throw new SQLException("Failed to connect to the database.");
    }
  }

  // Test the connection
  public static void main(String[] args) {
    try(
        Connection conn = getConnection()
        ){
      System.out.println("Database is connected !");
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
