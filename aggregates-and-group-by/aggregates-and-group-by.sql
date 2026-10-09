-- =====================================================
-- Aggregates and GROUP BY
-- =====================================================
-- Topics:
--   - Aggregate functions
--   - GROUP BY
--   - WHERE vs HAVING
--   - Logical processing order
--
-- Database: PracticeDB
-- =====================================================


-- =====================================================
-- Exercise 5
-- =====================================================
-- How many customers are there per country?
SELECT
	country,
	COUNT(*) AS CustomerPerCountry
FROM dbo.Customers
GROUP BY country;


-- =====================================================
-- Exercise 6
-- =====================================================
-- How many orders has each customer placed?
-- Only show customers with 2 or more orders.
SELECT 
	c.CustomerID,
	c.CustomerName,
	COUNT(o.OrderID) AS OrdersAmount
FROM dbo.Customers AS c
JOIN dbo.Orders AS o
	ON c.CustomerID = o.CustomerID
GROUP BY 
	c.CustomerID,
	c.CustomerName
HAVING COUNT(o.OrderID) >= 2;


-- =====================================================
-- Exercise 7
-- =====================================================
-- For each product category, show:
--   - The number of products
--   - The average price
--   - The highest price
SELECT
	Category,
	COUNT(*) AS ProductsCount,
	AVG(UnitPrice) AS AverageUnitPrice,
	MAX(UnitPrice) AS MaxUnitPrice
FROM dbo.Products
GROUP BY Category;


-- =====================================================
-- Exercise 8
-- =====================================================
-- What is the total quantity sold per product?
-- Only show products with a total above 5.
SELECT
	p.ProductID,
	p.ProductName,
	SUM(ol.Quantity) AS ProductQuantity
FROM dbo.Products AS p
JOIN dbo.OrderLines AS ol
	ON p.ProductID = ol.ProductID
GROUP BY 
	p.ProductID,
	p.ProductName
HAVING SUM(ol.Quantity) > 5;

