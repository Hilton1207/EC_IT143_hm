
--Question: How to automatically update the product quantity when an order item is inserted or updated?

--To answer this question, we need to modify the trigger to also update the product quantity.
 

CREATE TRIGGER [dbo].[tr_UpdateProductQuantity]
ON [dbo].[OrderItems]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Update quantity for inserted items
    UPDATE p
    SET Quantity = Quantity - i.Quantity
    FROM Products p
    INNER JOIN inserted i ON p.ProductID = i.ProductID;

    -- Update quantity for deleted items
    UPDATE p
    SET Quantity = Quantity + d.Quantity
    FROM Products p
    INNER JOIN deleted d ON p.ProductID = d.ProductID;

    -- Update quantity for updated items
    UPDATE p
    SET Quantity = Quantity - (i.Quantity - d.Quantity)
    FROM Products p
    INNER JOIN inserted i ON p.ProductID = i.ProductID
    INNER JOIN deleted d ON i.OrderItemID = d.OrderItemID;
END;

-- Test the trigger
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity)
VALUES (4, 3, 1, 4);

SELECT * FROM Products WHERE ProductID = 1;