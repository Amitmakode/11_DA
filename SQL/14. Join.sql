use joins ;

show tables ;

select * from courses ;

select * from students ;


select c.course_name, c.course_id, s.student_course_id, s.student_name 
from courses c join students s on  c.course_id = s.student_course_id ;


select c.course_name, c.course_id, s.student_course_id, s.student_name 
from courses c inner join students s on  c.course_id = s.student_course_id ;


select c.course_name, c.course_id, s.student_course_id, s.student_name 
from courses c left join students s on  c.course_id = s.student_course_id ;


select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from 
courses c left join students s on c.course_id = s.student_course_id where s.student_id is null;


select c.course_name, c.course_id, s.student_course_id, s.student_name 
from courses c right join students s on  c.course_id = s.student_course_id ;


select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from courses c right join students s on c.course_id = s.student_course_id where c.course_id is null ;


select c.course_name, c.course_id, s.student_course_id, s.student_name 
from courses c cross join students s on  c.course_id = s.student_course_id ;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from courses c cross join students s on c.course_id = s.student_course_id where c.course_id is null ;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from courses c cross  join students s ; 

select c.course_name, c.course_id, s.student_course_id, s.student_name 
from courses c join students s  ;


select * from staff ;

select * from students1 ;

select * from teachers ;


-- Scenario: You need to retrieve information about students, their teachers, 
-- and any relevant staff members (e.g., supervisors).


SELECT s.FirstName AS StudentFirstName, s.LastName AS StudentLastName,
       t.FirstName AS TeacherFirstName, t.LastName AS TeacherLastName,
       st.FirstName AS StaffFirstName, st.LastName AS StaffLastName
FROM Students1 s
LEFT JOIN Teachers t ON s.GradeLevel = t.YearsOfExperience
LEFT JOIN Staff st ON s.City = st.City;  -- Example join condition, adjust as per your schema



SELECT s.FirstName AS StudentFirstName, s.LastName AS StudentLastName,
       t.FirstName AS TeacherFirstName, t.LastName AS TeacherLastName,
       st.FirstName AS StaffFirstName, st.LastName AS StaffLastName
FROM Students1 s
LEFT JOIN Teachers t ON s.GradeLevel = t.city
LEFT JOIN Staff st ON s.City = st.City; 


-- 1. Self Join Example on Students Table



SELECT 
    s1.FirstName AS Student1FirstName, s1.LastName AS Student1LastName,
    s2.FirstName AS Student2FirstName, s2.LastName AS Student2LastName,
    s1.City
FROM Students1 s1
JOIN Students1 s2 ON s1.City = s2.City AND s1.StudentID < s2.StudentID;



SELECT 
    s1.FirstName AS Student1FirstName, s1.LastName AS Student1LastName,
    s2.FirstName AS Student2FirstName, s2.LastName AS Student2LastName,
    s1.City
FROM Students1 s1
JOIN Students1 s2 ON s1.StudentID < s2.StudentID;



SELECT 
    s1.FirstName AS Student1FirstName, s1.LastName AS Student1LastName,
    s2.FirstName AS Student2FirstName, s2.LastName AS Student2LastName,
    s1.City
FROM Students1 s1
JOIN Students1 s2 ON s1.StudentID = s2.StudentID;








