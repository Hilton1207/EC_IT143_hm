-- Script Header
-- =============================================
-- Author:      [HMADZEKA]
-- Create date: [08-02-25]
-- Description: Answers to My Communities data set questions
-- =============================================

-- Question 1: What are the top three reasons why fans attend Springfield FC games, and how can we increase attendance?
SELECT TOP 3 reason, attendance_increase
FROM springfield_fc_attendance
ORDER BY attendance DESC;

-- Question 2: What is the average number of donuts sold per day at Donut Delights, and what flavors are the most popular?
SELECT AVG(daily_sales) AS average_daily_sales,
TOP 3 flavor
FROM donut_delights_sales
ORDER BY daily_sales DESC;

-- Question 3: What is the total number of goals scored by Springfield FC in the past season?
SELECT SUM(goals_scored) AS total_goals
FROM springfield_fc_matches
WHERE season = 'past_season';

-- Question 4: What is the most popular topping for donuts at Donut Delight?
SELECT TOP 1 topping
FROM donut_delights_toppings
ORDER BY popularity DESC;

-- Question 5: How many players have been injured during the past season, and what were the most common types of injuries?
SELECT COUNT(player_id) AS injured_players,
TOP 3 injury_type
FROM springfield_fc_injuries
WHERE season = 'past_season'
ORDER BY injury_type DESC;

-- Question 6: What is the demographic breakdown of customers who purchase?
SELECT demographic, COUNT(customer_id) AS customer_count
FROM donut_delights_customers
GROUP BY demographic;

-- Question 7: Who are the top three players with the most assists in the past season?
SELECT TOP 3 player_name, assists
FROM springfield_fc_player_stats
WHERE season = 'past_season'
ORDER BY assists DESC;

-- Question 8: What is the average rating of Donut Delights donuts on the Springfield Food Review website?
SELECT AVG(rating) AS average_rating
FROM donut_delights_reviews;