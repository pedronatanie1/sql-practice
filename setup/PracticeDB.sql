-- PracticeDB setup script
-- Creates the database, tables, relationships, and sample data.

CREATE DATABASE PracticeDB;
GO

USE PracticeDB;
GO

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(50) NOT NULL,
    Country NVARCHAR(30) NOT NULL,
    City NVARCHAR(30) NOT NULL
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(50) NOT NULL,
    Category NVARCHAR(30) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL REFERENCES Customers(CustomerID),
    OrderDate DATE NOT NULL
);

CREATE TABLE OrderLines (
    OrderID INT NOT NULL REFERENCES Orders(OrderID),
    ProductID INT NOT NULL REFERENCES Products(ProductID),
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, ProductID)
);

INSERT INTO Customers
    (CustomerID, CustomerName, Country, City)
VALUES
    (1, 'Alice Brown', 'UK', 'Leeds'),
    (2, 'Bilal Khan', 'UK', 'Middlesbrough'),
    (3, 'Chloe Martin', 'France', 'Paris'),
    (4, 'Dmitri Ivanov', 'Germany', 'Berlin'),
    (5, 'Emma Jones', 'UK', 'London'),
    (6, 'Farah Ali', 'Spain', 'Madrid');


INSERT INTO Products
    (ProductID, ProductName, Category, UnitPrice)
VALUES
    (1, 'Laptop', 'Electronics', 800.00),
    (2, 'Mouse', 'Electronics', 20.00),
    (3, 'Desk', 'Furniture', 150.00),
    (4, 'Chair', 'Furniture', 90.00),
    (5, 'Notebook', 'Stationery', 3.50),
    (6, 'Pen Set', 'Stationery', 8.00);


INSERT INTO Orders
    (OrderID, CustomerID, OrderDate)
VALUES
    (101, 1, '2026-01-10'),
    (102, 1, '2026-02-14'),
    (103, 2, '2026-02-20'),
    (104, 3, '2026-03-05'),
    (105, 4, '2026-03-18'),
    (106, 2, '2026-04-02'),
    (107, 5, '2026-04-15');


INSERT INTO OrderLines
    (OrderID, ProductID, Quantity)
VALUES
    (101, 1, 1),
    (101, 2, 2),
    (102, 3, 1),
    (102, 4, 2),
    (103, 2, 1),
    (103, 5, 10),
    (104, 1, 1),
    (105, 4, 4),
    (106, 3, 2),
    (106, 5, 5),
    (107, 2, 3),
    (107, 1, 1);