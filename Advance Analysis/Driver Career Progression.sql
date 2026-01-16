/*
===============================================================================
Cummulative Analysis
===============================================================================
Purpose:
    - To find the driver's career progression based on points acroess the seasons

SQL Functions Used:
    - JOIN, ORDER BY, PARTITION, OVER, SUM().
===============================================================================
*/



SELECT
    s.season,
    d.driverName,
    SUM(f.points) OVER (
        PARTITION BY d.driverName
        ORDER BY s.season
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_points
FROM goldf1.fact_race_results f
JOIN goldf1.dim_driver d   ON f.driver_key = d.driver_key
JOIN goldf1.dim_season s  ON f.season_key = s.season_key;

