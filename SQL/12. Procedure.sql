use practice ;

show tables ;

select * from sales ;

select * from sales where market = "EU" ;

select * from sales where country = "france" and market = "EU" ;

select * from sales where quantity > 400 ;

select * from sales where market = "APAC" ;

delimiter &&
create procedure p1 ( ) 
begin 
select * from sales ;
END &&

select * from sales ;

call p1 ;

delimiter $$
create procedure p2 (IN A varchar(20))
begin
	select * from sales where market = A;
End $$ 


call p2("EU", "Italy") ;


delimiter &&
create procedure p3 (IN m varchar(20), IN c1 varchar(20), IN c2 varchar(20))
begin
	select market, country from sales where market = m and (country = c1 or country = c2) ;
End &&  


call p3 ("Apac", "India", "china", 500) ;  


select country, length(country) as shortest_city from sales order by  shortest_city, country limit 1
union
select country, length(country) as longest_city from sales order by  longest_city desc,  country  limit 1 ;

regexp




