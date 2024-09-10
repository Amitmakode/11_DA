create database if not exists part ; 

use part ;

-- 1. Pertition by range

CREATE TABLE s1 (
    OrderID INT,
    OrderDate DATE,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2)
) PARTITION BY RANGE (YEAR(OrderDate)) (
    PARTITION p0 VALUES LESS THAN (2024),
    PARTITION p1 VALUES LESS THAN (2025),
    PARTITION p2 VALUES LESS THAN (2026),
    PARTITION p3 VALUES LESS THAN MAXVALUE
);



INSERT INTO s1 (OrderID, OrderDate, CustomerID, TotalAmount)
VALUES
    (1, '2020-01-01', 101, 150.00),
    (2, '2023-01-02', 102, 200.00),
    (3, '2025-01-05', 103, 75.00),
    (4, '2026-02-10', 101, 300.00),
    (5, '2027-02-15', 102, 100.00),
    (6, '2023-02-28', 103, 250.00),
    (7, '2024-06-15', 104, 500.00);
    
select * from s1 ;  

select YEAR(OrderDate) from Sales_Partitioned ;

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 's1';



-- partition by list

create table  s2(
course_name varchar(50) ,
course_id int(10) ,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by list(course_launch_year)(
partition p0 values in(2019,2020,2015, 2018),
partition p1 values in(2022,2021,2023, 2024,2025 )
);


insert into s2 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2016) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 112 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 113 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 114 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 116 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 117 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019),
('Dl' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022);



select partition_name , table_name , table_rows from information_schema.partitions where table_name = 's2';



-- partition by hash


create table  s3(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by hash(course_launch_year)
partitions 5;

insert into s3 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2013) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 112 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 113 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 114 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 116 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 117 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019),
('Dl' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022);


select * from s3 ;


select partition_name , table_name , table_rows from information_schema.partitions where table_name = 's3';

-- subpartition

create table s4(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by range(course_launch_year)
subpartition by hash(course_launch_year)
subpartitions 5 (
partition p0 values less than (2005) ,
partition p1 values less than (2010) ,
partition p2 values less than (2015) ,
partition p3 values less than (2020),
partition p4 values less than maxvalue
);



select partition_name , table_name , table_rows from information_schema.partitions where table_name = 's4';

insert ignore into s4 values
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu', 1988) ;


