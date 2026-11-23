
-- =========================================
-- PROJECT: Study Platform Database
-- DBMS: MySQL
-- =========================================

CREATE DATABASE IF NOT EXISTS study_platform_db;

USE study_platform_db;


-- 1. STUDENTS
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- 2. TEACHERS
CREATE TABLE Teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    specialization VARCHAR(150)
);


-- 3. COURSES
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT NOT NULL,
    course_title VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) DEFAULT 0.00,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (teacher_id)
        REFERENCES Teachers(teacher_id)
);


-- 4. LESSONS
CREATE TABLE Lessons (
    lesson_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    lesson_title VARCHAR(255) NOT NULL,
    lesson_content TEXT,
    lesson_order INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);


-- 5. ENROLLMENTS
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'active',

    UNIQUE (student_id, course_id),

    FOREIGN KEY (student_id)
        REFERENCES Students(student_id),

    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);


-- 6. PROGRESS
CREATE TABLE Progress (
    progress_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    lesson_id INT NOT NULL,
    is_completed BOOLEAN DEFAULT FALSE,
    completed_at DATETIME NULL,

    UNIQUE (student_id, lesson_id),

    FOREIGN KEY (student_id)
        REFERENCES Students(student_id),

    FOREIGN KEY (lesson_id)
        REFERENCES Lessons(lesson_id)
);


-- 7. QUIZZES
CREATE TABLE Quizzes (
    quiz_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    quiz_title VARCHAR(255) NOT NULL,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);


-- 8. QUIZ_RESULTS
CREATE TABLE Quiz_Results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    quiz_id INT NOT NULL,
    student_id INT NOT NULL,
    score DECIMAL(5,2),
    completed_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (quiz_id)
        REFERENCES Quizzes(quiz_id),

    FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
);

-- =========================================
-- END OF DATABASE SCHEMA
-- =========================================
