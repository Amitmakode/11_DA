use cases ;

select * from employees ;

select * from orders ;



select * ,
case 
    when salary = 180000 then "high"
    when salary = 55000 then "low"
    else "avg salary"
end as sal_cat 
from employees ;


select salary ,
case 
    when salary = 180000 then "high"
    when salary = 55000 then "low"
    else "avg salary"
end as sal_cat 
from employees ;


-------------------------------------------------------------

CREATE TABLE employee1 (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary INT,
    department VARCHAR(50)
);


INSERT INTO employee1 (employee_id, employee_name, salary, department)
VALUES
    (17, 'John Doe', 40000, 'HR'),
    (18, 'Jane Smith', 45000, 'IT'),
    (19, 'Michael Johnson', null, 'Finance'),
    (4, 'Emily Davis', 52000, 'IT'),
    (5, 'Chris Lee', 58000, 'HR'),
    (6, 'John Doe', 50000, 'HR'),
    (7, 'Jane Smith', 60000, 'IT'),
    (8, 'Michael Johnson', 55000, 'Finance'),
    (9, 'Emily Davis', 52000, 'IT'),
    (10, 'Chris Lee', 58000, 'HR'),
    (11, 'John Doe', 50000, 'HR'),
    (12, 'Jane Smith', 60000, 'IT'),
    (13, 'Michael Johnson', 55000, 'Finance'),
    (14, 'Emily Davis', 52000, 'IT'),
    (15, 'Chris Lee', 58000, 'HR');
    
    
select * from employee1 ;    




select department, salary,
case
	when salary > 55000 then "high"
    when salary < 53000 then "low"
    else "avg"
end as salary_flag
from employee1 ;   



SELECT employee_name, department,
    CASE department
        WHEN 'HR' THEN 'Human Resources'
        WHEN 'IT' THEN 'Information Technology'
        WHEN 'Finance' THEN 'Finance Department'
        ELSE 'Other'
    END AS department_category
FROM
    employee1; 
    
    
SELECT employee_name, salary,
    CASE
        WHEN salary IS NULL THEN 'Salary Not Specified'
        WHEN salary < 50000 THEN 'Low Salary'
        WHEN salary >= 50000 AND salary < 55000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS salary_status
FROM
    employee1;  
    
    
SELECT employee_name, salary,
    CASE
        WHEN salary IS NULL THEN 'Salary Not Specified'
        WHEN salary < 50000 THEN 'Low Salary'
        WHEN salary between 50000 AND 55000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS salary_status
FROM
    employee1;  
    


INSERT INTO orders (order_id, order_date, order_amount, customer_id)
VALUES
    (9, '2023-10-05', 150.75, 101),
    (17, '2023-07-10', 300.50, 102),
    (18, '2023-12-15', 75.25, 103),
    (12, '2023-05-20', 500.00, 104),
    (13, '2023-11-25', 250.00, 105),
    (14, '2023-07-30', 400.75, 101),
    (15, '2023-10-05', 100.00, 102),
    (16, '2023-08-10', 800.25, 103);


select * from orders ;    
    
SELECT order_id, order_date,
    CASE
        WHEN MONTH(order_date) <= 3 THEN 'Q1'
        WHEN MONTH(order_date) > 3 AND MONTH(order_date) <= 6 THEN 'Q2'
        WHEN MONTH(order_date) > 6 AND MONTH(order_date) <= 9 THEN 'Q3'
        ELSE 'Q4'
    END AS quarter
FROM orders;  



SELECT customer_id,
    COUNT(order_id) AS num_orders,
    CASE
        WHEN COUNT(order_id) = 1 THEN 'Single Order'
        WHEN COUNT(order_id) > 1 AND COUNT(order_id) <= 3 THEN 'Few Orders'
        ELSE 'Many Orders'
    END AS order_frequency
FROM orders GROUP BY customer_id;  



update employee1 
set department = case 
	when department = 'IT' then 'Information technology'
	when department = 'HR' then 'Human Resource'
end; 


set sql_safe_updates = 0 ;

select * from employee1 ;

update employee1 
set department = case 
	when department = 'IT' then 'Information technology'
	when department = 'HR' then 'Human Resource'
end;   


rollback ;  


DELETE FROM
    orders
WHERE
    CASE
        WHEN order_id = 8  THEN 1
        when order_id = 10  THEN 1
		when order_id = 11  THEN 1
        ELSE 0
    END = 1;


SELECT product_name, sales, profit,
    CASE
        WHEN profit/sales >= 0.2 THEN 'High Margin'
        WHEN profit/sales >= 0.1 THEN 'Medium Margin'
        ELSE 'Low Margin'
    END AS profit_margin_category
FROM sales
WHERE SUBSTRING(order_date_real, 7, 4) = '2011' LIMIT 0, 1000;
