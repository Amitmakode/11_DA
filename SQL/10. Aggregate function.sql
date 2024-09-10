create database aggr_fun ;

use aggr_fun ;

-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- Insert sample data into orders table
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 101, '2024-01-01', 250.00),
(2, 102, '2024-01-02', 180.00),
(3, 103, '2024-01-03', 350.00),
(4, 101, '2024-01-04', 420.00),
(5, 104, '2024-01-05', 300.00),
(6, 102, '2024-01-06', 210.00),
(7, 101, '2024-01-07', 280.00),
(8, 103, '2024-01-08', 390.00),
(9, 105, '2024-01-09', 270.00),
(10, 101, '2024-01-10', 320.00),
(11, 104, '2024-01-11', 400.00),
(12, 102, '2024-01-12', 240.00),
(13, 103, '2024-01-13', 360.00),
(14, 105, '2024-01-14', 310.00),
(15, 101, '2024-01-15', 380.00),
(16, 102, '2024-01-16', 220.00),
(17, 104, '2024-01-17', 420.00),
(18, 103, '2024-01-18', 340.00),
(19, 105, '2024-01-19', 290.00),
(20, 101, '2024-01-20', 350.00),
(21, 102, '2024-01-21', 260.00),
(22, 104, '2024-01-22', 390.00),
(23, 103, '2024-01-23', 310.00),
(24, 105, '2024-01-24', 380.00),
(25, 101, '2024-01-25', 300.00),
(26, 102, '2024-01-26', 230.00),
(27, 104, '2024-01-27', 360.00),
(28, 103, '2024-01-28', 330.00),
(29, 105, '2024-01-29', 320.00),
(30, 101, '2024-01-30', 370.00),
(31, 102, '2024-01-31', 270.00),
(32, 104, '2024-02-01', 410.00),
(33, 103, '2024-02-02', 320.00),
(34, 105, '2024-02-03', 300.00),
(35, 101, '2024-02-04', 390.00),
(36, 102, '2024-02-05', 280.00),
(37, 104, '2024-02-06', 420.00),
(38, 103, '2024-02-07', 350.00),
(39, 105, '2024-02-08', 330.00),
(40, 101, '2024-02-09', 400.00),
(41, 102, '2024-02-10', 290.00),
(42, 104, '2024-02-11', 440.00),
(43, 103, '2024-02-12', 360.00),
(44, 105, '2024-02-13', 340.00),
(45, 101, '2024-02-14', 410.00),
(46, 102, '2024-02-15', 300.00),
(47, 104, '2024-02-16', 430.00),
(48, 103, '2024-02-17', 370.00),
(49, 105, '2024-02-18', 350.00),
(50, 101, '2024-02-19', 420.00);


select * from orders ;


SELECT customer_id, COUNT(order_id) AS num_orders
FROM orders
GROUP BY customer_id;


SELECT customer_id, COUNT(DISTINCT order_id) AS num_products
FROM orders
GROUP BY customer_id ;


select count(DISTINCT customer_id) from orders ;


SELECT SUM(total_amount) AS total_revenue
FROM orders ;

SELECT order_id, avg(total_amount), sum(total_amount) AS total_revenue
FROM orders ;

select customer_id, count(customer_id) as counts from orders group by customer_id order by counts desc ;


SELECT customer_id, AVG(total_amount) AS avg_order_amount
FROM orders
GROUP BY customer_id;

SELECT MIN(order_date) AS earliest_order_date
FROM orders ;


SELECT max(order_date) AS earliest_order_date
FROM orders ;

SELECT avg(order_date) AS earliest_order_date
FROM orders ;

SELECT count(order_date) AS earliest_order_date
FROM orders ;


SELECT count(distinct order_date) AS earliest_order_date
FROM orders ;


SELECT customer_id, order_id, total_amount,
SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_id) AS cumulative_total
FROM orders ;


SELECT product_id, order_id, quantity,
       SUM(quantity) OVER (PARTITION BY product_id ORDER BY order_id) AS running_total_quantity
FROM order_details;


SELECT customer_id, order_date, total_amount,
AVG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date 
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS avg_order_amount
FROM orders;


SELECT order_id, customer_id, order_date,
ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS row_num
FROM orders;


