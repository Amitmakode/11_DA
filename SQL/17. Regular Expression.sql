use practice ;

show tables ;

SELECT job FROM bank WHERE job REGEXP '^[ab]' ;  

SELECT job FROM bank WHERE job REGEXP '^blue' ;  

SELECT job FROM bank WHERE job REGEXP 't$' ;  

SELECT job FROM bank WHERE job REGEXP '[nrt]$' ;  

SELECT * FROM bank WHERE job REGEXP '^.{9}$';

SELECT * FROM bank WHERE job REGEXP '^.{6}$';

SELECT job FROM bank WHERE job REGEXP '-'; 

SELECT job FROM bank WHERE job REGEXP 'll'; 

SELECT balance FROM bank WHERE balance REGEXP '11'; 

SELECT balance FROM bank WHERE balance REGEXP 43; 


SELECT ('a' NOT REGEXP '[a-z]') AS not_match;

SELECT ('a'  REGEXP '[a-z]') AS not_match;


SELECT REGEXP_INSTR('a b c d e f', 'b', 1, 1, 0) AS start_index_; 

 
SELECT REGEXP_INSTR('a b c a d e f a', 'a', 4, 2, 0) AS a_index_2;  


SELECT REGEXP_REPLACE ('expression', 'character', 'replace_character'); 

SELECT REGEXP_REPLACE ('pyhton', 'java', 'replace_java'); 



SELECT job, education, balance 
FROM bank   
WHERE education RLIKE 's$|y$'; 


SELECT job, education, balance 
FROM bank   
WHERE job RLIKE 'r$|t$'; 


SELECT job, education, balance 
FROM bank   
WHERE job RLIKE '^u|d$'; 



SELECT   
'Javatpoint' RLIKE '^C | e$' AS 'RLIKE',  
'Javatpoint' NOT RLIKE '^C | e$' AS 'NOT RLIKE';


SELECT job, balance
FROM bank   
WHERE job RLIKE 'ad.in.'; 

SELECT job, balance
FROM bank   
WHERE job RLIKE 'ad..n.'; 

SELECT job, balance
FROM bank   
WHERE job RLIKE '.eti.ed'; 


SELECT   
'Javatpoint' LIKE 'Java%' AS 'Match',  
'Javatpoint' NOT LIKE 'Java%' AS 'Not-Match'; 



SELECT  job from bank where job LIKE 'ent%';


SELECT  job from bank where job LIKE '%t%';


SELECT  job from bank where job LIKE '%r';


SELECT  job from bank where job LIKE 're__red';



CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO employees (first_name, last_name, email) VALUES
('John', 'Doe', 'john58.doe@sapalogy.govt.org'),
('Jane', 'Smith', 'jane55.smith@exam.co.in'),
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Brown', 'bob.brown@example.net'),
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.org'),
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Brown', 'bob.brown@example.net'),
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.org'),
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Brown', 'bob.brown@example.net');


select * from employees ;


-- Find all employees whose email addresses end with .com:


SELECT * FROM employees
WHERE email REGEXP '\\.com$';

SELECT * FROM employees
WHERE email REGEXP '\\.org$';


-- 1. Find all employees whose email addresses contain "example":

-- \\. matches the dot (the dot is escaped with a double backslash).
-- com matches the literal string "com".
-- $ asserts position at the end of a line.



-- 2. Find all employees whose email addresses contain "example":


SELECT * FROM employees
WHERE email REGEXP 'example';



-- 1. Find Employees with Emails Containing Numbers

SELECT * FROM employees
WHERE email REGEXP '[0-9]';


-- 3. Find Employees with Emails Ending in .org or .net


SELECT * FROM employees
WHERE email REGEXP '\\.(org|net)$'; 


-- 4. Find Employees with Emails Having a Domain of Exactly 4 Characters


SELECT * FROM employees
WHERE email REGEXP '@[a-zA-Z0-9]{4}\\.[a-zA-Z]{2,}$';

-- @[a-zA-Z0-9]{4} matches exactly 4 alphanumeric characters after the @.
-- \\. matches the dot before the domain suffix.
-- [a-zA-Z]{2,} matches the domain suffix which should be at least 2 characters long.
-- $ asserts the end of the line.


-- 6. Find Employees with Emails Where the Username is 6 to 12 Characters Long

SELECT * FROM employees
WHERE email REGEXP '@[a-zA-Z0-9]{4,12}\\.';


-- 7. Find Employees with Emails Having More Than One Dot in the Domain

SELECT * FROM employees
WHERE email REGEXP '@[^.]*\\.[^.]*\\.[^.]*$';


-- 4. Find Employees Whose Email Contains a Digit


SELECT * FROM employees
WHERE email regexp '[0-9]';

-- Note: MySQL's LIKE doesn't directly support character classes like [0-9]. 
-- For actual digit matching, you would need to use REGEXP as mentioned earlier.


SELECT * FROM employees
WHERE email LIKE 'john%@%';

-- 7. Find Employees Whose Email Contains Two Dots in the Domain

SELECT * FROM employees
WHERE email LIKE '%@%.%_%';


-- 8. Find Employees Whose Email Username Is Between 6 and 12 Characters Long

SELECT * FROM employees
WHERE email LIKE '______%@%'  -- 6 characters
   OR email LIKE '_______%@%'  -- 7 characters
   OR email LIKE '________%@%'  -- 8 characters
   OR email LIKE '_________%@%'  -- 9 characters
   OR email LIKE '__________%@%' -- 10 characters
   OR email LIKE '___________%@%' -- 11 characters
   OR email LIKE '____________%@%' ;-- 12 characters
   
   
   -- 9. Find Employees Whose Email Domain is Either '.com' or '.net'

SELECT * FROM employees
WHERE email LIKE '%.com'
   OR email LIKE '%.net';
   
   
-- 1. Find Employees with Email Usernames Starting with a Specific Letter

SELECT * FROM employees
WHERE email RLIKE '@[e]';

SELECT * FROM employees
WHERE email RLIKE '^b';


-- 2. Find Employees with Email Addresses Containing Exactly 10 Characters in the Domain

SELECT * FROM employees
WHERE email RLIKE '@[a-zA-Z0-9]{4}\\.';



-- 4. Find Employees with Emails Where the Username Contains Vowels

SELECT * FROM employees
WHERE email RLIKE '^[^@]*[aeiouAEIOU][^@]*@';



-- 10. Find Employees with Emails Where the Domain is Not '.com'

SELECT * FROM employees
WHERE email RLIKE '\\.[^c][^o][^m]$';

SELECT * FROM employees
WHERE email not LIKE '%com';  



