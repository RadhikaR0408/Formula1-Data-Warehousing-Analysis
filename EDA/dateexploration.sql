/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To understand the range of historical data.

===============================================================================
*/


--- Season range

SELECT
    MIN(season) AS first_season,
    MAX(season) AS last_season
FROM goldf1.dim_season;

--- Number of races per season

SELECT
    season,
    COUNT(DISTINCT round) AS number_of_races
FROM goldf1.fact_race_results
GROUP BY season
ORDER BY season;
