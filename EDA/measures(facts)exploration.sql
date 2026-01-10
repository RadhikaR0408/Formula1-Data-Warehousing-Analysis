/*
===============================================================================
Measure/Fact Table Exploration 
===============================================================================
Purpose:
    - To calculate aggregated metrics.

SQL Functions Used:
    - SUM(), AVG().
===============================================================================
*/




SELECT
    season,
    SUM(DISTINCT points) AS total_points
FROM goldf1.fact_race_results f
GROUP BY season
ORDER BY season;

SELECT
    AVG(position) AS avg_finish_position
FROM goldf1.fact_race_results
WHERE position IS NOT NULL;
