-- =====================================================
-- E-Commerce Sales & Customer Analysis
-- Database: MySQL
-- =====================================================

CREATE DATABASE EcommerceSalesDB;

USE EcommerceSalesDB;


-- =====================================================
-- Customers Table
-- =====================================================

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);


-- =====================================================
-- Products Table
-- =====================================================

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    BasePrice DECIMAL(10,2)
);


-- =====================================================
-- Orders Table
-- =====================================================

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    DiscountPercent DECIMAL(5,2),
    TotalAmount DECIMAL(10,2),
    PaymentMethod VARCHAR(30),
    OrderStatus VARCHAR(20),

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);


-- =====================================================
-- Data Import
-- =====================================================

-- Data was imported from CSV files into the following tables:
-- Customers  -> ecommerce_customers.csv
-- Products   -> ecommerce_products.csv
-- Orders     -> ecommerce_orders.csv

-- Row Counts:
-- Customers  -> 300
-- Products   -> 26
-- Orders     -> 1000

-- =====================================================
-- Data Verification
-- =====================================================

SELECT COUNT(*) AS TotalCustomers
FROM Customers;

SELECT COUNT(*) AS TotalProducts
FROM Products;

SELECT COUNT(*) AS TotalOrders
FROM Orders;

USE EcommerceSalesDB;

-- 1.Total number of orders?
select count(*) AS TotalOrders
from Orders;

-- 2.Unique Customers who Placed Orders
select count(distinct CustomerID) AS UniqueCustomer
from Orders;

-- 3.Total sales/revenue kitni hui?
select sum(TotalAmount) AS TotalSales
from Orders;

-- 4.Average order value (AOV) kya hai?
select avg(TotalAmount) AS AvgSales
from Orders;

-- 5.Which payment method was used for the highest number of orders?
select PaymentMethod,count(*)
from Orders
group by PaymentMethod;

-- 6.How many orders were cancelled?

select count(*) AS Cancelledcount
from Orders
where OrderStatus = 'Cancelled';

-- 7.What is the total sales amount generated from each payment method?
select PaymentMethod,sum(TotalAmount) AS TotalSales
from Orders
group by PaymentMethod;

-- 8. Which product category generated the highest total sales?

select Category,sum(TotalAmount)
from Orders AS O
inner join Products AS P
on P.ProductID = O.ProductID
group by Category limit 1;

-- 9.Which city has the highest number of customers?
SELECT C.City,
       COUNT(DISTINCT C.CustomerID) AS TotalCustomers
FROM Orders AS O
INNER JOIN Customers AS C
ON C.CustomerID = O.CustomerID
GROUP BY C.City
limit 1;

-- 10. Which product was sold in the highest quantity?
select ProductName,sum(Quantity) AS TotalQuantity
from Orders AS O
inner join Products AS P
on P.ProductID = O.ProductID
group by ProductName
order by TotalQuantity desc
limit 1;

-- 11. Which product generated the highest total sales revenue?
select ProductName, sum(TotalAmount)
AS TotalSales
from Orders AS O
inner join Products AS P
on P.ProductID = O.ProductID
group by ProductName
order by TotalSales desc 
limit 1;

-- 12. Which customer has placed the highest number of orders?
select CustomerName, count(OrderID) AS TotalOrders
from Orders AS O
inner join Customers AS C
on C.CustomerID = O.CustomerID 
group by CustomerName
order by TotalOrders desc
limit 1;

-- 13.Which city generated the highest total sales revenue?

select City,sum(TotalAmount) AS TotalSales
from Orders AS O
inner join Customers AS C
on C.CustomerID = O.CustomerID
group by City
order by TotalSales desc;

-- 14. What is the average order value for each payment method?
select PaymentMethod,avg(TotalAmount) AS AvgOrdervalue
from Orders 
group by PaymentMethod
order by AvgOrdervalue desc;

-- 15. Which product category has the highest number of orders?
select Category,count(OrderID) AS TotalOrder
from Orders AS O
inner join Products AS P
on P.ProductID = O.ProductID 
group by Category
order by TotalOrder desc
limit 1;

-- 16. What is the total sales revenue generated in each year?
select year(OrderDate) AS OrderYear,
sum(TotalAmount) AS TotalSales
from Orders 
group by year(OrderDate); 

-- 17.What is the total sales revenue generated in each month?
select month(OrderDate) AS OrderMonth,
sum(TotalAmount) AS TotalSales
from Orders 
group by month(OrderDate);

-- 18. Which month generated the highest total sales revenue?
select month(OrderDate) AS OrderMonth,
sum(TotalAmount) AS TotalSales
from Orders 
group by month(OrderDate)
order by TotalSales desc
limit 1;

-- 19. Which payment method generated the highest total sales revenue?
select PaymentMethod,sum(TotalAmount) AS TotalSales
from Orders
group by PaymentMethod
order by TotalSales desc
limit 1;

