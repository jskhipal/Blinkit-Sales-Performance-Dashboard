use jaspaldb

select * from [dbo].[BLINKITORDER]

create table BLINKIT_ORDERS(
Order_ID int,
Customer_Name varchar (50),
City Varchar (50),
Order_Amount int,
Order_Date Date,
Delivery_Time int,
Payment_Mode Varchar (50),
Order_classification varchar (50),
);

Insert into BLINKIT_ORDERS(Order_ID, Customer_Name, City, Order_Amount, Order_Date, Delivery_Time, Payment_Mode, Order_classification)
Select [Order_ID], [Customer Name], [City], [Order_Amount], [Order_Date], [Delivery_Time ], [Payment_Mode], [Order_Classification]
from [dbo].[BLINKITORDER]


select * from BLINKIT_ORDERS

--Retrieve all orders from the dataset

select *
from BLINKIT_ORDERS

--Find the total number of orders.

select count(Order_ID) 
from BLINKIT_ORDERS;

--List all unique cities where orders were placed.

select Distinct City
from BLINKIT_ORDERS

--Count the number of orders per city

select count(order_id) as no_of_orders, City
from BLINKIT_ORDERS
group by City

--Retrieve the details of all orders placed in Bangalore

Select * 
from BLINKIT_ORDERS
where city = 'Bangalore'

 --Find all orders where the payment mode was "Credit Card."

 select *
 from BLINKIT_ORDERS
 where Payment_Mode = 'Credit Card'

 --Retrieve the order details for customer "Priya."

 select *
 from BLINKIT_ORDERS
 where Customer_Name = 'Priya'

 --Find the order amount for order ID 1000002.

 select * 
 From BLINKIT_ORDERS
 where Order_ID = '1000002'

 --List the top 10 most expensive orders.

 select Top 10 Order_Amount
 from BLINKIT_ORDERS
 order by Order_Amount desc

 --Find the average order amount for all orders.

 select avg(Order_Amount) as Avg_Order_Value
 from BLINKIT_ORDERS

 --Retrieve all orders where the amount is greater than 1000

 Select *
 from BLINKIT_ORDERS
 where Order_Amount > 1000

--List orders delivered in less than 30 minutes

select *
from BLINKIT_ORDERS
where Delivery_Time < 30

--Show the top 5 fastest deliveries.

select top 5 Delivery_Time
from BLINKIT_ORDERS
order by Delivery_Time asc

--Find the most common payment mode

select  Payment_Mode, Count(Payment_Mode) as Pay_mode_count
from BLINKIT_ORDERS
group by Payment_Mode
order by Pay_mode_count desc

--List all orders placed on "2024-01-01."

select * 
from BLINKIT_ORDERS
where Order_Date = '2024-01-01'

--Show all orders sorted by order amount in descending order

select *
from BLINKIT_ORDERS
order by Order_Amount desc

--Retrieve the first 100 orders sorted by order date

select top 100 *
from BLINKIT_ORDERS
order by Order_Date

--Find all orders where the order amount is between 500 and 1500.

select *
from BLINKIT_ORDERS
where Order_Amount between '500' and '1500'

--Find orders placed in Hyderabad and paid using a wallet.

select *
from BLINKIT_ORDERS
where Payment_Mode = 'Wallet'
and City = 'Hyderabad'

--List all customers who placed an order above 2000.

select Customer_Name
from BLINKIT_ORDERS
where Order_Amount > 2000

--Find the total revenue generated.

select sum(Order_Amount) as Total_Revenue
from BLINKIT_ORDERS

--Calculate the average delivery time for all orders.

select Avg(Delivery_Time) as Avg_delivery_time
from BLINKIT_ORDERS

--Find the city with the highest number of orders.

select top 1 city, count(Order_ID) as Order_count
from BLINKIT_ORDERS
Group by city
order by Order_count desc

--Count how many orders were paid via "Debit Card."

select count(Payment_Mode) as no_of_payments
from BLINKIT_ORDERS
where Payment_Mode = 'Debit Card'

--Find the total order amount per city.

select City, sum(Order_Amount) as total_order_amount
from BLINKIT_ORDERS
group by City

--Find the customer who has placed the most orders.

select top 1 Customer_Name, Count(Order_ID) as Total_orders
from BLINKIT_ORDERS
group by Customer_Name
order by Total_orders desc

--Show the number of orders placed per day.

select Order_Date, count(Order_ID) as total_orders
from BLINKIT_ORDERS
group by Order_Date
Order by Order_Date asc

