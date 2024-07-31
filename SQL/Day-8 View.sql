create database views ;

use views ;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    `Name` VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    EmployeeID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);


insert into employees values
(1, "rahul", "ME", 22000),
(2, "rahul2", "ME2", 21000),
(3, "rahul3", "ME3", 20000),
(4, "rahul4", "ME4", 19000) ;

insert into orders values
(101, 1, "2020-12-12", 45000),
(102, 2, "2020-12-12", 45000),
(103, 3, "2020-12-12", 45000),
(104, 4, "2020-12-12", 45000) ;


select * from employees ;
select * from orders ;


-- 1. Simple View Example
-- Create a view to get employee names and their departments

CREATE VIEW EmployeeDetails AS
SELECT EmployeeID, `Name`, Department
FROM Employees;

select * from EmployeeDetails ;


-- 2. Aggregated View Example
-- Create a view to get total sales amount per employee

CREATE VIEW EmployeeSales AS
SELECT e.`Name`, SUM(o.TotalAmount) AS TotalSales
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.`Name`;


select * from EmployeeSales ;


-- Example tables
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    `Name` VARCHAR(100),
    Age INT,
    GPA DECIMAL(3, 2)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(3, 1),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


insert into students values
(1, "rohit", 22, 6.77),
(2, "aarti", 20, 8.77),
(3, "dipali", 23, 7.77),
(4, "mayuri", 24, 8.77),
(5, "vijay", 21, 5.77) ;

insert into courses values
(11, "DA", 33 ),
(12, "Ds", 35 ),
(13, "BA", 37 ),
(14, "SF", 31 ),
(15, "SAP", 43 ) ;

insert into Enrollments values
(101, 1, 11, 8.8),
(102, 1, 12, 8.9),
(103, 2, 13, 8.8),
(104, 4, 14, 8.8),
(105, 3, 15, 8.8),
(106, 5, 11, 8.8),
(107, 1, 14, 8.8),
(108, 3, 13, 8.8) ;


select * from students ;

select * from courses ;

select * from enrollments ;




-- 2. Join View Example
-- Create a view to show student enrollments with course names

CREATE VIEW StudentEnrollments AS
SELECT s.`Name` AS StudentName, c.CourseName as coursename, e.Grade 
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;

select * from StudentEnrollments ;

select * from StudentEnrollments where coursename = "BA" ;

update StudentEnrollments 
set grade = 7 where coursename = "BA" ;


delete from StudentEnrollments
where studentname = "mayuri" ;

insert into StudentEnrollments (studentname, coursename, grade )values ("sagar", "DA", 9.9) ;


-- 1. Simple View Example
-- Create a view to display student names and their ages

CREATE VIEW StudentInfo AS
SELECT StudentID, `Name`, Age
FROM Students;


select * from StudentInfo ;

insert into StudentInfo values (6, "parag", 25) ;

delete from StudentInfo where StudentID = 6 ;

update StudentInfo set age = 55 where age = 21 ;

set sql_safe_updates = 0 ;


select sum(age) from StudentInfo ;

-- Industrial Examples
-- Reporting Views: Views can be used to create reports summarizing sales data, inventory levels, or customer demographics.

-- Security Views: Views can restrict access to sensitive data, such as employee salaries or personal customer information, showing only necessary details to authorized users.

-- Performance Views: Views can precompute frequently used joins or aggregations to optimize query performance, especially in analytical queries where complex joins are common.

-- 1. Simplifying Complex Queries
-- Create a view to show high-performing students (GPA >= 3.5)

CREATE VIEW HighPerformingStudents AS
SELECT StudentID, `Name`, GPA
FROM Students
WHERE GPA >= 7.5;

select * from HighPerformingStudents ;


-- 2. Providing a Layer of Security
-- Create a view to hide employee salaries from non-HR users

CREATE VIEW EmployeeDetailsForHR AS
SELECT EmployeeID, `Name`, Department
FROM Employees;

-- 3. Aggregating Data for Reporting
-- Create a view to summarize total sales per month

CREATE VIEW MonthlySalesSummary AS
SELECT YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, SUM(TotalAmount) AS TotalSales
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate);


select * from MonthlySalesSummary ;


-- 4. Simplifying Data Integration
-- Create a view to combine customer information from multiple tables

CREATE VIEW CustomerInfo AS
SELECT c.CustomerID, c.Name, c.Email, a.Address
FROM Customers c
JOIN Addresses a ON c.AddressID = a.AddressID;

-- Querying the view
SELECT * FROM CustomerInfo;

-- 5. Enhancing Performance
-- Create a view to store frequently accessed join results

CREATE VIEW EmployeeOrderDetails AS
SELECT e.EmployeeID, e.`Name`, o.OrderID, o.OrderDate, o.TotalAmount
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID;

-- Querying the view
SELECT * FROM EmployeeOrderDetails WHERE EmployeeID = 101;

-- 6. Implementing Business Logic
-- Create a view to calculate employee performance based on orders handled

CREATE VIEW EmployeePerformance AS
SELECT e.EmployeeID, e.Name, COUNT(o.OrderID) AS TotalOrders, SUM(o.TotalAmount) AS TotalSales
FROM Employees e
LEFT JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.Name ;


#  . Multi-Level Aggregation and Reporting
-- Create tables (simplified schema)

CREATE TABLE Salespersons (
    SalespersonID INT PRIMARY KEY,
    `Name` VARCHAR(100)
);

insert into Salespersons values
(201, "aniket"),
(202, "vijay"),
(203, "arijit"),
(204, "kunal") ;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);

insert into Products values
(101, "maggie", "food" ),
(102, "butter scotch", "ice-creame" ),
(103, "colgate", "toothpaste" ),
(104, "cococola", "drink" ) ;

CREATE TABLE Orders1 (
    OrderID INT PRIMARY KEY,
    SalespersonID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (SalespersonID) REFERENCES Salespersons(SalespersonID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


insert into Orders1 values 
(1, 201, 101, "2020-12-12", 20, 280),
(2, 202, 102, "2021-12-12", 30, 380),
(3, 203, 103, "2022-12-12", 40, 480),
(4, 204, 104, "2023-12-12", 50, 580) ;


-- Create a view to summarize sales by product category and month

CREATE VIEW MonthlySalesByCategory AS
SELECT p.Category, YEAR(o.OrderDate) AS Year, MONTH(o.OrderDate) AS Month, SUM(o.Quantity * o.Price) AS TotalSales
FROM Orders1 o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.Category, YEAR(o.OrderDate), MONTH(o.OrderDate);


select * from MonthlySalesByCategory ;







