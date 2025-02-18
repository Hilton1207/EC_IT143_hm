

-- Create a trigger to update the order total
CREATE TRIGGER tr_UpdateOrderTotal
ON OrderItems
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE o
    SET Total = (SELECT SUM(Quantity * Price) FROM OrderItems WHERE OrderID = o.OrderID)
    FROM Orders o
    WHERE o.OrderID IN (SELECT OrderID FROM inserted)
    OR o.OrderID IN (SELECT OrderID FROM deleted);
END;