--Find the total order amount for each payment mode.

select Payment_Mode, sum(Order_Amount) as Total_amount
from BLINKIT_ORDERS
group by Payment_Mode

--List cities with an average order amount greater than 1000.

select City, Avg(Order_Amount) As avg_order_amount
from BLINKIT_ORDERS
group by City
having Avg(Order_Amount) > 1000

--Find the longest delivery time recorded.

Select  max(Delivery_Time) as Longest_Deliveryb 
from BLINKIT_ORDERS

--Find all orders where customers are from Delhi.

select * 
from BLINKIT_ORDERS
where City = 'Delhi'

--Retrieve the name of customers along with their order amounts.

Select Customer_Name, Order_Amount
from BLINKIT_ORDERS

--Count how many orders each customer has placed.

Select Customer_Name, Count(Order_ID) No_of_Orders
from BLINKIT_ORDERS
group by Customer_Name

--Find total orders placed in January 2024.

select count(Order_ID) as total_orders
from BLINKIT_ORDERS
where month(Order_Date) = '1'
and year(Order_Date) = '2024'

--Find the day with the highest number of orders.

select top 1 Order_Date, count(Order_ID) as total_order
from BLINKIT_ORDERS
group by Order_Date
order by total_order desc

--Retrieve the first order placed in 2024.

select Top 1 *
from BLINKIT_ORDERS
order by Order_Date asc

--Find all orders placed after "2024-01-10."

select *
from BLINKIT_ORDERS
where Order_Date > '2024-01-10'
order by Order_Date asc

--Find customers who have placed more than 5 orders.

select Customer_Name, count(Order_ID) as order_count
from BLINKIT_ORDERS
group by Customer_Name
having count(Order_ID) > 5

--Retrieve cities with more than 1000 orders.

select City, count(Order_ID) as total_count
from BLINKIT_ORDERS
group by City
having count(Order_ID) > 1000

--Find orders where the order amount is greater than the city’s average order amount.

with cityavg as
(select City, avg(Order_Amount) as Avg_amount
 from BLINKIT_ORDERS
 group by City
 )

SELECT O.City, COUNT(*) AS Orders_Above_Avg  
FROM BLINKIT_ORDERS O  
JOIN CityAvg C ON O.City = C.City  
WHERE O.Order_Amount > C.Avg_amount  
GROUP BY O.City;  

--Identify customers who have spent more than 5000 in total.

select Customer_Name, Sum(Order_Amount) as total_spent
from BLINKIT_ORDERS
group by Customer_Name
having Sum(Order_Amount) > 5000

--Find orders with the fastest delivery time per city.

with fastestdelivery as (
Select min(Delivery_Time) As fastest_delivey_time, City
from BLINKIT_ORDERS
group by City 
)

select O.City, COUNT(O.Order_ID) AS Orders_With_Fastest_Delivery 
from BLINKIT_ORDERS o
join fastestdelivery f on o.City =f.City
where o.Delivery_Time = f.fastest_delivey_time
group by o.City

--Retrieve customers who have used more than one payment mode.

SELECT Customer_Name  
FROM BLINKIT_ORDERS  
GROUP BY Customer_Name  
HAVING COUNT(DISTINCT Payment_Mode) > 1; 

--Find the customer who placed the highest single order.

with highestorder as (
select Max(Order_Amount) as max_order, Customer_Name
from BLINKIT_ORDERS
group by Customer_Name
)
select top 1 *
from BLINKIT_ORDERS o
join highestorder h on o.Customer_Name=h.Customer_Name
where o.Order_Amount=h.max_order

--Identify orders where the delivery time was more than double the average.

select *
from BLINKIT_ORDERS
where Delivery_Time > 2*(select Avg(Delivery_Time) as avg_delivery from BLINKIT_ORDERS)

--List customers who placed orders only using "Credit Card."

select Customer_Name, Order_ID
from BLINKIT_ORDERS
where Payment_Mode = 'Credit Card'
group by Customer_Name, Order_ID
having count(distinct Payment_Mode) = 1

--Show the total revenue generated each month.

select format(Order_Date, 'yyyy-MM') as month,
	   sum(Order_Amount) as total_revenue
from BLINKIT_ORDERS
group by format(Order_Date, 'yyyy-MM')
order by month

--Show the total revenue generated each year

select format(Order_Date, 'yyyy') as year,
	   sum(Order_Amount) as total_revenue
from BLINKIT_ORDERS
group by format(Order_Date, 'yyyy')
order by year

