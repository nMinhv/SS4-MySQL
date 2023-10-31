CREATE DATABASE student_manager;
USE student_manager;
CREATE TABLE class (
    class_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(30)
);
CREATE TABLE students (
    student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    student_age INT NOT NULL CHECK(student_age > 3),
    class_id INT
);
ALTER TABLE students 
ADD CONSTRAINT fk_class FOREIGN KEY(class_id) 
REFERENCES class(class_id);
CREATE TABLE subjects (
    subject_id INT NOT NULL AUTO_INCREMENT,
    subject_name VARCHAR(30)
);
CREATE TABLE student_subject (
    student_id INT,
    subject_id INT
);
ALTER TABLE student_subject
ADD CONSTRAINT pk_student_subject PRIMARY KEY(student_id,subject_id);
ALTER TABLE student_subject
ADD CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES students(student_id);
ALTER TABLE student_subject 
ADD CONSTRAINT fk_subject_id FOREIGN KEY (subject_id) REFERENCES subjects(subject_id);

ALTER TABLE student_subject
ADD COLUMN mark INT DEFAULT 0;

SELECT student_id FROM students WHERE class_id = 1;
SELECT mark FROM student_subject WHERE student_id = 1;
SELECT student_id FROM student_subject WHERE subject_id = 1;

