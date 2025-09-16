---Zomato Sales Analysis
--1)User table
--2)product table
--3)sales table


--Creating the gold users table who are the premium members and inserting the values:

CREATE TABLE goldusers_signup(userid integer,gold_signup_date date); 

INSERT INTO goldusers_signup(userid,gold_signup_date) 
 VALUES (1,'09-22-2017'),
(3,'04-21-2017');

--Creating the users table and inserting the values:

CREATE TABLE users(userid integer,signup_date date); 

INSERT INTO users(userid,signup_date) 
 VALUES (1,'09-02-2014'),
(2,'01-15-2015'),
(3,'04-11-2014');

--Creating the sales table and inserting the values:

CREATE TABLE sales(userid integer,created_date date,product_id integer); 

INSERT INTO sales(userid,created_date,product_id) 
 VALUES (1,'04-19-2017',2),
(3,'12-18-2019',1),
(2,'07-20-2020',3),
(1,'10-23-2019',2),
(1,'03-19-2018',3),
(3,'12-20-2016',2),
(1,'11-09-2016',1),
(1,'05-20-2016',3),
(2,'09-24-2017',1),
(1,'03-11-2017',2),
(1,'03-11-2016',1),
(3,'11-10-2016',1),
(3,'12-07-2017',2),
(3,'12-15-2016',2),
(2,'11-08-2017',2),
(2,'09-10-2018',3);

--Creating the Product table and inserting the values in a table:

CREATE TABLE product(product_id integer,product_name text,price integer); 

INSERT INTO product(product_id,product_name,price) 
 VALUES
(1,'p1',980),
(2,'p2',870),
(3,'p3',330);













--Applying  Queries to the given tables to get the important business insights.


-- 1) What is the total amount each customer spent on zomato?

select a.UserID, sum(b.price) as total_amt_spent
from sales a inner join Product b on a.product_id=b.product_id group by a.UserID
 order by total_amt_spent desc


 --2) how many distinct days has each customer placed order? 

select UserID, count(distinct(created_date)) as No_days_visited
from sales  group by UserID
 order by No_days_visited desc


 --3) Which item is most popular in each of the customer?
 select * from Sales

 select UserID,Product_ID,count(product_id) as tcountt
 from Sales group by UserID,Product_ID 

  --4) What is the most purchased item on the menu and how many times was it purchase by all customer?

  select userid,count(userid) tcount
  from Sales where product_id=
  (select top 1 product_id
  from sales group by product_id order by count(product_id)  desc)
  group by userid order by tcount desc

  --5) What was the first product purchased by each customer?

select * from
(select *,
rank() over(partition by userid order by created_date asc) as rnk from sales) a

where rnk=1
 














