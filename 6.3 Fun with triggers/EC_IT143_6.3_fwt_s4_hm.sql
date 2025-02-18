
CREATE TRIGGER [dbo].[tr_UpdateOrderTotal]
ON [dbo].[OrderItems]
AFTER UPDATE
AS
/*****************************************************************************************************************
NAME:    [dbo].[tr_UpdateOrderTotal]
PURPOSE: UpdateOrderTotal -Last Modified by Trigger

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     02/16/2022   HMADZEKA       1. Built this script for EC IT440


RUNTIME: 
1m 0s

NOTES: 
Keep track for updateOrderTotal
 
******************************************************************************************************************/




BEGIN
    UPDATE o
    SET Total = (SELECT SUM(Quantity * Price) FROM OrderItems WHERE OrderID = o.OrderID)
    FROM Orders o
    WHERE o.OrderID IN (SELECT OrderID FROM inserted);
END;