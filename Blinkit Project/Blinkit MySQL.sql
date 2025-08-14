# SETTING UP THE DATABASE
CREATE DATABASE Blinkit_db;
use Blinkit_db;

# CREATING TABLE
CREATE TABLE blinkit (
    `Item_Fat_Content` VARCHAR(255),
    `Item_Identifier` VARCHAR(255) PRIMARY KEY,
    `Item_Type` VARCHAR(255),
    `Outlet_Establishment_Year` INT,
    `Outlet_Identifier` VARCHAR(255),
    `Outlet_Location_Type` VARCHAR(255),
    `Outlet_Size` VARCHAR(255),
    `Outlet_Type` VARCHAR(255),
    `Item_Visibility` FLOAT,
    `Item_Weight` FLOAT,
    `Sales` FLOAT,
    `Rating` INT
);


# DATA VERIFICATION
select * from blinkit;
select count(*) from blinkit;


# DATA QUERYING

# TOTAL SALES (IN MILLIONS) FOR 'Low Fat' PRODUCTS
select cast(sum(Sales)/ 1000000 as decimal(10,2))as Total_Sales_Millions
from blinkit
where Item_Fat_Content = 'Low Fat';

# AVERAGE SALES OF 2022-ESTABLISHED OUTLET
select cast(avg(Sales) as decimal(10,1)) as Avg_Sales 
from blinkit
where Outlet_Establishment_Year = 2022;

# ITEM COUNT FOR 2022-ESTABLISHED OUTLET
select count(*) as No_Of_Items from blinkit
where Outlet_Establishment_Year = 2022;

# AVERAGE RATING
select cast(avg(Rating) as decimal (10,2)) as Avg_Rating 
from blinkit;

# SALES AND RATING SUMMARY BY ITEM FAT CONTENT
select Item_Fat_Content, 
       cast(sum(Sales)/1000 as decimal(10,2)) as Total_Sales_Thousands,
       cast(avg(Sales) as decimal(10,1)) as Avg_Sales,
       count(*) as No_Of_Items,
       cast(avg(Rating) as decimal (10,2)) as Avg_Rating
from blinkit
group by Item_Fat_Content
order by Total_Sales_Thousands desc;

# BOTTOM 5 ITEM TYPES BY TOTAL SALES
select Item_Type, 
       cast(sum(Sales) as decimal(10,2)) as Total_Sales,
       cast(avg(Sales) as decimal(10,1)) as Avg_Sales,
       count(*) as No_Of_Items,
       cast(avg(Rating) as decimal (10,2)) as Avg_Rating
from blinkit
group by Item_Type
order by Total_Sales asc
limit 5;

# SALES COMPARISON OF 'Low Fat' and 'Regular' ITEMS BY OUTLET LOCATION TYPE
SELECT 
    Outlet_Location_Type,
    CAST(SUM(CASE 
            WHEN Item_Fat_Content = 'Low Fat' THEN Sales 
            ELSE 0 
        END) AS DECIMAL(10,2)) AS Low_Fat,
    CAST(SUM(CASE 
            WHEN Item_Fat_Content = 'Regular' THEN Sales 
            ELSE 0 
        END) AS DECIMAL(10,2))AS Regular
FROM blinkit
GROUP BY Outlet_Location_Type
ORDER BY Outlet_Location_Type;

# SALES AND RATING SUMMARY BY OUTLET ESTABLISHMENT YEAR 
select Outlet_Establishment_Year, 
       cast(sum(Sales) as decimal(10,2)) as Total_Sales,
       cast(avg(Sales) as decimal(10,1)) as Avg_Sales,
       count(*) as No_Of_Items,
       cast(avg(Rating) as decimal (10,2)) as Avg_Rating
       
from blinkit
group by Outlet_Establishment_Year
order by Total_Sales desc;

# TOTAL SALES AND SALES PERCENTAGE BY OUTLET SIZE
select Outlet_Size,
       cast(sum(Sales) as decimal (10,2)) as Total_Sales,
       cast(sum(Sales) *100.0 / sum(sum(Sales)) over() as decimal(10,2)) as Sales_Percentage
from blinkit
group by Outlet_Size
order by Total_Sales desc;

# SALES AND RATING SUMMARY BY OUTLET LOCATION TYPE
select Outlet_Location_Type, 
       cast(sum(Sales) as decimal(10,2)) as Total_Sales,
       cast(sum(Sales) *100.0 / sum(sum(Sales)) over() as decimal(10,2)) as Sales_Percentage,
       cast(avg(Sales) as decimal(10,1)) as Avg_Sales,
       count(*) as No_Of_Items,
       cast(avg(Rating) as decimal (10,2)) as Avg_Rating
       
from blinkit
group by Outlet_Location_Type
order by Total_Sales desc;

# SALES AND RATING OVERVIEW BY OUTLET TYPE
select Outlet_Type, 
       cast(sum(Sales) as decimal(10,2)) as Total_Sales,
       cast(sum(Sales) *100.0 / sum(sum(Sales)) over() as decimal(10,2)) as Sales_Percentage,
       cast(avg(Sales) as decimal(10,1)) as Avg_Sales,
       count(*) as No_Of_Items,
       cast(avg(Rating) as decimal (10,2)) as Avg_Rating
       
from blinkit
group by Outlet_Type
order by Total_Sales desc;





