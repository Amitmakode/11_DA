#Constraints used in MySQL

NOT NULL
CHECK
DEFAULT
PRIMARY KEY
AUTO_INCREMENT  -- it will not use without key column
UNIQUE
INDEX
ENUM
FOREIGN KEY
composite key

use class11 ;

#NOT NULL Constraint

CREATE TABLE Student(Id INTEGER, 
LastName TEXT NOT NULL, 
FirstName TEXT NOT NULL, 
City VARCHAR(35));

INSERT INTO Student VALUES(1, 'Hanks', 'Peter', 'New York');  

INSERT INTO Student VALUES(2, NULL, 'Amanda', 'Florida');

INSERT INTO Student VALUES(3, "lee", 'Amanda', null) ;

describe student ;


#UNIQUE Constraint


CREATE TABLE ShirtBrands(Id INTEGER, 
BrandName VARCHAR(40) UNIQUE, 
Size VARCHAR(30));

INSERT INTO ShirtBrands(Id, BrandName, Size) VALUES(1, 'Pantaloons', 38), (2, 'Cantabil', 40); 
 
INSERT INTO ShirtBrands(Id, BrandName, Size) VALUES(1, null, 38), (2, 'Cantabil', 40); 


select * from shirtbrands ;

describe shirtbrands ;


#CHECK Constraint
#CHECK (expression) 

 
CREATE TABLE Persons (  
    ID int NOT NULL,  
    `Name` varchar(45) NOT NULL,  
    Age int CHECK (Age>=18)  
);  

INSERT INTO Persons(Id, `Name`, Age)   
VALUES (1,'Robert', 28), (2, 'Joseph', 35), (3, 'Peter', 40);  

INSERT INTO Persons(Id, `Name`, Age) VALUES (1,'Robert', 18); 


#DEFAULT Constraint

CREATE TABLE Persons1 (  
    ID int NOT NULL,  
    `Name` varchar(45) NOT NULL,  
    Age int,  
    City varchar(25) DEFAULT 'New York'  
); 

INSERT INTO Persons1(Id, `Name`, Age, City)   
VALUES (1,'Robert', 15, null),   
(2, 'Joseph', 35, 'California'),   
(3, 'Peter', 40, 'Alaska');  

INSERT INTO Persons1(Id, `Name`, Age) VALUES (1,'Brayan', 15);  

SELECT * FROM Persons1; 


#AUTO_INCREMENT Constraint

CREATE TABLE Animals(  
id int NOT NULL AUTO_INCREMENT,   
`name` CHAR(30) NOT NULL,
PRIMARY KEY (id)  
);  

INSERT INTO Animals (`name`) VALUES   
('Tiger'),('Dog'),('Penguin'),   
('Camel'),('Cat'),('Ostrich'); 

INSERT INTO Animals (id, `name`) VALUES  (150, 'Tiger') ;

SELECT * FROM Animals;



#ENUM Constraint

CREATE TABLE Shirts (    
    id INT PRIMARY KEY AUTO_INCREMENT,     
    `name` VARCHAR(35),     
    size ENUM('small', 'medium', 'large', 'x-large')  );  
    
CREATE TABLE Shirts1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(35),
    size ENUM('small', 'medium', 'large', 'x-large')  DEFAULT 'small'
);    

INSERT INTO Shirts(id, `name`, size)     
VALUES (1,'t-shirt', 'medium'),     
(2, 'casual-shirt', 'small'),     
(3, 'formal-shirt', 'large'),
(4, 'formal-shirt', "XXL"); 

INSERT INTO Shirts1(`name`)     
VALUES ('t-shirt') ;

select * from shirts;
select * from customers1 ;


create table students1 (
Rollno int primary key auto_increment,
`name` varchar(20) not null default "unknown",
address varchar(20) not null default "nagpur" check (address = "nagpur"),
age int not null check (age >= 5),
email varchar(20) not null unique,
section enum ("A", "B", "C", "D") default "D" not null
) ;


insert into students1 (age, email)
values ( null, "sagar4@gmail.com") ;

select * from students1 ;





