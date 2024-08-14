use 5_30 ;

drop table t_school;

CREATE TABLE t_school(ID INT, School_Name VARCHAR(40), 
Number_Of_Students INT, Number_Of_Teachers INT, Number_Of_Classrooms INT, EmailID VARCHAR(40));

-- BEGIN / START TRANSACTION command is used to start the transaction

START TRANSACTION;  

 INSERT INTO t_school(ID, School_Name, Number_Of_Students, Number_Of_Teachers,
 Number_Of_Classrooms, EmailID) 
 VALUES(1, "Boys Town Public School", 1000, 80, 12, "btps15@gmail.com"), 
 (2, "Guru Govind Singh Public School", 800, 35, 15, "ggps25@gmail.com"), 
 (3, "Delhi Public School", 1200, 30, 10, "dps101@gmail.com"), 
 (4, "Ashoka Universal School", 1110, 40, 40, "aus17@gmail.com"), 
 (5, "Calibers English Medium School", 9000, 31, 50, "cems@gmail.com");
 
 
 
select * from t_school ;

COMMIT; 

rollback ;

SET autocommit = 0;   

-- MySQL, by default, commits every query the user executes. But if the 
-- user wishes to commit only the specific queries instead
-- of committing every query, then turning off the autocommit is useful.


-- For example, we can save all the insert related queries with the savepoint named INS. 
-- To save all the insert related queries in one savepoint, we have to execute 
-- the SAVEPOINT query followed by the savepoint name after finishing the insert command execution.


SAVEPOINT savepoint_name;  


ROLLBACK TO savepoint_name; 

-------------------------------------------------------------------------------
-- Example -1 


CREATE TABLE t_school1(ID INT, School_Name VARCHAR(40),
 Number_Of_Students INT, Number_Of_Teachers INT, Number_Of_Classrooms INT, EmailID VARCHAR(40));  
 


INSERT INTO t_school1(ID, School_Name, Number_Of_Students,
 Number_Of_Teachers, Number_Of_Classrooms, EmailID)
 VALUES(6, "Boys Town Public School", 1000, 80, 12, "btps15@gmail.com"), 
 (2, "Guru Govind Singh Public School", 800, 35, 15, "ggps25@gmail.com"), 
 (3, "Delhi Public School", 1200, 30, 10, "dps101@gmail.com"),
 (4, "Ashoka Universal School", 1110, 40, 40, "aus17@gmail.com"),
 (5, "Calibers English Medium School", 9000, 31, 50, "cems@gmail.com"),
 (6, "Calibers English Medium School", 10000, 31, 50, "cems@gmail.com");  
 
 
 
SELECT *FROM t_school1;  
 
 
START TRANSACTION;  
 
SAVEPOINT Insertion; 

set sql_safe_updates = 0 ;

UPDATE t_school1 SET Number_Of_Students = 9050 WHERE ID = 5;  

SELECT *FROM t_school1;  

SAVEPOINT Updation;  

ROLLBACK TO Insertion;  

SELECT *FROM t_school1;  

rollback to Updation;


------------------------------------------------------------------------

-- Example -2 



CREATE TABLE customer(Customer_ID INT PRIMARY KEY, Name VARCHAR(20),
 Age INT, Salary INT, Salary_BankAccount VARCHAR(20));  
 
INSERT INTO customer(Customer_ID, Name, Age, Salary, Salary_BankAccount) 
VALUES(1, "Aryan Jain", 51, 56000, "SBI"), 
(2, "Arohi Dixit", 21, 25000, "Axis"), 
(3, "Vineet Garg", 24, 31000, "ICICI"), 
(4, "Anuja Sharma", 26, 49000, "HDFC"), 
(5, "Deepak Kohli", 28, 65000, "SBI");  


SELECT *FROM customer;  

START TRANSACTION;  

SAVEPOINT Insertion1;  

DELETE FROM customer WHERE Customer_ID = 5; 

SELECT *FROM customer;  

SAVEPOINT Deletion;  

ROLLBACK TO Insertion1;  

SELECT *FROM customer; 




 







