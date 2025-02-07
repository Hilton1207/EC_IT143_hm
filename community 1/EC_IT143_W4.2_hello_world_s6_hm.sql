-- Load the table from the view

TRUNCATE TABLE AverageAirplanePriceTable;

INSERT INTO AverageAirplanePriceTable (AverageAirplanePrice)
SELECT AverageAirplanePrice
FROM AverageAirplanePriceView;
