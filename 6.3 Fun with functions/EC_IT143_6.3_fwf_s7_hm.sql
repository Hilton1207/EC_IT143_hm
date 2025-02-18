-- Q: How to extract first name from Contact Name?

-- A: Well, here is your problem...
-- CustomerName = Alejandra Camino -> Alejandra
-- Google search " How extract first name from combined name tsql stack overflow"
-- https://stackoverflow.com/questions/44934310/tsql-extract-lastname-and-first-initial-of-firstname-from-fullname-field-that

SELECT t.[ContactName]
, LEFT( t.[ContactName], CHARINDEX(' ', t.[ContactName] + ' ') - 1) AS first_name
, dbo.udf_parse_first_name(t.ContactName) AS first_name2

From [dbo].[t_w3_schools_customers] As t
SELECT s1. *
FROM   s1
WHERE  s1.first_name <> s1.first_name2; --Expected is 0 rows