SELECT customer_id, total_spent,
RANK() OVER (ORDER BY total_spent DESC) AS spending_rank
FROM 
(SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders GROUP BY customer_id) 
AS customer_spending;


SELECT customer_id, total_spent,
dense_rank() OVER (ORDER BY total_spent DESC) AS spending_rank
FROM 
(SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders GROUP BY customer_id) 
AS customer_spending;


SELECT 
    product_name,
    price,
    stock_quantity,
    MIN(price) OVER () AS min_price,
    MAX(price) OVER () AS max_price,
    AVG(price) OVER () AS avg_price,
    ROW_NUMBER() OVER (ORDER BY stock_quantity DESC) AS stock_rank
FROM products ORDER BY stock_quantity DESC ;


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10, 2),
    stock_quantity INT
);

INSERT INTO products (product_id, product_name, category_id, price, stock_quantity)
VALUES
(101, 'Product A', 1, 50.00, 100),
(102, 'Product B', 2, 100.00, 50),
(103, 'Product C', 1, 60.00, 75),
(104, 'Product D', 3, 75.00, 120),
(105, 'Product E', 2, 100.00, 80) ;


-------------------------------------------------------------------------

CREATE TABLE Employees (
    EMNO INT,
    ENAME VARCHAR(50),
    JOB VARCHAR(50),
    MGR INT,
    HIREDATE DATE,
    SAL DECIMAL(10,2),
    COMM DECIMAL(10,2),
    DEPTNO INT
);

