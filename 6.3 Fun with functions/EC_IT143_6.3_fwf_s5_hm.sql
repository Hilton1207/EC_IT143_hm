
UPDATE [dbo].[OrderItems]
SET Quantity = 2
WHERE OrderID = 1 AND ProductID = 1;

SELECT * FROM [dbo].[Orders] WHERE OrderID = 1;