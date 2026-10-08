-- =============================================
-- Built-in Functions
-- =============================================


-- =============================================
-- Exercise 1
-- =============================================
-- Show each customer's name in upper case
-- alongside the length of the name.
SELECT
	UPPER(CustomerName) AS NameUpper,
	LEN(CustomerName) AS NameLength
FROM dbo.Customers;


-- =============================================
-- Exercise 2
-- =============================================
-- For every order show:
--   - The order ID
--   - The year
--   - The month name
--   - How many days ago it was placed
SELECT
	OrderId,
	YEAR(OrderDate) AS OrderYear,
	DATENAME(month, OrderDate) AS OrderMonth,
	DATEDIFF(day, OrderDate, GETDATE()) AS DaysSinceOrder
FROM dbo.Orders;


-- =============================================
-- Exercise 3
-- =============================================
-- Show each product with a price band:
--   - Under 10: 'Budget'
--   - Under 100: 'Mid'
--   - Otherwise: 'Premium'
SELECT
    ProductName,
    CASE
        WHEN UnitPrice < 10 THEN 'Budget'
        WHEN UnitPrice < 100 THEN 'Mid'
        ELSE 'Premium'
    END AS PriceBand
FROM dbo.Products;


-- =============================================
-- Exercise 4
-- =============================================
-- Show each customer's first name only.
SELECT 
	LEFT(
		CustomerName, 
		CHARINDEX(' ', CustomerName) - 1
	) AS CustomerFirstName
FROM dbo.Customers;