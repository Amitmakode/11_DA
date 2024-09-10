use unions ;

show tables ;

select * from t1 ;

select * from t2 ;

select * from t1 
union 
select * from t2 ;


select * from t1 
union all
select * from t2 ;

select c1, c2 from t1 
union 
select c12, c11 from t2 ;

select c1, c2 from t1 
union all
select c12, c11 from t2 ;

select c1, c2 from t1 
union 
select c11 from t2 ;


select c11, c12 from t2
union 
select c1, c2 from t1 ;

select count(*) from students ;

select count(*) from teachers ;

select count(*) from staff ;

select firstname, lastname, dateofbirth from students 
union all
select firstname, lastname, dateofbirth from teachers ;
 
select firstname, lastname, dateofbirth from students 
union all
select firstname, lastname, dateofbirth from teachers
union all
select firstname, lastname, dateofbirth from staff; 



SELECT FirstName, LastName, 'Student' AS `Type` FROM Students
UNION
SELECT FirstName, LastName, 'Teacher' AS `Type` FROM Teachers
UNION
SELECT FirstName, LastName, 'Staff' AS `Type` FROM Staff;


SELECT FirstName, LastName, 'Student' AS `Role`, GradeLevel, GPA FROM Students
UNION
SELECT FirstName, LastName, 'Teacher' AS `Role`, SubjectTaught, YearsOfExperience FROM Teachers
UNION
SELECT FirstName, LastName, 'Staff' AS `Role`, Department, `Position` FROM Staff;


SELECT 'Student' AS `Role`, FirstName, LastName, DateOfBirth, Gender,
	NULL AS YearsOfExperience,
    NULL AS SubjectOrDepartment
FROM Students
UNION ALL
SELECT 'Teacher' AS `Role`, FirstName, LastName, DateOfBirth, Gender,
    NULL AS RoleDetail,
    NULL AS AdditionalAttribute
    FROM Teachers ;
    
SELECT 'Student' AS `Role`, FirstName, LastName, DateOfBirth, Gender,
	NULL AS YearsOfExperience,
    NULL AS SubjectOrDepartment
FROM Students
UNION ALL
SELECT 'Teacher' AS `Role`, FirstName, LastName, DateOfBirth, Gender,
    YearsOfExperience AS RoleDetail,
   subjecttaught AS AdditionalAttribute
    FROM Teachers ;
    
SELECT 'Student' AS `Role`, FirstName, LastName, DateOfBirth, Gender,
	NULL AS YearsOfExperience,
    NULL AS SubjectOrDepartment
FROM Students
UNION ALL
SELECT 'Teacher' AS `Role`, FirstName, LastName, DateOfBirth, Gender,
    YearsOfExperience ,
   subjecttaught 
    FROM Teachers ;
    
    
    
SELECT 'Student' AS `Role`, FirstName, LastName, DateOfBirth, Gender,
	NULL AS YearsOfExperience,
    NULL AS SubjectOrDepartment
FROM Students
UNION ALL
SELECT 'Teacher' AS `Role`, FirstName, LastName, DateOfBirth, Gender,
    YearsOfExperience ,
   subjecttaught 
    FROM Teachers 
union all
SELECT 'Staff' as `Role`, FirstName, LastName, DateOfBirth, Gender,
	`position` ,
    department 
    FROM staff ; 
    
    
select distinct city from station where city regexp '^[aeiou]'. * '[aeiou]$' ;    

