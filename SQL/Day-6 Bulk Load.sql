use class11 ;

show tables ;

select * from dress limit 50 offset 420 ;


create table if not exists bank(
age int,
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int ,
housing varchar(30),
loan varchar(30) ,
contact varchar(30),
`day` int,
`month` varchar(30) ,
duration int ,
campaign int,
pdays int ,
previous int ,
poutcome varchar(30) ,
y varchar(30));


SET SESSION sql_mode = '';

set sql_safe_updates = 0 ;

load data infile 
"F:/Dataset/bank-full.csv"
into table bank
fields terminated by ';'
value enclosed by '"'
lines terminated by '\n'
ignore 1 rows;


LOAD DATA INFILE 'F:/Dataset/bank-full.csv'
INTO TABLE bank
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


select * from bank ;

truncate table bank ;


CREATE TABLE sales_data_final (
	order_id VARCHAR(15) NOT NULL, 
	order_date DATE NOT NULL, 
	ship_date DATE NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 5) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
);


load data infile 
"F:/sales_data_final.csv"
INTO TABLE sales_data_final
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from sales_data_final ;




---------------------------------------------------------------------

1. anaconda prompt

2. pip install csvkit

3. D:   , E: 

4. csvsql --dialect mysql --snifflimit 100000 sales_data_final.csv > output_sales.sql 


