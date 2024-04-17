-- DDL Query: (Data Definition Language) Creating database tables, tables and relationships
-- CREATE DATABASE Enrollment;
-- CREATE TABLE Students (
--                           student_id SERIAL PRIMARY KEY,
--                           name VARCHAR(255) NOT NULL,
--                           email VARCHAR(255) UNIQUE NOT NULL
-- );

-- CREATE TABLE Courses(
--                         course_id SERIAL PRIMARY KEY,
--                         title VARCHAR(255) NOT NULL,
--                         capacity INT NOT NULL
-- );

-- CREATE TABLE Enrollments (
--                              enrollment_id SERIAL PRIMARY KEY,
--                              student_id INT,
--                              course_id INT,
--                              enrollment_date DATE NOT NULL,
--                              FOREIGN KEY (student_id) REFERENCES Students(student_id),
--                              FOREIGN KEY (course_id) REFERENCES Courses(course_id)
-- );


-- CREATE TABLE Departments (
--                              department_id SERIAL PRIMARY KEY,
--                              name VARCHAR(255) NOT NULL
-- );

-- CREATE TABLE Instructors (
--                              instructor_id SERIAL PRIMARY KEY,
--                              name VARCHAR(255) NOT NULL,
--                              department_id INT,
--                              FOREIGN KEY (department_id) REFERENCES Departments(department_id)
-- );

-- CREATE TABLE CourseInstructors (
--                                    course_id INT,
--                                    instructor_id INT,
--                                    PRIMARY KEY (course_id, instructor_id),
--                                    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
--                                    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
--
-- );

-- CREATE TABLE Classrooms (
--                             classroom_id SERIAL PRIMARY KEY,
--                             location VARCHAR(255) NOT NULL,
--                             capacity INT NOT NULL
-- );


-- CREATE TYPE day_of_week
-- AS ENUM
--     ('MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY');
--
-- CREATE TABLE CourseSchedule (
--                                 course_id INT,
--                                 classroom_id INT,
--                                 day_of_week day_of_week NOT NULL,
--                                 start_time TIME NOT NULL,
--                                 end_time TIME NOT NULL,
--                                 PRIMARY KEY (course_id, day_of_week, start_time),
--                                 FOREIGN KEY (course_id) REFERENCES Courses(course_id),
--                                 FOREIGN KEY (classroom_id) REFERENCES Classrooms(classroom_id)
-- );

-- CREATE TABLE Grades (
--                         enrollment_id INT UNIQUE ,
--                         grade VARCHAR(2) NOT NULL,
--                         FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id)
-- );

-- CREATE TABLE Attendance (
--                             attendance_id SERIAL PRIMARY KEY,
--                             enrollment_id INT NOT NULL,
--                             date DATE NOT NULL,
--                             status VARCHAR(10) NOT NULL,
--                             FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id)
-- );


-- CREATE TABLE CourseInstructors (
--                                    course_id INT,
--                                    instructor_id INT,
--                                    PRIMARY KEY (course_id, instructor_id),
--                                    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
--                                    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
-- );



-- Insert data into Students table

-- INSERT INTO  Students (name, email) VALUES
--                                         ('John Doe', 'john@example.com'),
--                                         ('Alice Smith', 'alice@example.com'),
--                                         ('Bob Johnson', 'bob@example.com'),
--                                         ('Emma Brown', 'emma@example.com'),
--                                         ('Michael Davis', 'michael@example.com');

-- Insert data into Courses table

-- INSERT INTO Courses (title, capacity) VALUES
--                                           ('Introduction to Computer Science', 30),
--                                           ('Data Structures and Algorithms', 25),
--                                           ('Database Management Systems', 20),
--                                           ('Web Development', 30),
--                                           ('Artificial Intelligence', 25);

-- Insert data into Enrollments table

-- INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
--                                                                      (1, 1, CURRENT_DATE),
--                                                                      (2, 2, CURRENT_DATE),
--                                                                      (3, 3, CURRENT_DATE),
--                                                                      (4, 4, CURRENT_DATE),
--                                                                      (5, 5, CURRENT_DATE);


-- Insert data into Departments table
-- INSERT INTO Departments (name) VALUES
--                                    ('Computer Science'),
--                                    ('Engineering'),
--                                    ('Mathematics'),
--                                    ('Art'),
--                                    ('Physics');

-- Insert data into Instructors table
-- INSERT INTO Instructors (name, department_id) VALUES
--                                                   ('Dr. Smith', 1),
--                                                   ('Prof. Johnson', 2),
--                                                   ('Dr. Brown', 3),
--                                                   ('Prof. Davis', 4),
--                                                   ('Dr. White', 5);

-- Insert data into CourseInstructors table
-- INSERT INTO CourseInstructors (course_id, instructor_id) VALUES
--                                                              (1, 1),
--                                                              (2, 2),
--                                                              (3, 3),
--                                                              (4, 4),
--                                                              (5, 5);

-- Insert data into Classrooms table

-- INSERT INTO Classrooms (location, capacity) VALUES
--                                                 ('Room 101', 30),
--                                                 ('Room 102', 25),
--                                                 ('Room 103', 20),
--                                                 ('Room 104', 30),
--                                                 ('Room 105', 25);


-- Insert data into CourseSchedule table

-- INSERT INTO CourseSchedule (course_id, classroom_id, day_of_week, start_time, end_time) VALUES
--                                                                                             (1, 1, 'MONDAY', '09:00', '11:00'),
--                                                                                             (2, 2, 'TUESDAY', '10:00', '12:00'),
--                                                                                             (3, 3, 'WEDNESDAY', '11:00', '13:00'),
--                                                                                             (4, 4, 'THURSDAY', '12:00', '14:00'),
--                                                                                             (5, 5, 'FRIDAY', '13:00', '15:00');

-- Insert data into Grades table

-- INSERT INTO Grades (enrollment_id, grade) VALUES
--                                               (1, 'A'),
--                                               (2, 'B'),
--                                               (3, 'B+'),
--                                               (4, 'A-'),
--                                               (5, 'C');

-- Insert data into Attendance tablecourseinstructors
-- INSERT INTO Attendance (enrollment_id, date, status) VALUES
--
--                                                          (1, CURRENT_DATE, 'Present'),
--                                                          (2, CURRENT_DATE, 'Present'),
--                                                          (3, CURRENT_DATE, 'Absent'),
--                                                          (4, CURRENT_DATE, 'Present'),
--                                                          (5, CURRENT_DATE, 'Absent');