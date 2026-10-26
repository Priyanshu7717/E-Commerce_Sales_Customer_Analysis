# E-Commerce Sales & Customer Analysis — MySQL

## 📌 Project Overview

This project analyzes e-commerce sales data using MySQL to identify
important business insights related to sales, customers, products,
payment methods, order trends, and cancellations.

The project contains 1,000 orders, 300 customers, and 26 products.

## 🎯 Project Objective

The objective of this project is to use SQL to analyze e-commerce
data and answer real-world business questions related to:

- Sales performance
- Customer behavior
- Product performance
- Payment methods
- Order trends
- Order cancellations



## 📊 Dataset

The project uses three CSV datasets:

| Dataset | Rows | Description |
|---|---:|---|
| ecommerce_customers.csv | 300 | Customer information |
| ecommerce_products.csv | 26 | Product information |
| ecommerce_orders.csv | 1,000 | Order and sales information |

## 🗄️ Database Structure

The project uses three MySQL tables:

### Customers
- CustomerID
- CustomerName
- City

### Products
- ProductID
- ProductName
- Category
- BasePrice

### Orders
- OrderID
- CustomerID
- ProductID
- OrderDate
- Quantity
- UnitPrice
- DiscountPercent
- TotalAmount
- PaymentMethod
- OrderStatus

### 🔗 Relationships

- `Orders.CustomerID` → `Customers.CustomerID`
- `Orders.ProductID` → `Products.ProductID`


## 🛠️ SQL Techniques Used

The following SQL concepts were used in this project:

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- LIMIT
- DISTINCT
- Aggregate Functions
  - COUNT()
  - SUM()
  - AVG()
  - MAX()
  - MIN()
- INNER JOIN
- LEFT JOIN
- Subqueries
- CASE
- Date Functions
- Window Functions


## 💼 Business Questions

The analysis answers the following business questions:

1. What is the total number of orders?
2. How many unique customers placed orders?
3. What is the total sales revenue?
4. What is the average order value?
5. Which payment method has the highest number of orders?
6. How many orders were cancelled?
7. What is the total sales by payment method?
8. Which product category generates the highest total sales?
9. Which city has the highest number of customers?
10. Which product has the highest total quantity sold?
11. Which product generates the highest sales revenue?
12. Which customer has the highest number of orders?
13. Which city generates the highest sales revenue?
14. What is the average order value by payment method?
15. Which product category has the highest number of orders?
16. What is the total sales revenue by year?
17. What is the total sales revenue by month?
18. Which month has the highest total sales revenue?
19. Which payment method generates the highest sales revenue?
20. Which customer generates the highest total sales revenue?
21. Which customer has the highest-value single order?
22. Which product has the highest average selling price?
23. Which product category has the highest average order value?
24. Which month has the highest number of orders?
25. Which product is ordered most frequently?
26. Which customer has the most orders?
27. Which city has the highest average order value?
28. Which product category has the highest average quantity per order?
29. Which payment method has the highest average quantity per order?
30. Which order status has the highest total sales revenue?
31. Which customer has the highest average order value?
32. Which product has the highest total quantity sold?
33. Which city has the highest total number of orders?
34. Which month has the highest average order value?
35. Which product category has the highest total quantity sold?
36. Which payment method has the highest number of cancelled orders?


## 📊 Business Insights

| Business Insight | Result |
|---|---|
| Highest Revenue Category | Sports — ₹32,522,145.66 |
| Highest Revenue Product | Dumbbells — ₹9,134,522.06 |
| Customer with Most Orders | Riya Verma — 23 orders |
| Highest Revenue City | Hyderabad — ₹15,223,414.13 |
| Highest Sales Month | December — ₹10,228,600.72 |
| Most Used Payment Method | Net Banking — 222 orders |
| Highest Average Order Value Category | Sports — ₹153,406.35 |
| Highest Quantity Sold Product | Yoga Mat — 144 units |
| Payment Method with Most Cancelled Orders | Cash on Delivery — 48 cancelled orders |


## 📝 Conclusion

This project demonstrates the use of MySQL to analyze e-commerce
sales and customer data and extract meaningful business insights.

Through SQL analysis, the project identified key patterns in:

- Sales performance
- Customer purchasing behavior
- Product performance
- Payment methods
- Monthly sales trends
- Order cancellations

The analysis helped convert raw transactional data into
business-oriented insights using SQL.