--Rank orders based on order amount

select e.*,
rank() over(order by Order_Amount) as RNK_ORDER
from BLINKIT_ORDERS e

--Find the second-highest order amount.

select distinct Order_Amount
from BLINKIT_ORDERS
order by Order_Amount desc
offset 1 rows fetch next 1 rows only;

--Show the cumulative revenue over time

select Order_Date,
		sum(Order_Amount) over( order by Order_Date) as cummulative_revenue
from BLINKIT_ORDERS
order by Order_Date

--Find the average order amount per customer and rank them.

select Customer_Name, avg(Order_Amount) as AVG_ORDER_AMOUNT, 
rank () over( order by avg(Order_Amount) desc ) as rank
from BLINKIT_ORDERS
group by Customer_Name
order by rank

--Retrieve the top 3 highest-spending customers.

select top 3 sum(Order_Amount) as total_Spending, Customer_Name
from BLINKIT_ORDERS
group by Customer_Name
order by sum(Order_Amount) desc

--Find the top 3 cities with the highest revenue.

select top 3 sum(Order_Amount) as total_Spending, City
from BLINKIT_ORDERS
group by City
order by sum(Order_Amount) desc

--Show the rank of each order based on delivery time.

Select *,
rank () over(order by Delivery_Time desc) as Del_Time
from BLINKIT_ORDERS

--Find the moving average order amount over the past 7 days.

select Order_Date,
	   Order_Amount,
	   AVG(Order_Amount) over( order by Order_Date rows between 6 preceding and current row) as Moving_Average
from BLINKIT_ORDERS
order by Order_Date

--Retrieve the last 5 orders placed by each customer.

with RankOrders as
(select Order_ID,
        Customer_Name,
        Order_Date,
        Order_Amount,
		ROW_NUMBER() over(partition by Customer_Name order by Order_Date desc,  Order_ID desc) as RN
from BLINKIT_ORDERS
)

select Order_ID, Customer_Name, Order_Date, Order_Amount
from rankorders
where RN <= 5
order by Customer_Name, Order_Date desc

--Identify the most recent order for each customer.

with RankOrders as
(select Order_ID,
        Customer_Name,
        Order_Date,
        Order_Amount,
		ROW_NUMBER() over(partition by Customer_Name order by Order_Date desc,  Order_ID desc) as RN
from BLINKIT_ORDERS
)

select Order_ID, Customer_Name, Order_Date, Order_Amount
from rankorders
where RN < 2
order by Customer_Name, Order_Date desc

--Categorize orders as "High," "Medium," or "Low" based on order amount.

select Customer_Name, Order_Amount, Order_Date, Delivery_Time,
case 
when Order_Amount >=1500 then 'High'
when Order_Amount between 1000 and 1499 then 'Medium'
else 'low'
end as Order_Catagory
From BLINKIT_ORDERS
order by Order_Amount desc

--Show the fastest and slowest deliveries per city.

select City,
max(Delivery_Time) as Slowest_Delivery,
min(Delivery_Time) as Fastest_Delivery
from BLINKIT_ORDERS
group by City
order by City
			
--Find all customers whose total orders exceed 10,000 but have an average order value below 500.

with Totalorders as (
					 select Customer_Name, Avg(Order_Amount) as avg_order_value, Count(Order_ID) as total_orders
					 from BLINKIT_ORDERS
					 Group by Customer_Name
					 )
select o.*
from Totalorders o
where o.total_orders > 1000
and o.avg_order_value < 500
order by Customer_Name

--Show orders where delivery time was greater than 30 minutes and the order amount was below 500.

Select *
from BLINKIT_ORDERS
where Delivery_Time > 30
and Order_Amount < 500

--Classify orders as "Fast," "Average," or "Slow" based on delivery time.

select Order_ID, Customer_Name, Order_Amount, Delivery_Time,
case 
when Delivery_Time < 15 then 'FAST'
when Delivery_Time between 16 and 30 then 'AVERAGE'
else 'SLOW'
end as Classified_Delivery
from BLINKIT_ORDERS
Order by Delivery_Time asc

--Update the payment mode for a specific order.

update BLINKIT_ORDERS
set Payment_Mode = 'Credit Card'
where Order_ID = '1234567'

select *
from BLINKIT_ORDERS
where Order_ID = '1234567'

--Delete orders older than 5 years.

delete from BLINKIT_ORDERS
where Order_Date = DATEADD(YEAR,-5, GETDATE())










