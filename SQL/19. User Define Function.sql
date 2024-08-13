use win_fun ;

show tables ;

select * from inst_students ;


select * from inst_students where students_marks = (select min(students_marks) from 
(select students_marks from inst_students where student_batch = "fsda" order by students_marks desc limit 3) as top);


select students_marks from inst_students 
where student_batch ="fsda" order by students_marks desc limit 3;


select student_id , student_batch , student_stream, students_marks ,
row_number() over (order by students_marks) as 'row_number' from inst_students;


select * from (select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc) as 'row_num' 
from inst_students ) as test where row_num = 1;


select student_id , student_batch , student_stream,students_marks ,
row_number() over(order by students_marks desc) as 'row_number',
rank() over(order by students_marks desc ) as 'row_rank' 
from inst_students;


select * from (select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc) as 'row_number',
rank() over(partition by student_batch order by students_marks desc ) as 'row_rank' 
from inst_students ) as test where row_rank = 3;

select * from (select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc) as 'row_number',
rank() over(partition by student_batch order by students_marks desc ) as 'row_rank',
dense_rank() over( partition by student_batch order by students_marks desc) as 'dense_rank'
from inst_students ) as test where `dense_rank` = 2;

select * from (select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc) as 'row_number',
dense_rank() over( partition by student_batch order by students_marks desc) as 'dense_rank'
from inst_students ) as test where `dense_rank` = 4;


select * from (select student_id , student_batch , student_stream,students_marks ,
dense_rank() over( partition by student_batch order by students_marks desc) as 'dense_rank'
from inst_students ) as test where `dense_rank` = 4;


--------------------------------------------------


use practice; 


DELIMITER $$
create function UF (A INT) 
returns INT 
DETERMINISTIC
BEGIN 
	DECLARE B int ;
	set B = A + 10 ;
	return B ;
end $$


select * from bank ;

select age, uf(age) as new_age from bank ;

select rating, uf(rating) from dress ;


select profit, UF(profit) as pf from sales ;


select students_marks, practice.UF(students_marks) from inst_students ;



DELIMITER $$
create function UF2(p float, d float )
returns float
Deterministic
Begin 
	Declare FP float ;
	set FP = p - d ;
	return FP;
end $$


select * from sales ;

select profit, discount, UF2(profit, discount) as real_profit from sales ;


-- condition with function 

1  - 100 - super affordable product 
100 -300 - affordable 
300 - 600 - moderate price 
600 + - expensive 

1- 5 - toddler 
5 - 10 - kids
10 - 18 - tenagers
18 - 30 - young
30 - 60 - man
60 -70 - senior citizen 
70 + - super senior


delimiter &&
create function age_UF(a int)
returns varchar(20)
Deterministic
Begin
	declare b varchar(20);
	if a >= 1 and a < 18 then
		set b = "teenager";
	elseif a >=18 and a < 30 then
		set b = "youngers";
	elseif a >= 30 and a < 60 then
		set b = "man";
	elseif a = 60 then 
		set b = "senior citizen" ;   
	else
		set b = "super senior citizen";
end if;
return b;
END &&


select age, age_UF(age) as cat_age from bank ;


CREATE FUNCTION MULTIVALUED()  
RETURNS @Employee TABLE (id INT, emp_name VARCHAR(50), salary INT) AS  
BEGIN  
    INSERT INTO @Employee  
    SELECT E.id, E.emp_name, E.salary FROM Employee E;  
    UPDATE @Employee SET emp_name = 'Graeme Smith' WHERE id = 3;  
    RETURN  
END 



DELIMITER $$
CREATE FUNCTION calculate_discount(price DECIMAL(10,2), discount_rate DECIMAL(5,2))
RETURNS DECIMAL(10,2)
Deterministic 
BEGIN
    DECLARE discount DECIMAL(10,2);
    DECLARE final_price DECIMAL(10,2);

    -- Check if discount_rate is between 0 and 100
    IF discount_rate < 0 OR discount_rate > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Discount rate must be between 0 and 100';
    END IF;

    -- Calculate the discount amount and final price
    SET discount = price * (discount_rate / 100);
    SET final_price = price - discount;

    RETURN final_price;
END$$


select * from sales ;


-- Create the Product table
CREATE TABLE Product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    productname VARCHAR(100),
    price DECIMAL(10, 2),
    discountrate DECIMAL(5, 2),
    quantity INT
);

-- Insert 20 records into the Product table
INSERT INTO Product (productname, price, discountrate, quantity) VALUES
('Laptop', 999.99, 110.00, 50),
('Smartphone', 499.99, -5.00, 100),
('Tablet', 299.99, 15.00, 80),
('Headphones', 89.99, 20.00, 150),
('Keyboard', 49.99, 10.00, 200),
('Mouse', 29.99, 5.00, 300),
('Monitor', 179.99, 12.00, 60),
('Printer', 129.99, 8.00, 40),
('Webcam', 79.99, 10.00, 70),
('Smartwatch', 199.99, 25.00, 90),
('Desk Chair', 159.99, 15.00, 45),
('USB Drive', 29.99, 5.00, 250),
('External Hard Drive', 119.99, 20.00, 55),
('Router', 89.99, 10.00, 65),
('Speaker', 149.99, 12.00, 85),
('Microphone', 69.99, 8.00, 95),
('Graphics Card', 349.99, 15.00, 35),
('Motherboard', 249.99, 10.00, 40),
('RAM', 89.99, 5.00, 120),
('Power Supply', 69.99, 10.00, 75),
('Cooling Fan', 39.99, 15.00, 110);


select * from product ;


select price, discountrate, calculate_discount(price, discountrate) from product ;


