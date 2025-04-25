/*
  Course 테이블의 각 과목의 이름에 선생님의 아이디를 연결한다. 
  English는 없음으로 null 으로 한다. 
*/

INSERT INTO courses (course_name, teacher_id) VALUES
                                      ('Piano', 1),
                                      ('Guitar', 1),
                                      ('Science', 2),
                                      ('Science', 3),
                                      ('Science', 5),
                                      ('English', null);