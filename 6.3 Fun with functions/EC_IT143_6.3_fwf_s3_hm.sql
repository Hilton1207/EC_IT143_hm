-- Q: How to extract first name from Contact Name?

-- A: Well, here is your problem...
-- CustomerName = Alejandra Camino -> Alejandra



SELECT t.[ContactName]
From [dbo].[t_w3_schools_customers] As t
ORDER BY 1;

