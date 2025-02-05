/*****************************************************************************************************************
NAME:    [dbo].[v_w3_schools_customers]
PURPOSE:  W3 schools customers

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     01/30/2025   HMADZEKA      1. Built this script for EC IT440


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

-- Q1: What should go here?
-- A1: Question goes on the previous line, intoduction to the answer goes on this line...

SELECT GETDATE() AS my_date;

-- Question 1: Business User Question - Marginal Complexity

-- What are the top five customers by total sales in 2022?

-- What are the top five customers by total sales in 2022?

--AUTHOR :Elie Nzweme

SELECT TOP 5 c.CustomerID, c.StoreID, SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
WHERE YEAR(soh.OrderDate) = 2022
GROUP BY c.CustomerID, c.StoreID
ORDER BY TotalSales DESC;

-- Question 2: Business User Question - Marginal Complexity

-- Q2 Which product category has the highest average list price?

-- Which product category has the highest average list price?

--AUTHOR :Elie Nzweme

SELECT TOP 1 pc.Name AS ProductCategory, AVG(p.ListPrice) AS AvgListPrice
FROM Production.Product p
JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
ORDER BY AvgListPrice DESC;

-- Business User Question - Moderate Complexity

--Q3 I need to know how much revenue was generated from sales of all bicycles in Q2 2022. Can you provide the total sales amount and average order quantity, broken down by bike model?

-- Revenue and average order quantity of bicycles in Q2 2022, by model

--AUTHOR :Julian Ronan Murallon

SELECT p.Name AS BikeModel, SUM(sod.LineTotal) AS TotalRevenue, AVG(sod.OrderQty) AS AvgOrderQuantity
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN Production.Product p ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name = 'Bikes' AND YEAR(soh.OrderDate) = 2022 AND DATEPART(QUARTER, soh.OrderDate) = 2
GROUP BY p.Name
ORDER BY TotalRevenue DESC;

--  Business User Question - Moderate Complexity

-- Q4:Which five products in the "Accessories" category generated the highest profit margin during 2021? Please provide their name, list price, and standard cost.

-- Top five accessories by profit margin in 2021

--AUTHOR :Julian Ronan Murallon

SELECT TOP 5 p.Name, p.ListPrice, p.StandardCost, (p.ListPrice - p.StandardCost) AS ProfitMargin
FROM Production.Product p
JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name = 'Accessories' AND p.ListPrice > 0 AND p.StandardCost > 0
ORDER BY ProfitMargin DESC;

--  Business User Question - Increased Complexity

-- Q5: Provide a detailed sales report for the last quarter, including total sales, number of orders, and average order value. Break down the report by product category and month.

-- Detailed sales report for last quarter, by category and month

--AUTHOR :Aury Salazar Alvarado

SELECT pc.Name AS Category, YEAR(soh.OrderDate) AS Year, MONTH(soh.OrderDate) AS Month, 
       COUNT(DISTINCT soh.SalesOrderID) AS TotalOrders, SUM(sod.LineTotal) AS TotalSales, 
       AVG(sod.LineTotal) AS AvgOrderValue
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN Production.Product p ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
WHERE soh.OrderDate >= DATEADD(QUARTER, -1, GETDATE())
GROUP BY pc.Name, YEAR(soh.OrderDate), MONTH(soh.OrderDate)
ORDER BY Year DESC, Month DESC, Category;


-- : Business User Question - Increased Complexity

-- Q6: Analyze the return rates for each product category over the past year. Identify the categories with the highest and lowest return rates and provide possible reasons for these trends

--Return rates by product category over the past year

--AUTHOR :Aury Salazar Alvarado

SELECT pc.Name AS Category, COUNT(sor.SalesOrderID) AS TotalReturns,
       (COUNT(sor.SalesOrderID) * 1.0 / COUNT(DISTINCT sod.SalesOrderID)) AS ReturnRate
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN Production.Product p ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
LEFT JOIN Sales.SalesOrderDetail sor ON sod.ProductID = sor.ProductID AND sor.OrderQty < 0 -- Simulating returns
WHERE soh.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY pc.Name
ORDER BY ReturnRate DESC;

--  Metadata Question

-- Q7 What are the names of all the tables in the AdventureWorks database that contain a column named "ProductID"?

-- Find tables containing a column named "ProductID"

--AUTHOR : Hilton Clifford Madzeka

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ProductID';

-- Metadata Question

-- Q8 What is the data type of the "UnitPrice" column in the "Sales.SalesOrderDetail" table?

-- Data type of the "UnitPrice" column in Sales.SalesOrderDetail

--AUTHOR : Hilton Clifford Madzeka

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SalesOrderDetail' AND COLUMN_NAME = 'UnitPrice';
