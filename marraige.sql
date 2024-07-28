
-- 1. create database of marraige data ?
CREATE DATABASE marraige;
use marraige;

-- 2 create table for person data for detailes?
CREATE TABLE person_data( m_id tinyint primary key ,sex varchar(12), age INT NOT NULL , country varchar(30), state varchar(30), city varchar(30),education varchar(30));

-- 3.add new column in above table of birthyear?

alter table person_data add column birthyear date;

INSERT INTO person_data values
(1,'m',24,'INDIA','maharashtra','pune','b com','2000-04-13'),
(2,'m',28,'INDIA','maharashtra','satara','b com','1996-07-23'),
(3,'f',24,'INDIA','maharashtra','pune','bba','2000-06-13'),
(4,'f',26,'INDIA','maharashtra','mumbai','entc','1998-01-02'),
(5,'m',31,'INDIA','maharashtra','kolhapur','civil','1993-08-12'),
(6,'m',35,'INDIA','maharashtra','amravati','ssc','1989-03-28'),
(7,'f',34,'INDIA','maharashtra','dhule','b hsc','1990-09-29'),
(8,'f',31,'INDIA','maharashtra','pune','b com','1993-06-19'),
(9,'m',29,'INDIA','maharashtra','sangli','ITI','1995-09-26'),
(10,'m',25,'INDIA','maharashtra','pune','civil','1999-07-19'),
(11,'f',28,'INDIA','maharashtra','pune','b com','1996-09-18'),
(12,'f',29,'INDIA','goa','panji','IT','1995-09-17'),
(13,'f',38,'INDIA','maharashtra','satara','IT','1986-04-18'),
(14,'m',40,'INDIA','maharashtra','karad','bba','1984-01-10'),
(15,'f',24,'INDIA','Madhyaparadesh','bhopal','bca','2000-09-29'),
(16,'m',27,'INDIA','maharashtra','nashik','bca','1997-06-23'),
(17,'m',30,'INDIA','maharashtra','nagar','b com','1994-04-13'),
(18,'f',26,'INDIA','maharashtra','nanded','ca','1998-09-15'),
(19,'f',25,'INDIA','maharashtra','pune','b com','1999-02-13'),
(20,'m',24,'INDIA','maharashtra','pune','civil','2000-04-19');

-- 4create table for marraige detailes of perosn ?

CREATE TABLE basic_info (
m_id TINYINT PRIMARY KEY , 
foreign key(m_id) references person_data(m_id), 
name_of_person  varchar(40), surname_of_person varchar(40), caste varchar(30), job varchar (40),status_of_marraige varchar(20));

INSERT INTO basic_info values
(1,'vishal','jadhav','hindu maratha','Private data analyst','unmarried'),
(2,'akshay','shirsat','hindu chambhar','Private data analyst','unmarried'),
(3,'nehal','patil','hindu maratha','Private Hr','unmarried'),
(4,'vaibhavi','khandekar','hindu chambhar','goverment senior engineer','unmarried'),
(5,'nikhil ','patil','hindu maratha','Private senior engineer','divorced'),
(6,'shubham','jadhav','hindu lohar','Private helper','unmarried'),
(7,'kalyani','lokhande','hindu dhangar','unemployed','unmarried'),
(8,'vaibhavi','waghmare','hindu teli','Private data scientist','unmarried'),
(9,'sachin ','wagh','hindu maratha','Private helper','diveroced'),
(10,'uddhav','mane','hindu wanjari','Private senior engineer','unmarried'),
(11,'kshitija','lokhande','hindu maratha','Private data analyst','diveroced'),
(12,'nikita','shenoy','hindu braman','Private manager','unmarried'),
(13,'rupali','patil','hindu maratha','Private data analyst','diveroced'),
(14,'vishal','memane','hindu maratha','Private data analyst','unmarried'),
(15,'neha','bhosale','hindu maratha','Private sales','unmarried'),
(16,'vaibhav','lele','hindu braman','Private sales','unmarried'),
(17,'mahesh','huddar','hindu lingayat','goverment accountant','unmarried'),
(18,'anuja','shinde','hindu dhangar','Private ca','unmarried'),
(19,'vijaya','patil','hindu maratha','Private data analyst','unmarried'),
(20,'aman','nemane','hindu teli','Private data analyst','unmarried');

