create database trigg ;

use trigg ;

-- after | before (insert, update, delete)

create table trigger1 (
c1 varchar(50),
c2 date,
c3 int);

create table trigger2 (
c11 varchar(50),
c12 date,
c13 int);


insert into trigger1 value ("java", "2000-12-12", 500) ;

select * from trigger1 ;

select * from trigger2 ;


delimiter //
create trigger t1_to_t2
after insert on trigger1 for each row 
begin
	insert into trigger2(c11,c12,c13) values ("xyz", sysdate(), 120);
end; //


insert into trigger1 value ("java2", "2000-12-12", 500) ;




create table T1(
course_id int , 
course_desc varchar(50),
course_mentor varchar(60),
course_price int ,
course_discount int,
create_date date);

create table T2(
course_metor_update varchar(50), 
course_price_update int ,
course_discount_update int );

insert into t1 ( 
course_id, course_desc, course_mentor, course_price, course_discount) 
value(101, "FSDA", "sudhanshu", 4000, 100);


select * from t1 ;


delimiter //
create trigger t1_before_insert
before insert on t1 for each row
begin
	set new.create_date = sysdate();
end; // 




create table T3(
course_metor_update varchar(50), 
course_price_update int ,
course_current_time time );

delimiter //
create trigger t1_to_t3
after insert on t1 for each row 
begin
	insert into t3(course_current_time) values ( CURRENT_TIME());
end; //

select * from t3 ;


create table T4(
c21 varchar(50), 
c22 int ,
c23 time );


delimiter //
create trigger to_update1
before update on t1 for each row 
begin
	insert into t4 (c21, c22,c23) 
    values ("amit", 6567, current_time());
end; //



update t1 set course_id = 111 where course_id = 101 ;

set sql_safe_updates = 0 ;

select * from t4 ;


t1 = 3 insert, update, delete

insert = t2

update = t3

delete = t4


create table test1(
c1 varchar(50),
c2 date,
c3 int);


create table test2(
c11 varchar(50),
c12 date,
c13 int );


insert into test1 values ("abc", sysdate(), 201);

select * from test1 ;

select * from test2 ;


delete from test1 where c3 = 203 ;


delimiter //
create trigger to_delete_others_before_observation
before delete on test1 for each row 
begin
	insert into test2(c11,c12,c13) values(old.c1, old.c2,old.c3);
end; //

delimiter //
create trigger to_inserte_others_before_observation
after insert on test1 for each row 
begin
	insert into test2(c11,c12,c13) values(new.c1, new.c2,new.c3);
end; //

