package services.task4;

import java.util.Scanner;
import java.sql.SQLException;

public class Demo {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    System.out.println("Welcome to the Course Enrollment System!");

    try {
      while (true) {
        System.out.println("\nOptions:");
        System.out.println("1. Enroll student in a course");
        System.out.println("2. Drop course enrollment");
        System.out.println("3. Exit");

        System.out.print("Choose an option: ");
        int option = scanner.nextInt();

        if (option == 1) {
          enrollStudent(scanner);
        } else if (option == 2) {
          dropCourse(scanner);
        } else if (option == 3) {
          break;
        } else {
          System.out.println("Invalid option. Please choose again.");
        }
      }
    } finally {
      scanner.close();
    }
  }

  private static void enrollStudent(Scanner scanner) {
    System.out.print("Enter student ID: ");
    int studentId = scanner.nextInt();

    System.out.print("Enter course ID to enroll: ");
    int courseId = scanner.nextInt();

    try {
      EnrollmentService.addCourseEnrollment(studentId, courseId);
    } catch (SQLException e) {
      System.out.println("Error: " + e.getMessage());
    }
  }

  private static void dropCourse(Scanner scanner) {
    System.out.print("Enter enrollment ID to drop: ");
    int enrollmentId = scanner.nextInt();

    System.out.print("Enter course ID: ");
    int courseId = scanner.nextInt();

    try {
      EnrollmentService.dropCourseEnrollment(enrollmentId, courseId);
    } catch (SQLException e) {
      System.out.println("Error: " + e.getMessage());
    }
  }
}

/*
 * In this updated Main class:
 *
 * We provide an additional option to drop a course enrollment.
 * When the user chooses this option, we prompt them to enter the enrollment ID and the course ID to drop.
 * We call the dropCourse method from the EnrollmentService class to drop the course enrollment.
 * If any error occurs during the operation, we catch the SQLException and display an error message.
 * */