# SETTING UP THE DATABASE
create database pizzadb;
use pizzadb;

# CREATING TABLE
create table pizza_sale
(
pizza_id int,
order_id int,
pizza_name_id varchar(50),	
quantity tinyint,	
order_date date,
order_time time,	
unit_price float,	
total_price	float,
pizza_size varchar(50),	
pizza_category varchar(50),		
pizza_ingredients varchar(225),		
pizza_name varchar(225)	
);

# DATA VALIDATION
select * from pizza_sale;
select count(*) from pizza_sale;

# DATA QUERYING

# TOTAL REVENUE
select sum(total_price) as Total_Revenue
from pizza_sale;

# AVERAGE ORDER VALUE
select sum(total_price) / count(distinct order_id) as Avg_Order_Value
from pizza_sale;

# TOTAL PIZZA SOLD
select sum(quantity) as Total_Pizza_Sold
from pizza_sale;

# TOTAL ORDERS
select count(distinct order_id) as Total_Orders 
from pizza_sale;

# AVERAGE PIZZAS PER ORDER 
select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal (10,2))
as decimal (10,2)) as Avg_Pizzas_Per_Order
from pizza_sale;

# DAILY TREND FOR TOTAL ORDERS 
select dayname(order_date) AS Order_Day, 
count(distinct order_id) AS Total_Orders 
from pizza_sale
group by dayname(order_date);

# MONTHLY TREND FOR TOTAL ORDERS
select monthname(order_date) as Month_Name, 
COUNT(DISTINCT order_id) as Total_Orders
from pizza_sale
GROUP BY monthname(order_date)
order by Total_Orders desc;

# PERCENTAGE OF SALES BY PIZZA CATEGORY
select pizza_category, 
cast(sum(total_price) as decimal (10,2)) as Total_Revenue,
cast(sum(total_price) * 100 / 
(select sum(total_price) from pizza_sale) as decimal(10,2)) AS PCT
from pizza_sale
group by pizza_category;

# PERCENTAGE OF SALES BY PIZZA SIZE
select pizza_size, 
cast(sum(total_price) as decimal (10,2)) as Total_Revenue,
cast(sum(total_price) * 100 / 
(select sum(total_price) from pizza_sale) as decimal(10,2)) AS PCT
from pizza_sale
group by pizza_size
order by PCT desc;

# TOP 5 PIZZA NAMES BY REVENUE
select pizza_name, sum(total_price) as Total_Revenue
from pizza_sale
group by pizza_name
order by Total_Revenue desc
limit 5;

# BOTTOM 5 PIZZA NAMES BY REVENUE
select pizza_name, sum(total_price) as Total_Revenue
from pizza_sale
group by pizza_name
order by Total_Revenue 
limit 5;

# TOP 5 PIZZA NAMES BY QUANTITY
select pizza_name, sum(quantity) as Total_Quantity
from pizza_sale
group by pizza_name
order by Total_Quantity desc
limit 5;

# BOTTOM 5 PIZZA NAMES BY QUANTITY
select pizza_name, sum(quantity) as Total_Quantity
from pizza_sale
group by pizza_name
order by Total_Quantity 
limit 5;

# BOTTOM 5 PIZZA NAMES BY ORDERS
select pizza_name, count(distinct order_id) as Total_Orders
from pizza_sale
group by pizza_name
order by Total_Orders 
limit 5;

# TOP 5 PIZZA NAMES BY ORDERS
select pizza_name, count(distinct order_id) as Total_Orders
from pizza_sale
group by pizza_name
order by Total_Orders DESC
limit 5;


































































