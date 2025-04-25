/*
  myschool2 데이터 베이스를 만들고 사용한다
  students 테이블과 course 테이블을 생성하는 것은 이전가 똑같지만
  student_course 테이블을 만듦으로써 중간테이블을 하나 더 만든다. 
  공동키로써 student_id와 course_id 를 사용한다.
  */

CREATE DATABASE myschool2;

USE myschool2;

SHOW DATABASES;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50)
);

CREATE TABLE student_course(
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (student_id) REFERENCES courses(course_id)
);
