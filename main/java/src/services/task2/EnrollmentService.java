package services.task2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DatabaseConnection;

public class EnrollmentService {
// Method to enroll a student in a course
  public static void enrollStudent(int studentId, int courseId) throws SQLException {
    Connection connection = null;
    PreparedStatement updateCapacityStatement = null;
    PreparedStatement enrollStudentStatement = null;

    try{
      connection = DatabaseConnection.getConnection();
      // Begin transaction
      connection.setAutoCommit(false);

      // Update the capacity
      String updateCapacitySQL = "UPDATE Courses SET capacity = capacity - 1 WHERE course_id = ? AND capacity > 0";
      updateCapacityStatement = connection.prepareStatement(updateCapacitySQL);
      updateCapacityStatement.setInt(1, courseId);
      int rowsUpdated = updateCapacityStatement.executeUpdate();

      if(rowsUpdated == 0){
        throw new SQLException("No available seats in the course.");
      }

      // Insert enrollment record
      String enrollStudent = "INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES (?, ?, CURRENT_DATE)";
      enrollStudentStatement =  connection.prepareStatement(enrollStudent);
      enrollStudentStatement.setInt(1, studentId);
      enrollStudentStatement.setInt(2, courseId);
       rowsUpdated = enrollStudentStatement.executeUpdate();
      if(rowsUpdated == 0){
        throw new SQLException("Enrollment failed!");
      }

          // Commit transaction
      connection.commit();
      System.out.println("Enrollment successful ! ");
    } catch (SQLException e) {
         if(connection != null){
           // Rollback transaction if an error occurs
           connection.rollback();
         }
         e.printStackTrace();
         throw e;
    }finally{
      // Close prepared statements and connection
      if(updateCapacityStatement != null) updateCapacityStatement.close();
      if(enrollStudentStatement !=null) enrollStudentStatement.close();
      if(connection !=null){
        connection.setAutoCommit(true); // Restore auto-commit mode
        connection.close();
      }

    }
  }
}
