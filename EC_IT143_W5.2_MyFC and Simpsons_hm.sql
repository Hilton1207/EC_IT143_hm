-- ============================================================================
-- Author: Jane Doe
-- Date: February 8, 2025
-- Purpose: This script creates the MyFC and Simpsons community data sets and
--           answers questions about the data sets.
-- ============================================================================

-- Create the MyFC table
CREATE TABLE MyFC (
  community_id INT,
  community_name VARCHAR(255),
  location VARCHAR(255),
  population INT,
  median_income DECIMAL(10, 2),
  population_density DECIMAL(10, 2)
);

-- Insert data into the MyFC table
INSERT INTO MyFC (community_id, community_name, location, population, median_income, population_density)
VALUES
  (1, 'MyFC', 'New York', 50000, 60000.00, 1000.00),
  (2, 'MyFC', 'California', 30000, 70000.00, 800.00),
  (3, 'MyFC', 'Illinois', 40000, 50000.00, 900.00),
  (4, 'MyFC', 'Florida', 20000, 40000.00, 700.00),
  (5, 'MyFC', 'Texas', 60000, 70000.00, 1100.00);

-- Create the Simpsons table
CREATE TABLE Simpsons (
  community_id INT,
  community_name VARCHAR(255),
  location VARCHAR(255),
  donuts_sold INT,
  donut_price DECIMAL(10, 2),
  donuts_sold_per_day INT
);

-- Insert data into the Simpsons table
INSERT INTO Simpsons (community_id, community_name, location, donuts_sold, donut_price, donuts_sold_per_day)
VALUES
  (1, 'Simpsons', 'New York', 10000, 2.00, 500),
  (2, 'Simpsons', 'California', 8000, 2.50, 400),
  (3, 'Simpsons', 'Illinois', 12000, 1.75, 600),
  (4, 'Simpsons', 'Florida', 9000, 2.25, 450),
  (5, 'Simpsons', 'Texas', 15000, 1.90, 750);

-- Answer questions about the MyFC data set
-- Question 1: What is the total population of MyFC?
SELECT SUM(population) AS total_population
FROM MyFC;

-- Question 2: What is the average median income of MyFC?
SELECT AVG(median_income) AS average_median_income
FROM MyFC;

-- Question 3: What is the highest population density in MyFC?
SELECT MAX(population_density) AS highest_population_density
FROM MyFC;

-- Question 4: What is the lowest median income in MyFC?
SELECT MIN(median_income) AS lowest_median_income
FROM MyFC;

-- Answer questions about the Simpsons data set
-- Question 1: What is the total number of donuts sold in Simpsons?
SELECT SUM(donuts_sold) AS total_donuts_sold
FROM Simpsons;

-- Question 2: What is the average price of a donut in Simpsons?
SELECT AVG(donut_price) AS average_donut_price
FROM Simpsons;

-- Question 3: What is the highest number of donuts sold in a single day in Simpsons?
SELECT MAX(donuts_sold_per_day) AS highest_donuts_sold_per_day
FROM Simpsons;

-- Question 4: What is the lowest price of a donut in Simpsons?
SELECT MIN(donut_price) AS lowest_donut_price
FROM Simpsons;