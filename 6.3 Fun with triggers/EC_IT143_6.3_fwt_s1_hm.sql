-- How to automatically update the order total when the quantity or price of an order item is updated?

 --Create table for demonstration
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    Total DECIMAL(10, 2)
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert sample data
INSERT INTO Orders (OrderID, Total)
VALUES (1, 0.00);

INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, Price)
VALUES 
(1, 1, 1, 2, 10.99),
(2, 1, 2, 1, 5.99);