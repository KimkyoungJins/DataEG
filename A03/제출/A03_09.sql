/*
  teacher_name에 선생님들의 이름들을 집어 넣는다.
  course에는 수업들의 이름들을 집어 넣는다.
  teachers_course에는 각 각 컬럼에 
  teacher_id와 course_id를 매치해서 넣는다.  
  */

INSERT INTO teachers (teacher_name)
VALUES
    ('John'),
    ('Mark'),
    ('Luke'),
    ('Peter'),
    ('Matthew');

INSERT INTO courses (course_name)
VALUES
    ('Piano'),
    ('Science'),
    ('Guitar'),
    ('English');

INSERT INTO teachers_courses (course_id, teacher_id) VALUES
                                 (1, 1),
                                 (2, 2),
                                 (2, 3),
                                 (2, 5),
                                 (3, 1);