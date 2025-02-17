-- Q: How to extract first name from Contact Name?

-- A: Well, here is your problem...
-- CustomerName = Alejandra Camino -> Alejandra
-- Google search " How extract first name from combined name tsql stack overflow"
-- https://stackoverflow.com/questions/44934310/tsql-extract-lastname-and-first-initial-of-firstname-from-fullname-field-that

SELECT t.[CustomerID]
, t.CustomerName
,t.ContactName
, dbo.udf_parse_first_name(t.ContactName) AS ContactName_first_name 
,'' AS ContactName_last_name --How to extract last name from Contact Name?
,t.Address
,t.City
,t.Country
FROM dbo.t_w3_schools_customers AS t
ORDER BY 3;