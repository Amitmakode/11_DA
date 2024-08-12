use cte ;


show tables ;


-- Using CTE to query the Employees table

select * from employees ;

insert into employees values(2, "sagar", "B", 2),
(4, "sagar", "B", 2),
(5, "sagar", "C", 5),
(6, "sagar", "F", 6),
(7, "sagar", "H", 7) ;


WITH DepartmentCTE AS (
    SELECT DepartmentID, COUNT(*) AS NumEmployees
    FROM Employees
    GROUP BY DepartmentID
)
SELECT DepartmentID, NumEmployees
FROM DepartmentCTE;


select * from bank ;


use practice ;


with cte1 as (
			select age, sum(balance) as total_balance from bank group by  age 
)  
select age, total_balance from cte1 where age > 35 ;


-- Using CTE with JOIN


WITH EmployeeDetails AS 
(
    SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
    FROM Employees e
    JOIN Departments d ON e.DepartmentID = d.DepartmentID
)
SELECT * FROM EmployeeDetails;



-- Using CTE with DELETE


WITH EmployeesToDelete AS 
(
    SELECT EmployeeID, firstname,DepartmentID 
    FROM Employees
    WHERE DepartmentID = 2
)
DELETE FROM Employees
WHERE EmployeeID IN (SELECT EmployeeID FROM EmployeesToDelete);


WITH EmployeesToDelete AS 
(
    SELECT EmployeeID, firstname,DepartmentID 
    FROM Employees
    WHERE DepartmentID = 2
)
DELETE FROM EmployeesToDelete
WHERE EmployeeID = 4 ;


set sql_safe_updates = 0 ;

-- Using CTE with JOIN and filtering

WITH HighValueProducts AS 
(
    SELECT p.ProductID, p.ProductName, s.TotalAmount
    FROM Products p
    JOIN (
        SELECT ProductID, SUM(Amount) AS TotalAmount
        FROM Sales
        GROUP BY ProductID
    ) s ON p.ProductID = s.ProductID
    WHERE s.TotalAmount > 200
)
SELECT *
FROM HighValueProducts;



select 1 as col1, 2 as col2; 

select 1 as col1, 2 as col2 
union all
select 5, 4;

with ctetest as 
(select 1 as col1, 2 as col2 
union all
select 3, 4)
select col1 from ctetest;



with recursive cte(n) as 
(select 1 
union all 
select n+1 from cte 
where n<5)
select * from cte;


select 1 as n, 2 as p, -1 as q;


with recursive cte as 
(select 1 as n, 2 as p, -1 as q
union all 
select n+1, p+2, q+4 from cte
 where n<50)
select * from cte;


-- Recursive CTE to calculate factorial

WITH RECURSIVE FactorialCTE (n, factorial) AS 
(
    SELECT 1 AS n, 1 AS factorial
    UNION ALL
    SELECT n + 1, (n + 1) * factorial
    FROM FactorialCTE
    WHERE n < 10 -- Limiting to 10 factorial for demo
)
SELECT n, factorial
FROM FactorialCTE;


-- Recursive CTE to retrieve hierarchical data (e.g., employees reporting structure)


WITH RecursiveEmployeeCTE AS 
(
    SELECT EmployeeID, FirstName, LastName, departmentid, 1 AS `Level`
    FROM Employees
    WHERE departmentid = 1 -- Base case: top-level employees (no manager)

    UNION ALL

    SELECT e.EmployeeID, e.FirstName, e.LastName, e.departmentid, rec.`Level` + 1
    FROM Employees e
    INNER JOIN RecursiveEmployeeCTE rec ON e.departmentid = rec.EmployeeID
)
SELECT EmployeeID, FirstName, LastName, departmentid, `Level`
FROM RecursiveEmployeeCTE;


select * from employees ;



WITH RecursiveEmployeeCTE AS 
(

    SELECT EmployeeID, FirstName, LastName, departmentid, 1 AS n
    FROM Employees
    WHERE departmentid =1  -- Assuming NULL indicates no manager

    UNION ALL
    SELECT EmployeeID, FirstName, LastName, departmentid, n + 1
    FROM Employees 
    
)
SELECT EmployeeID, FirstName, LastName, departmentid, n
FROM RecursiveEmployeeCTE;




