 --Research and test a solution
 --  Use the CREATE TRIGGER statement to create an after-update trigger.


-- Test the trigger
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, Price)
VALUES (3, 1, 3, 3, 7.99);

SELECT * FROM Orders WHERE OrderID = 1;

UPDATE OrderItems
SET Quantity = 4
WHERE OrderItemID = 1;

SELECT * FROM Orders WHERE OrderID = 1;

DELETE FROM OrderItems
WHERE OrderItemID = 2;

SELECT * FROM Orders WHERE OrderID = 1;