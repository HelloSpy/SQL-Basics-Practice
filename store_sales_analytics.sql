USE amishadb;
create table store_sales(
STORE_NAME varchar (10),
CLUSTER varchar(10),
REGION varchar(10),
LOCATION varchar(20),
SALES int,
QTY int
);
Use amishadb;
show TABLES;
Select * From employees;
Select count(*) from employees;
select * from store_sales;
select * from `raw data`;
select sum(SALE) as Total_Sales, sum(QTY) as Total_Quantity
from `raw data`;
Select cluster_Type, Round(avg(Sale),2) as Avg_sales
from`raw data`
GROUP by Cluster_Type
Order by Avg_Sales DESC;
select Store_Name, Region_Type, Sale
From `raw data`
Where Region_Type = 'R5' and Sale> 1040;
select Store_Name, Sale, QTY
From `raw data`
order by Sale desc
Limit 3;
select max(Sale) As Second_Highest_Sale
From `raw data`
Where Sale < (select Max(sale) from `raw data`);
Insert Into Store_sales (Store_Name, Cluster, Region, Location, Sales, QTY)
select Store_Name, Cluster_Type, Region_Type, Location, Sale, QTY
From `raw data`;
