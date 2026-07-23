CREATE DATABASE indian_oil;
USE indian_oil;

-- Total Recorde
SELECT COUNT(*) AS Total_Records
FROM `indian oil data (2)`;

-- Check NULL Values
SELECT *
FROM `indian oil data (2)`
WHERE Date IS NULL
OR Open IS NULL
OR Close IS NULL;

-- Average Opening Price
SELECT ROUND(AVG(OPEN),2) AS Average_Opening
FROM `indian oil data (2)`;

-- Average Closing Price
SELECT ROUND(AVG(CLOSE),2) AS Average_Closing
FROM `indian oil data (2)`;

-- Highest Stock Price
SELECT MAX(High) AS Highest_Price
from `indian oil data (2)`;

-- Lowest Stock Price
SELECT MIN(Low) AS Lowest_Price
FROM `indian oil data (2)`;

-- Total Trading Volume
SELECT SUM(Volume) AS Total_Volume
FROM `indian oil data (2)`;

-- Highest Closing Price
SELECT Date, Close
FROM `indian oil data (2)`
ORDER BY Close DESC
LIMIT 10;

-- Highest Volume Days
SELECT Date, Volume
FROM `indian oil data (2)`
ORDER BY Volume DESC
LIMIT 10;

-- Daily Gain/Loss
SELECT Date, Open, Close,
(Close-Open) as Price_Change
from `indian oil data (2)`;

-- Percentage Return
SELECT Date,
ROUND(((Close-Open)/Open)*100,2) as Return_Percentage
from `indian oil data (2)`;

-- Monthly Average Closing Price
SELECT Month,
ROUND(AVG(Close),2) as Avg_Close
from `indian oil data (2)`
GROUP BY Month;

-- Year-Wise Average Close
SELECT
Year,
ROUND(AVG(Close),2) AS Avg_Close
FROM `indian oil data (2)`
GROUP BY year
ORDER BY Year;

-- Quater-wise Trading Volume
SELECT
Quarter,
SUM(Volume) AS Total_Volume
FROM `indian oil data (2)`
GROUP BY Quarter;

-- Best Trading Day
SELECT *
FROM `indian oil data (2)`
ORDER BY (Close-Open) desc
limit 1;

-- Worst Trading Day
SELECT * 
FROM `indian oil data (2)`
ORDER BY (Close-Open)
LIMIT 1;

-- Monthly Performance
SELECT
Month,
ROUND(AVG(Open),2) AS Avg_Open,
ROUND(AVG(Close),2) AS Avg_Close
from `indian oil data (2)`
GROUP BY Month;

-- Rank by Closing Price
SELECT
Date,
Close,
RANK() OVER(ORDER BY Close DESC) AS RANKING
FROM `indian oil data (2)`;

-- Dense Rank
SELECT
Date,
Close,
DENSE_RANK() OVER(ORDER BY Close DESC) AS RANKING
FROM `indian oil data (2)`;

-- Running Total of Volume
SELECT
Date,
Volume,
SUM(Volume) OVER(ORDER BY Date) AS Running_Total
from `indian oil data (2)`;

-- Moving Average
SELECT
Date,
Close,
AVG(Close) OVER(ORDER BY Date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
AS Seven_Day_Moving_Average
from `indian oil data (2)`;

-- Create View
CREATE VIEW yearly_summary as
SELECT
YEAR,
AVG(Close) AS Avg_Close,
SUM(Volume) AS Total_Volume
FROM `indian oil data (2)`
GROUP BY Year;

-- CTE Example
WITH avg_price AS
(
SELECT
Year,
AVG(Close) AS Avg_Close
FROM `indian oil data (2)`
GROUP BY Year
)
SELECT *
FROM avg_price
WHERE Avg_Close > 100;