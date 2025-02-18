
-- Insert a new order item
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity)
VALUES (1, 1, 2);

-- Check the product quantity
SELECT * FROM [dbo].[Products] WHERE ProductID = 1;

-- Expected result: 
-- ProductID  Quantity
-- 1           98

-- Update an existing order item
UPDATE [dbo].[OrderItems]
SET Quantity = 3
WHERE OrderID = 1 AND ProductID = 1;

-- Check the product quantity
SELECT * FROM [dbo].[Products] WHERE ProductID = 1;

-- Expected result: 
-- ProductID  Quantity
-- 1           97

-- Delete an order item
DELETE FROM [dbo].[OrderItems]
WHERE OrderID = 1 AND ProductID = 1;

-- Check the product quantity
SELECT * FROM [dbo].[Products] WHERE ProductID = 1;

-- Expected result: 
-- ProductID  Quantity
-- 1           100