-- 20. Which customer generated the highest total sales revenue?
select CustomerName,sum(TotalAmount) AS TotalSales
from Orders AS O
inner join Customers AS C
on C.CustomerID = O.CustomerID
group by CustomerName
order by TotalSales desc
limit 1;

-- 21. Which customer placed the highest-value single order?
select CustomerName,TotalAmount
from Orders AS O
inner join Customers AS C
on C.CustomerID = O.CustomerID
order by TotalAmount desc
limit 1; 

-- 22. Which product had the highest average selling price?
select ProductName, avg(TotalAmount) AS HighestSellPrice
from Orders AS o
inner join Products AS P
on P.ProductID = O.ProductID
group by ProductName
order by HighestSellPrice desc
limit 1;

-- 23. Which product category had the highest average order value?
select Category,avg(TotalAmount) AS Highestavgordervalue
from Orders AS O
inner join Products AS P
on P.ProductID = O.ProductID
group by Category
order by Highestavgordervalue desc
limit 1;

-- 24. Which month had the highest number of orders?

select month(OrderDate) AS Ordermonth, count(orderID) AS Count
from Orders
group by month(OrderDate)
order by Count desc
limit 1;

-- 25. Which product was ordered most frequently?
select ProductName, count(OrderID) AS Totalcount
from Orders AS O
inner join Products AS P
on O.ProductID = P.ProductID
group by ProductName
order by totalcount desc
limit 1;

-- 26. Which customer placed the most orders?
select CustomerName, count(OrderID) AS Totalcount
from Orders AS O
inner join Customers AS C
on O.CustomerID = C.CustomerID
group by CustomerName
order by totalcount desc
limit 1;

-- 27. Which city generated the highest average order value?
select City, avg(TotalAmount) AS Totalcount
from Orders AS O
inner join Customers AS C
on O.CustomerID = C.CustomerID
group by City
order by totalcount desc
limit 1;

-- Q28. Which product category had the highest average quantity per order?
SELECT Category,
       AVG(quantity) AS AvgQuantity
FROM Orders AS O
INNER JOIN Products AS P
ON O.ProductID = P.ProductID
GROUP BY Category
ORDER BY AvgQuantity DESC
LIMIT 1;

-- Q29. Which payment method had the highest average quantity per order?

SELECT PaymentMethod,
       AVG(quantity) AS AvgQuantity
FROM Orders
GROUP BY PaymentMethod
ORDER BY AvgQuantity DESC
LIMIT 1;


-- Q30. Which order status had the highest total sales revenue?
select OrderStatus, sum(TotalAmount) AS Highestsale
from Orders
group by OrderStatus
order by Highestsale desc
limit 1;

-- Q31. Which customer has the highest average order value?

select CustomerName, avg(TotalAmount) AS Totalcount
from Orders AS O
inner join Customers AS C
on O.CustomerID = C.CustomerID
group by CustomerName
order by totalcount desc
limit 1;

-- Q32. Which product generated the highest total quantity sold?
SELECT ProductName,
       sum(quantity) AS totalQuantity
FROM Orders AS O
INNER JOIN Products AS P
ON O.ProductID = P.ProductID
GROUP BY ProductName
ORDER BY totalQuantity DESC
LIMIT 1;

-- Q33. Which city generated the highest total number of orders?

select City, count(OrderID) AS Totalcount
from Orders AS O
inner join Customers AS C
on O.CustomerID = C.CustomerID
group by City 
order by Totalcount desc
limit 1;

-- Q34. Which month had the highest average order value?
select month(OrderDate) AS Month,
avg(TotalAmount) AS Total
from Orders 
group by month
order by Total desc
limit 1;

-- Q35. Which product category generated the highest total quantity sold? 
select Category,sum(Quantity) AS Total
from Orders AS O
inner join Products AS P
on O.ProductID = P.ProductID
group by Category
order by total desc
limit 1;

-- Q36. Which payment method had the highest number of cancelled orders?
SELECT PaymentMethod,
       COUNT(OrderID) AS Total
FROM Orders
WHERE OrderStatus = 'Cancelled'
GROUP BY PaymentMethod
ORDER BY Total DESC
LIMIT 1;


-- =====================================================
-- Business Insights
-- =====================================================

-- 1. Highest Revenue Category
-- Sports - ₹32,522,145.66

-- 2. Highest Revenue Product
-- Dumbbells - ₹9,134,522.06

-- 3. Customer with Most Orders
-- Riya Verma - 23 orders

-- 4. Highest Revenue City
-- Hyderabad - ₹15,223,414.13

-- 5. Highest Sales Month
-- December - ₹10,228,600.72

-- 6. Most Used Payment Method
-- Net Banking - 222 orders

-- 7. Highest Average Order Value Category
-- Sports - ₹153,406.35

-- 8. Highest Quantity Sold Product
-- Yoga Mat - 144 units

-- 9. Highest Cancelled Orders Payment Method
-- Cash on Delivery - 48 cancelled orders


