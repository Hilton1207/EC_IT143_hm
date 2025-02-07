/*****************************************************************************************************************

NAME: [dbo].[airplane_price_dataset]   
PURPOSE: Create the airplane - Load View

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     02/05/2025   HMADZEKA     1. Built this script for EC IT143


RUNTIME: 
1m 0s

NOTES: 

--Step 1: Start with a question
-- What is the average price of airplanes in the dataset?

--Step 2: Begin creating an answer

-- To answer this question, we need to:

-- 1. Identify the column that stores the airplane prices.

-- 2. Write a query to calculate the average price.

--SELECT 'Step 1: Identify the column that stores the airplane prices.' AS Step1;

--SELECT 'Step 2: Write a query to calculate the average price.' AS Step2;


--Step 3: Create an ad hoc SQL query

-- Query to calculate the average airplane price


--Step 4: Turn the ad hoc SQL query into a view

-- Create a view to calculate the average airplane price


--Step 5: Turn the view into a table

-- Create a table to store the average airplane price

-- Refine the table architecture


--Step 6: Load the table from the view using an ad hoc SQL script

-- Load the table from the view

--Step 7: Turn the ad hoc SQL script into a stored procedure

-- Create a stored procedure to load the table from the view

Step 8: Call the stored procedure

-- Call the stored procedure
 
******************************************************************************************************************/

-- Create a stored procedure to load the table from the view

CREATE PROCEDURE LoadAverageAirplanePriceTable
AS
BEGIN
    TRUNCATE TABLE AverageAirplanePriceTable;

    INSERT INTO AverageAirplanePriceTable (AverageAirplanePrice)
    SELECT AverageAirplanePrice
    FROM AverageAirplanePriceView;
END;
