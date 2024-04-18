package services.task2;

import java.sql.SQLException;
import java.util.Scanner;

public class Demo {

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    System.out.println("Welcome to the Course Enrollment System!");
    try {
      while(true){
        System.out.println("\nOptions:");
        System.out.println("1. Enroll student in a course");
        System.out.println("2. Exit");
        System.out.println("Choose an option: ");
        int option = scanner.nextInt();

        if(option == 1){
          enrollStudents(scanner);
        }else if(option == 2){
          break;
        }else{
          System.out.println("Invalid option. Please choose again.");
        }
      }
    }finally {
      scanner.close();
    }
  }

  private static void enrollStudents(Scanner scanner) {
    System.out.println("Enter student ID: ");
    int studentId= scanner.nextInt();

    System.out.println("Enter course ID: ");
    int courseId = scanner.nextInt();

    try{
      EnrollmentService.enrollStudent(studentId, courseId);
    } catch (SQLException e) {
      System.out.println("Error: "+ e.getMessage());
    }
  }

}
