-- Q What is the average cost of airplanes in the dataset?

-- A Lets ask SQL Server and find out...

SELECT 'This is the average price' AS my_message,  
       AVG(price) AS Average_Cost  
FROM [dbo].[airplane_price_dataset];