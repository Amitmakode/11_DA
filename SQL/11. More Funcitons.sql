use practice ;

show tables ;

-- CONCAT(): Concatenates two or more strings together.

select * from customers ;

SELECT CONCAT(customer_name, ' ', email) AS full_name FROM customers;


-- SUBSTRING(): Extracts a substring from a string based on start position and length.

select * from sales ;

SELECT SUBSTRING(category, 1, 3) AS cat FROM sales;

SELECT SUBSTRING(product_id, 5, 30) AS id FROM sales;


-- UPPER() / LOWER(): Converts a string to upper or lower case.

SELECT  category, UPPER(category) AS up_cat FROM sales;

SELECT  category, lower(category) AS Low_cat FROM sales;

-- 2. Date and Time Functions
-- NOW(): Returns the current date and time.

SELECT NOW() AS current_datetime;

select current_time() as timee ;

SELECT DATE_FORMAT(order_date, '%Y-%m-%d') AS formatted_date FROM orders;

select * from orders ;

SELECT order_date, DATE_ADD(order_date, INTERVAL 7 DAY) AS future_date FROM orders;

-- 4. Mathematical Functions
-- ROUND(): Rounds a numeric value to a specified precision.


SELECT ROUND(order_amount, 0) AS rounded_price FROM orders;


-- ABS(): Returns the absolute (positive) value of a numeric expression.

select abs(-599) as absolute ;


-- 5. Aggregate Functions (Summarized)
-- GROUP_CONCAT(): Concatenates values from multiple rows into a single string.

select * from bank ;

SELECT age,
    GROUP_CONCAT(job SEPARATOR '- ') AS jobss
FROM bank
GROUP BY age;


select job from bank where age = 21 ;


-- IFNULL() / ISNULL(): Returns a specified value if the expression is NULL.


SELECT sales, profit, IFNULL(sales, profit) AS final_price FROM sales;

SELECT material, isnull(material) AS final_price FROM dress;

select * from dress ;


-- RAND(): Generates a random number.


SELECT RAND() AS random_number;



select day("2024-08-05") as `day` ;

select month("2024-08-05") as `day` ;

select year("2024-08-05") as `day` ;

select yearweek("2024-08-05") as `day` ;

select week("2024-08-05") as `day` ;

select dayname("2024-08-09") as `day` ;

select dayofmonth("2024-08-05") as `day` ;

select dayofweek("2024-08-05") as `day` ;

select time_to_sec('10:30:55') as `time` ;

select hour('10:30:55') as `time` ;

select minute('10:30:55') as `time` ;


