--SUMERIX GLOBAL- DATA ANALATISIS
--Reatilstore Database management & saless Reporrtinng System

-- Drop tables if exist
DROP TABLE IF EXIST Order Details;
DROP TABLE IF EXIST Orders;
DROP TABLE IF EXIST Products;
DROP TABLE IF EXIST Categories;
DROP TABLE IF EIST Customers;
DROP TABLE IF EXIST Employees;
DROP TABLE IF EXIST Suppliers;

--CREATE TABLES with constraints
CREATE TABLE Categories(
    CategoriesID INT PRIMARY KEY,
    CategoriesNAME TEXT NOT NULL,
    Description TEXT);
CREATE TABLE Suppliers(
        SuppliersID INT PRIMARY KEY,
        SupplierName TEXT NOT ULL,
        Contact Number TEXT,
        City TEXT,
    );

CREATE TABLE Customers(
    customersID INT PRIMARY KEY,
    CustomerName TEXT NOT NULL,
    City TEXT,
    Email TEXT UNIQUE,
    Phone TEXT,

);

CREATE TABLE Employees(
    EmployeeID INT  INT PRIMARY KEY,
    EmployeeName TEXT NOT NOT NULL,
    City TEXT,
    Salary INT,
    JOINDate TEXT);

CREATE TABLE Products(
    ProductID INT PRIMARY KEY,
    PoductName TEXT NOT NULL,
    CategoryID INT,
    SupplierID INT,Price INT NOT NULL, StockQuantity INT,
    FOREGIN KEY(CategoryID) REFERENCES Categories( CategoryID),
    FOREGIN KEY (SupploedID) REFERENCes Suppliers(SupplierID)
);

CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployyeID INT,
    OrderDate TEXT,
    FOREGIN KEY(CoustomerID) REFERENCE Customers(CustomerID),
    FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE OrderDetails(
    OrderDetailID INT PRIMARY KEY,
    OrderID int,
    ProductID INT,
    Quantity INT,
    Amount INT,
    FOREGIN KEY (OrderID) REFERENCE Orders(OrderID),
    FOREGIN KEY(ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Categories VALUES (1, 'Electronics', 'Electronic gadgets');
INSERT INTO Categories VALUES (2, 'Clothing', 'Apparel');
INSERT INTO Categories VALUES (3, 'Grocery', 'Daily needs');

INSERT INTO Suppliers VALUES (1, 'Rohit Traders', '9876543210', 'Delhi');
INSERT INTO Suppliers VALUES (2, 'Aman Supplies', '9876543211', 'Mumbai');

INSERT INTO Customers VALUES (1, 'Aman Kumar', 'Delhi', 'aman@gmail.com', '9999999991');
INSERT INTO Customers VALUES (2, 'Riya Sharma', 'Mumbai', 'riya@gmail.com', '9999999992');
INSERT INTO Customers VALUES (3, 'Sagar Singh', 'Moradabad', 'sagar@gmail.com', '9999999993');

INSERT INTO Employees VALUES (1, 'Vikas', 'Delhi', 35000, '2023-01-15');
INSERT INTO Employees VALUES (2, 'Neha', 'Noida', 40000, '2022-06-10');

INSERT INTO Products VALUES (101, 'Laptop', 1, 1, 50000, 10);
INSERT INTO Products VALUES (102, 'T-Shirt', 2, 2, 800, 50);
INSERT INTO Products VALUES (103, 'Mobile', 1, 1, 20000, 20);
INSERT INTO Products VALUES (104, 'Rice Bag', 3, 2, 1200, 100);

INSERT INTO Orders VALUES (1001, 1, 1, '2024-01-10', 50000);
INSERT INTO Orders VALUES (1002, 2, 2, '2024-02-15', 20800);
INSERT INTO Orders VALUES (1003, 3, 1, '2024-03-20', 1200);

INSERT INTO OrderDetails VALUES (1, 1001, 101, 1, 50000);
INSERT INTO OrderDetails VALUES (2, 1002, 102, 1, 800);
INSERT INTO OrderDetails VALUES (3, 1002, 103, 1, 20000);
INSERT INTO OrderDetails VALUES (4, 1003, 104, 1, 1200);

UPDATE Customers SET City = 'Gurgaon' WHERE CustomerID = 1;
UPDATE Products SET Price = 21000 WHERE ProductID = 103;
DELETE FROM Customers WHERE CustomerID = 3;
ALTER TABLE Customers ADD COLUMN Age INTEGER;

-- Customer, Product and Sales Info
SELECT c.CustomerName, c.City, p.ProductName, o.OrderDate, od.Amount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;

-- Total Sales by City
SELECT c.City, SUM(od.Amount) AS TotalSales
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.City;

-- Views
CREATE VIEW ExpensiveProducts AS SELECT * FROM Products WHERE Price > 10000;
SELECT * FROM ExpensiveProducts;

CREATE VIEW CustomerOrders AS 
SELECT c.CustomerName, c.City, o.OrderID, o.OrderDate, od.Amount 
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID JOIN OrderDetails od ON o.OrderID = od.OrderID;
SELECT * FROM CustomerOrders;