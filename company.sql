DROP DATABASE if exists company;
CREATE DATABASE company ;
USE company;
CREATE TABLE company( 
id int primary key, 
name varchar(50), 
city varchar(20), 
age Int not null, 
salary INT not null);
INSERT INTO company Values
(101,"vaibhavi","pune", 28, 24000),
(102,"vaibhav","pune", 29,23000),
(103,"suresh","mumbai",32,15000),
(104,"ramesh","nagar",40,10000),
(105,"shailesh","nagar",32,12000);
select*from company order by city asc limit 3;
select max(salary) from company;
select city, count(name)  from company group by city;
select name from company;
select city, avg(age) 
from company
group by city
order by city;