-- 5 view allthe data from person data table?
select * from person_data;

-- 6 view all the data from basic data table?
select * from basic_info;

-- 7 view all the data of name of person with its caste detailes?
SELECT NAME_OF_PERSON, SURNAME_OF_PERSON , CASTE FROM BASIC_INFO;

-- 8 view all the data of data analyst persons name from the data in descending order of person name?
SELECT name_of_person,surname_of_person FROM basic_info where job='private data analyst' order by name_of_person desc;

-- 9 Find the name of person who are unmarried of goverment sector field?
SELECT name_of_person ,surname_of_person ,job FROM BASIC_INFO WHERE JOB LIKE'%GOVERMENT%' and status_of_marraige='unmarried';

-- 10 find the name of person who are unmarried of all job sector with grouping therir particulat job ?
SELECT job, count(*) as umarried_people FROM basic_info where status_of_marraige='unmarried' group by job;

-- 11. count no of people who's caste is maratha?
select count(caste) as count_of_maratha from basic_info where caste='hindu maratha';

-- 12 count no of people whos caste is maratha and job is data anlyst?
select count(*) as count_of_maratha, caste from basic_info where caste ='hindu maratha' and job like'%data analyst%' group by caste;

-- 13. view the people age and name of people whos age is greater than 30?
SELECT p.age,b.name_of_person ,b.surname_of_person FROM person_data as p INNER JOIN basic_info as b on p.m_id=b.m_id where p.age>30;

-- 14. view the people age and name of people whos age is greater than 35 and status of marraige is unmarried?
SELECT p.age,b.name_of_person,b.surname_of_person,b.status_of_marraige FROM person_data as p INNER JOIN basic_info as b on p.m_id =b.m_id where p.age >35 and b.status_of_marraige ='unmarried';

-- 15 find all the name of person who born after 2000 year and its city?
SELECT b.name_of_person,b.surname_of_person,p.birthyear,p.city FROM person_data as p inner join basic_info as b on p.m_id=b.m_id where p.birthyear>'2000-01-01' ;

-- 16. count female member in data and their status_of marraige and age?
SELECT p.age , b.status_of_marraige ,count(p.sex) as count_of_female FROM person_data as p inner join basic_info as b on p.m_id = b.m_id group by p.age,b.status_of_marraige;

-- 17. count female and their age ?
select count(sex) ,age from person_data group by age;

-- 18 find IT education background person from their state?
SELECT education, state,count(*) FROM PERSON_DATA where education='it' GROUP BY state;

-- 19. find the list of people who diveroced and their age ,name ,city,edication also?

SELECT b.status_of_marraige,p.age,p.city,p.education,b.name_of_person from person_data as p inner join basic_info as b on p.m_id=b.m_id where b.status_of_marraige='diveroced';

-- 20. find the name of people and their city and education?
select name_of_person from basic_info union select city from person_data;

-- 21. find 2nd highest age from the person data table?
SELECT age
FROM (
    SELECT age, DENSE_RANK() OVER (ORDER BY age DESC) AS rnk
    FROM person_data
) ranked_ages
WHERE rnk = 2;

--  22.give distict row number to age column and show their sex also?
select age, sex , row_number () over (order by age desc) as age_row FRom person_data;

-- 23 give rank according to their birtyear ?
select birthyear , sex, rank () over (order by birthyear desc) as rank_birth from person_data;

select *,year( curdate() )-year(birthyear) from person_data;

-- 24 joinnd surname from basic info table?

SELECT upper(concat(name_of_person, surname_of_person)) from basic_info;
