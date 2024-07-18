create database class11 ;

create database if not exists class11 ;

use class11 ;

create table if not exists students ( sr int, `name` varchar(30), address varchar(30) ) ;

insert into students values (1, "sagar", "nagpur" ) ;

insert into students values (2, "shubham") ;

insert into students (sr, `name`) 
values (2, "shubham");

insert into students values (3, null , "warhda") ;

insert into students values (1, "sagar", "nagpur" ),(3, "sagar", "nagpur" ),(4, "sagar", "nagpur" ) ;

alter table students
add column contact int ;

insert into students values (5, "sagar", "nagpur", 8672837663 ) ;

alter table students
modify column contact bigint ;

alter table students 
add column	dob date after `name` ;

alter table students
add column rollno int first ;

update students
set rollno = 1202 where sr = 1 ;

update students
set rollno = 1203 where address = "warhda" ;

set sql_safe_updates = 0 ;

alter table students
drop column sr ;

delete from students 
where rollno is null ;

truncate table students ;

drop table students ;

insert into students values (1, 7656, "2000-07-07","nagpur" ) ;

alter table students 
rename column sr to Rollno ;

rename table students to class ;

select * from class ;

show tables ;

describe class ;

create table employees (emp_id int, emp_name text, emp_department varchar(20)) ;

INSERT IGNORE INTO employees (emp_id, emp_name, emp_department)
VALUES (1, 'John Doe', 'Sales'),
       (2, 'Jane Smith' 876),
       (1, 'James Brown', 'Finance');
       
       
select * from employees ;    

select rollno, `name` from class ;   



