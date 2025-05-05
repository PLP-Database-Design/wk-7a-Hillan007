-- Creating a new table that conforms to 1NF
CREATE TABLE ProductDetail_1NF (
    OrderID INT,               -- Order identifier (Primary Key)
    CustomerName VARCHAR(255), -- Customer's name
    Product VARCHAR(255)       -- Single product per row
);

-- Inserting atomic data (each row contains only one product per order)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

-- Insert data into the new normalized table
INSERT INTO ProductDetail (OrderID, CustomerName, Product)
VALUES 
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

-- Creating the Orders table to store CustomerName separately
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,    -- Unique order identifier
    CustomerName VARCHAR(255)   -- Customer information now in a separate table
);

-- Populating the Orders table
INSERT INTO Orders (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

-- Creating the OrderProducts table, which ensures full dependence on OrderID + Product
CREATE TABLE OrderProducts (
    OrderID INT,               -- Order identifier (Foreign Key)
    Product VARCHAR(255),      -- Product being ordered
    Quantity INT,              -- Quantity of the product
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) -- Establishing relationship
);

-- Populating OrderProducts table with atomic data
INSERT INTO OrderProducts (OrderID, Product, Quantity)
VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);
