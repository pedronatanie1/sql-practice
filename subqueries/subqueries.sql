-- =====================================================
-- Subqueries
-- =====================================================
-- Topics:
--   - Scalar subqueries
--   - Multi-valued subqueries
--   - Correlated subqueries
--   - EXISTS and NOT EXISTS
--
-- Database: PracticeDB
-- =====================================================


-- =====================================================
-- Exercise 10
-- =====================================================
-- List products priced above the average price.
SELECT
	ProductID,
	ProductName
FROM dbo.Products
WHERE UnitPrice > (
	SELECT AVG(UnitPrice)
	FROM dbo.Products
);


-- =====================================================
-- Exercise 11A
-- =====================================================
-- List customers who have placed at least one order.
-- Use IN.
SELECT
	CustomerName
FROM dbo.Customers
WHERE CustomerID IN (
	SELECT
		CustomerID
	FROM dbo.Orders
)


-- =====================================================
-- Exercise 11B
-- =====================================================
-- List customers who have never ordered.
-- Use NOT EXISTS.
SELECT
	CustomerName
FROM dbo.Customers AS c
WHERE NOT EXISTS (
	SELECT 1
	FROM dbo.Orders AS o
	WHERE o.CustomerID = c.CustomerID
)


-- =====================================================
-- Exercise 12
-- =====================================================
-- Show every customer with their order count.
-- Use a correlated subquery in the SELECT list.
-- Farah should appear with an order count of 0.
SELECT
    c.CustomerName,
    (
        SELECT COUNT(*)
        FROM dbo.Orders AS o
        WHERE o.CustomerID = c.CustomerID
    ) AS OrderCount
FROM dbo.Customers AS c;
	

-- =====================================================
-- Exercise 13
-- =====================================================
-- List products that have never been ordered.
SELECT
    p.ProductID,
    p.ProductName,
    p.Category
FROM dbo.Products AS p
WHERE NOT EXISTS (
    SELECT 1
    FROM dbo.OrderLines AS ol
    WHERE ol.ProductID = p.ProductID
);

-- =====================================================
-- Exercise 14
-- =====================================================
-- For each customer, show their most recent order date.
-- Hint: use a correlated subquery with MAX(OrderDate).
SELECT
    c.CustomerID,
    c.CustomerName,
    (
        SELECT MAX(o.OrderDate)
        FROM dbo.Orders AS o
        WHERE o.CustomerID = c.CustomerID
    ) AS MostRecentOrderDate
FROM dbo.Customers AS c;