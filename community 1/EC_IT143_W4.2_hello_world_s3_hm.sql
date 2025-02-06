-- Q What is the average price of airplanes in the dataset?

-- A Lets ask SQL Server and find out...

SELECT 'This is the average price' as my_message
        , AVG(price)