INSERT INTO Employees (EMNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES
(7369, 'Smith', 'Clerk', 7902, '1980-12-17', 800.00, 100.00, 20),
(7499, 'Allen', 'Salesman', 7698, '1981-02-20', 1600.00, 300.00, 30),
(7521, 'Ward', 'Salesman', 7698, '1981-02-22', 1250.00, 500.00, 30),
(7566, 'Jones', 'Manager', 7839, '1981-04-02', 2975.00, NULL, 20),
(7654, 'Martin', 'Salesman', 7698, '1981-09-28', 1250.00, 1400.00, 30),
(7698, 'Blake', 'Manager', 7839, '1981-05-01', 2850.00, NULL, 30),
(7782, 'Clark', 'Manager', 7839, '1981-06-09', 2450.00, NULL, 10),
(7788, 'Scott', 'Analyst', 7566, '1982-12-09', 3000.00, NULL, 20),
(7839, 'King', 'President', NULL, '1981-11-17', 5000.00, NULL, 10),
(7844, 'Turner', 'Salesman', 7698, '1981-09-08', 1500.00, 0.00, 30),
(7876, 'Adams', 'Clerk', 7788, '1983-01-12', 1100.00, NULL, 20),
(7900, 'James', 'Clerk', 7698, '1981-12-03', 950.00, NULL, 30),
(7902, 'Ford', 'Analyst', 7566, '1981-12-05', 3000.00, NULL, 20),
(7934, 'Miller', 'Clerk', 7782, '1982-01-23', 1300.00, NULL, 10),
(7360, 'John', 'Developer', 7902, '1980-12-17', 850.00, 150.00, 20),
(7361, 'Anna', 'Manager', 7902, '1980-12-17', 1800.00, 200.00, 20),
(7362, 'Paul', 'Tester', 7902, '1980-12-17', 900.00, 100.00, 20),
(7363, 'Oscar', 'Designer', 7902, '1980-12-17', 1200.00, 300.00, 20),
(7364, 'Maria', 'Manager', 7902, '1980-12-17', 1900.00, 400.00, 20),
(7365, 'Eva', 'Clerk', 7902, '1980-12-17', 1000.00, 50.00, 20),
(7366, 'Mark', 'Salesman', 7902, '1980-12-17', 1400.00, 200.00, 20),
(7367, 'Lucas', 'Analyst', 7902, '1980-12-17', 2400.00, NULL, 20),
(7368, 'Bella', 'Clerk', 7902, '1980-12-17', 1100.00, 100.00, 20),
(7369, 'Sophia', 'Clerk', 7902, '1980-12-17', 800.00, 100.00, 20),
(7370, 'Lily', 'Manager', 7902, '1980-12-17', 1700.00, 300.00, 20),
(7371, 'Max', 'Salesman', 7902, '1980-12-17', 1500.00, 200.00, 20),
(7372, 'Ethan', 'Analyst', 7902, '1980-12-17', 2300.00, NULL, 20),
(7373, 'Emma', 'Clerk', 7902, '1980-12-17', 1200.00, 100.00, 20),
(7374, 'William', 'Clerk', 7902, '1980-12-17', 900.00, 50.00, 20),
(7375, 'Benjamin', 'Developer', 7902, '1980-12-17', 1300.00, 150.00, 20),
(7376, 'Ava', 'Manager', 7902, '1980-12-17', 1800.00, 200.00, 20),
(7377, 'Oliver', 'Tester', 7902, '1980-12-17', 950.00, 100.00, 20),
(7378, 'Amelia', 'Designer', 7902, '1980-12-17', 1200.00, 300.00, 20),
(7379, 'Mia', 'Manager', 7902, '1980-12-17', 1900.00, 400.00, 20),
(7380, 'Lucas', 'Clerk', 7902, '1980-12-17', 1000.00, 50.00, 20),
(7381, 'Harper', 'Salesman', 7902, '1980-12-17', 1400.00, 200.00, 20),
(7382, 'Evelyn', 'Analyst', 7902, '1980-12-17', 2400.00, NULL, 20),
(7383, 'Logan', 'Clerk', 7902, '1980-12-17', 1100.00, 100.00, 20),
(7384, 'Ella', 'Clerk', 7902, '1980-12-17', 800.00, 100.00, 20),
(7385, 'James', 'Manager', 7902, '1980-12-17', 1700.00, 300.00, 20),
(7386, 'Lucas', 'Salesman', 7902, '1980-12-17', 1500.00, 200.00, 20),
(7387, 'Henry', 'Analyst', 7902, '1980-12-17', 2300.00, NULL, 20),
(7388, 'Olivia', 'Clerk', 7902, '1980-12-17', 1200.00, 100.00, 20),
(7389, 'William', 'Clerk', 7902, '1980-12-17', 900.00, 50.00, 20),
(7390, 'Emily', 'Developer', 7902, '1980-12-17', 1300.00, 150.00, 20),
(7391, 'Lucas', 'Manager', 7902, '1980-12-17', 1800.00, 200.00, 20),
(7392, 'Liam', 'Tester', 7902, '1980-12-17', 950.00, 100.00, 20),
(7393, 'Ava', 'Designer', 7902, '1980-12-17', 1200.00, 300.00, 20),
(7394, 'Benjamin', 'Manager', 7902, '1980-12-17', 1900.00, 400.00, 20),
(7395, 'Emma', 'Clerk', 7902, '1980-12-17', 1000.00, 50.00, 20),
(7396, 'William', 'Salesman', 7902, '1980-12-17', 1400.00, 200.00, 20),
(7397, 'Olivia', 'Analyst', 7902, '1980-12-17', 2400.00, NULL, 20) ;


select * from employees ;


-- Display all the information of the EMP table?

select * from employees ;

-- Display unique Jobs from EMP table?

select Distinct job from employees ;

select count(Distinct job) from employees ;


-- List the emps in the asc order of their Salaries?

select * from employees order by sal ;

select ename, sal from employees order by sal desc ;

-- List the details of the emps in asc order of the Dptnos and desc of Jobs?

select * from employees order by job desc ;

-- Display all the unique job groups in the descending order?

select distinct job from employees group by job order by job desc ;

select sal, distinct job from employees order by job desc ;

select avg(sal), job from employees  group by job  order by job desc ;

-- Display all the details of all ‘Mgrs’

select * from employees ;

Select * from employees where emno in ( select mgr from employees ) ;

-- List the emps who joined before 1981.

select ename, hiredate from employees where year(hiredate) < 1981 ;

-- List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.

select emno, ename, sal, sal/30 as daily_sal, sal*12 as ann_sal from employees order by ann_sal ;


select * from employees where job = "tester" and sal > 900;

select * from employees where job = "tester" or sal > 900;

select * from employees where not job = "tester" ;

select * from employees where not job = "tester" and not sal < 1000 ;

select * from employees where not (job = "tester" and  sal < 900 );

select * from employees where (job = "tester"  or job = "clerk") and sal > 1000 ;

