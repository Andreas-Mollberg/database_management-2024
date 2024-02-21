CREATE DATABASE universities_application;

USE universities_application;

-- @block
CREATE table universities(
    university_id INT PRIMARY KEY AUTO_INCREMENT,
    university_name VARCHAR(255) NOT NULL,
    adress VARCHAR(255),
    phone VARCHAR(255),
    email VARCHAR(255)
    );

INSERT INTO universities (university_name, adress, phone, email)
VALUES ("Harvard", "Pompous Street 51", "123-456", "bribes@harvard.com"),
	("MIT", "Clam Chowder Blvd", "123-456", "redsocks@mit.com");

SELECT * FROM universities;  -- get all colums for all rows.

SELECT university_id, university_name FROM universities; 
SELECT university_id, university_name FROM universities WHERE university_id = 1; 

CREATE TABLE teachers(
	teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_name VARCHAR(255),
    phone VARCHAR(255),
    email VARCHAR(255)
);

INSERT INTO teachers (teacher_name, phone, email)
VALUES ("Linus", "123-456", "linus@distansakademin.se"),
	("Jakob", "123-456", "jakob@distansakademin.se");

CREATE TABLE students(
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(255),
    phone VARCHAR(255),
    email VARCHAR(255)
);

INSERT INTO students (student_name, phone, email)
VALUES ("Andreas", "073-123 456 70", "andreas@jensen.se"),
	("Vigor", "073-123 456 71", "vigor@jensen.se"),
    ("Adam", "073-123 456 72", "adam@jensen.se");

CREATE TABLE courses (
	course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(255) NOT NULL,
    credits INT,
    university_id INT,
    teacher_id INT,
    FOREIGN KEY (university_id) REFERENCES universities(university_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

INSERT INTO courses (course_name, credits)
VALUES ("Object-Orientated Programming with Java", "50"),
	("Systematic Development with Java", "50");

CREATE TABLE student_courses(
	student_courses_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    grade VARCHAR(255),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO student_courses (student_id, course_id, grade, start_date, end_date)
VALUES (1, 1, "A", "2023-09-01", "2023-12-31"),
    (2, 1, "B", "2023-09-01", "2023-12-31"),
    (3, 2, "A", "2023-11-01", "2024-02-01");

SELECT * FROM student_courses;

SELECT s.student_name, c.course_name, sc.grade
FROM students s
JOIN student_courses sc ON s.student_id = sc.student_id
JOIN courses c ON sc.course_id = c.course_id;




