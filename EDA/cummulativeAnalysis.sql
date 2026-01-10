/*
===============================================================================
Cummulative Analysis
===============================================================================
Purpose:
    - To find the performance of the driver based on points acroess the seasons

SQL Functions Used:
    - JOIN, ORDER BY, PARTITION, OVER, SUM().
===============================================================================
*/




SELECT
    season,
    d.full_name,
    SUM(f.points) OVER (
        PARTITION BY d.full_name
        ORDER BY season
    ) AS cumulative_points
FROM goldf1.fact_race_results f
JOIN goldf1.dim_driver d ON f.driver_key = d.driver_key;

