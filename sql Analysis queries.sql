select * from pizza_sales

----KPIs
-----------------
select sum(total_price) as total_revnue
from pizza_sales 
----------------
select  sum(total_price)/count(distinct order_id) as[Average order value]
from pizza_sales
--------------
select sum (quantity) as[total pizza sold] , sum(total_price)[total order price],order_id 
from pizza_sales 
group by order_id
order by [total pizza sold] desc
------------
select sum (quantity) as[total pizza sold] 
from pizza_sales 
---------------
select count(distinct order_id) [total orders]
from pizza_sales
----------------
select pizza_name,count(distinct order_id) [number of orders]
from pizza_sales 
group by pizza_name
order by [number of orders] desc
----------------------
---daily treand for total orders 
select datename(WEEKDAY,order_date)[order day] , count(distinct order_id) [total orders]
from pizza_sales
group by datename(WEEKDAY,order_date)
order by [total orders] desc

-----------------
---- hourly treand for total orders

select datepart(hour,order_time) [order hours] ,count(distinct order_id) [total orders]
from pizza_sales
group by  datepart(hour,order_time)
order by [order hours]

-----------------
--- percentage of sales for each category

select pizza_category ,sum(total_price) [total sales] ,sum(total_price) *100 /(select sum(total_price) from pizza_sales) [ pct ]
from pizza_sales
group by pizza_category
order by [ pct ] desc

----with filter by month
select pizza_category ,sum(total_price) [total sales] ,sum(total_price) *100 /
(select sum(total_price) from pizza_sales where month(order_date)=2) [ pct ]
from pizza_sales
where month(order_date)=2
group by pizza_category
order by [ pct ] desc

----------------------
------percentage of sales for each pizza size

select pizza_size ,cast (sum(total_price) as decimal(10,2)) [total sales] ,cast (sum(total_price) *100 /(select sum(total_price) from pizza_sales)as decimal(10,2)) [ pct ]
from pizza_sales
group by pizza_size
order by [ pct ] desc 

----------------------
----total pizza sold by pizza category 

select pizza_category , sum (quantity) [total pizza sold]
from pizza_sales
group by pizza_category
order by [total pizza sold]

---------------------
------ top 5 best sellers 

select top 5 pizza_name , sum (quantity) [total pizza sold]  
from pizza_sales
group by pizza_name
order by [total pizza sold] desc

--------------------
------ bouttom 5 worst sellers 

select top 5 pizza_name , sum (quantity) [total pizza sold]  
from pizza_sales
group by pizza_name
order by [total pizza sold] asc

------with filter by month
select top 5 pizza_name , sum (quantity) [total pizza sold]  
from pizza_sales
where month(order_date)=10
group by pizza_name
order by [total pizza sold] desc