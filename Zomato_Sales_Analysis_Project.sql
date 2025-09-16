---Zomato Sales Analysis
--1)User table
--2)product table
--3)sales table


-- 1) What is the total amount each customer spent on zomato

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
 














