use class11_2 ;

##### composit key


CREATE TABLE student_contacts (
    student_id INT,
    city VARCHAR(100),
    phone_number VARCHAR(20),
    PRIMARY KEY (student_id, city),
    CONSTRAINT fk_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id)
);

INSERT INTO student_contacts (student_id, city, phone_number) VALUES
(2, 'delhi', '555-1234'),
(2, 'Los Angeles', '555-5678'),
(3, 'Chicago', '555-9101');

select * from student_contacts ;


UPDATE student_contacts SET phone_number = '555-3333' WHERE student_id = 2 AND city = 'delhi';


DELETE FROM student_contacts WHERE student_id = 2 AND city = 'delhi';



----------------------------------------------------

### delete cascade

CREATE TABLE courses2 (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE students2 (
    student_id INT PRIMARY KEY,
    `name` VARCHAR(100),
    course_id INT,
    FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
        ON DELETE CASCADE
);

INSERT INTO courses2 (course_id, course_name) VALUES
(101, 'Mathematics'),
(102, 'Science'),
(103, 'History');

INSERT INTO students2 (student_id, `name`, course_id) VALUES
(1, 'John Doe', 101),
(2, 'Jane Smith', 102);

select * from courses2 ;

select * from students2 ;


delete from courses2 where course_id = 102 ;

update courses2 set course_id = 104 where course_id = 101 ;



create table k1 (id int primary key,
 `name`varchar(20), 
 contact int) ;
 
 
 insert into k1 values (1, "anup", 6575679),
 (2, "sagar", 6575678),
 (3, "parag", 6575677),
 (4, "rohan", 6575676) ;
 
 
create table k2 (sr int, 
id int, 
address varchar(20),
FOREIGN KEY (id)
REFERENCES k1(id)
ON DELETE CASCADE
on update cascade
) ;


insert into k2 values (101, 1, "ngp"),
(102, 1, "pune"),
(103, 2, "Mumbai"),
(104, 2, "nashik") ;

select * from k1 ;

select * from k2 ;


update k1 set id = 5 where id = 2 ;

delete from k1 where id = 5 ;


------------------------------------------

# pk and fk accross table

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Inserting data with primary key and foreign key constraints
INSERT INTO departments (department_id, department_name) VALUES (1, 'Engineering');
INSERT INTO employees (employee_id, first_name, last_name, department_id) VALUES (101, 'John', 'Doe', 1);


INSERT INTO departments (department_id, department_name) VALUES (2, 'Marketing');
INSERT INTO employees (employee_id, first_name, last_name, department_id) VALUES (102, 'Jane', 'Smith', 2);

UPDATE employees SET department_id = 2 WHERE employee_id = 101;


DELETE FROM departments WHERE department_id = 1;

--------------------------------------

## CK with FK

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    product_id INT,
    PRIMARY KEY (customer_id, order_date, product_id),
    FOREIGN KEY (customer_id, product_id)
        REFERENCES customers(customer_id, product_id)
);

CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(100),
    product_id INT,
    PRIMARY KEY (customer_id, product_id)
);


INSERT INTO customers (customer_id, customer_name, product_id) VALUES (1, 'John Doe', 101);
INSERT INTO orders (customer_id, order_date, product_id) VALUES (1, '2023-01-15', 101);


UPDATE customers SET product_id = 102 WHERE customer_id = 1;


DELETE FROM orders WHERE customer_id = 1 AND product_id = 101;


------------------------------------------

## unique constraint with FK
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    manager_email VARCHAR(100),
    FOREIGN KEY (manager_email)
        REFERENCES employees(email)
);



INSERT INTO employees (employee_id, first_name, last_name, email) VALUES (1, 'John', 'Doe', 'john.doe@example.com');
INSERT INTO departments (department_id, department_name, manager_email) VALUES (101, 'Engineering', 'john.doe@example.com');


UPDATE employees SET email = 'j.doe@example.com' WHERE employee_id = 1;


DELETE FROM departments WHERE department_id = 101;


---------------------------

## librabry manament example

-- Authors table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100),
    nationality VARCHAR(50)
);

-- Books table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    author_id INT,
    publication_year YEAR,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Members table
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

-- Borrowings table with composite key and foreign keys
CREATE TABLE borrowings (
    borrowing_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrowing_date DATE,
    due_date DATE,
    returned_date DATE,
    PRIMARY KEY (member_id, book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Reservations table linking reservations to members and books
CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    reservation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Inserting sample data
INSERT INTO authors (author_name, nationality) VALUES
('Jane Austen', 'British'),
('Mark Twain', 'American');

INSERT INTO books (title, author_id, publication_year) VALUES
('Pride and Prejudice', 1, 1813),
('The Adventures of Tom Sawyer', 2, 1876);

INSERT INTO members (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com');

-- Borrowing books
INSERT INTO borrowings (member_id, book_id, borrowing_date, due_date) VALUES
(1, 1, '2023-06-01', '2023-06-15'),
(2, 2, '2023-06-05', '2023-06-20');

-- Reserving books
INSERT INTO reservations (member_id, book_id) VALUES
(1, 2),
(2, 1);




SELECT VERSION ();



