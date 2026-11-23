TECHNICAL DOCUMENTATION

Project: Study Platform Database

1. Project Overview

The Study Platform is an online educational system that allows students to enroll in courses, watch lessons, complete assignments, and take quizzes.

Teachers can create courses, upload lessons, and manage educational content.

The main purpose of this project is to design and implement a relational database using MySQL to store and manage information about students, teachers, courses, lessons, enrollments, and quizzes.

2. Project Objectives

The main objectives of the database are:

Store student information.
Store teacher information.
Create and manage educational courses.
Organize lessons within courses.
Allow students to enroll in courses.
Store student progress.
Create quizzes for students.
Store quiz results.

3. Functional Requirements

The system must allow students to:

Register and log in.
View available courses.
Browse course descriptions.
Enroll in courses.
Access lessons.
Track their learning progress.
Complete quizzes.
View quiz results.

The system must allow teachers to:

Register and manage their profiles.
Create new courses.
Update and delete courses.
Add lessons to courses.
Create quizzes.
View enrolled students.
Monitor student progress.

4. Non-Functional Requirements

The database must use MySQL.
Each table must have a Primary Key.
Foreign Keys must maintain relationships between tables.
The database must prevent duplicate student enrollments in the same course.
The database must maintain data consistency.
Passwords must be stored securely as hashes.
The database structure should be scalable and easy to maintain.

5. Database Tables

The database will contain the following 8 tables.

1. Students

Stores information about registered students.

Columns:

student_id (INT, Primary Key)
first_name (VARCHAR)
last_name (VARCHAR)
email (VARCHAR, UNIQUE)
password_hash (VARCHAR)
registration_date (DATETIME)

2. Teachers

Stores information about teachers.

Columns:

teacher_id (INT, Primary Key)
first_name (VARCHAR)
last_name (VARCHAR)
email (VARCHAR, UNIQUE)
password_hash (VARCHAR)
specialization (VARCHAR)

3. Courses

Stores information about educational courses.

Columns:

course_id (INT, Primary Key)
teacher_id (INT, Foreign Key)
course_title (VARCHAR)
description (TEXT)
price (DECIMAL)
created_at (DATETIME)

4. Lessons

Stores lessons belonging to courses.

Columns:

lesson_id (INT, Primary Key)
course_id (INT, Foreign Key)
lesson_title (VARCHAR)
lesson_content (TEXT)
lesson_order (INT)
created_at (DATETIME)

5. Enrollments

Stores information about students enrolled in courses.

Columns:

enrollment_id (INT, Primary Key)
student_id (INT, Foreign Key)
course_id (INT, Foreign Key)
enrollment_date (DATETIME)
status (VARCHAR)

6. Progress

Stores student learning progress.

Columns:

progress_id (INT, Primary Key)
student_id (INT, Foreign Key)
lesson_id (INT, Foreign Key)
is_completed (BOOLEAN)
completed_at (DATETIME)

7. Quizzes

Stores quizzes created for courses.

Columns:

quiz_id (INT, Primary Key)
course_id (INT, Foreign Key)
quiz_title (VARCHAR)
description (TEXT)
created_at (DATETIME)

8. Quiz_Results

Stores student quiz results.

Columns:

result_id (INT, Primary Key)
quiz_id (INT, Foreign Key)
student_id (INT, Foreign Key)
score (DECIMAL)
completed_at (DATETIME)

6. Database Relationships

The database will contain the following relationships:

Teachers → Courses: One-to-Many (1:N).
Courses → Lessons: One-to-Many (1:N).
Students → Enrollments: One-to-Many (1:N).
Courses → Enrollments: One-to-Many (1:N).
Students → Progress: One-to-Many (1:N).
Lessons → Progress: One-to-Many (1:N).
Courses → Quizzes: One-to-Many (1:N).
Quizzes → Quiz_Results: One-to-Many (1:N).
Students → Quiz_Results: One-to-Many (1:N).

7. Primary Keys and Foreign Keys

Every table has a Primary Key that uniquely identifies each record.

Foreign Keys connect tables and maintain referential integrity.

Examples:

Courses.teacher_id references Teachers.teacher_id.
Lessons.course_id references Courses.course_id.
Enrollments.student_id references Students.student_id.
Enrollments.course_id references Courses.course_id.
Progress.student_id references Students.student_id.
Progress.lesson_id references Lessons.lesson_id.
Quizzes.course_id references Courses.course_id.
Quiz_Results.quiz_id references Quizzes.quiz_id.
Quiz_Results.student_id references Students.student_id.

A UNIQUE constraint on (student_id, course_id) in Enrollments prevents duplicate enrollments.

8. Database Technology

Database Management System: MySQL

Database Type: Relational Database (RDBMS)

Database Name: study_platform_db

Tools:MySQL Workbench DrawSQl

9. Expected Result

The final result will be a relational database that allows an educational platform to manage students, teachers, courses, lessons, enrollments, student progress, quizzes, and quiz results.

An ER Diagram will represent all database tables and their relationships.
