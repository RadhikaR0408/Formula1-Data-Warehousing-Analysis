/*
===============================================================================
Year-over-Year Growth
===============================================================================
Purpose:
    - To find the Year-over-Year Growth of drivers.

SQL Functions Used:
    - JOIN, ORDER BY, PARTITION, OVER, SUM().
===============================================================================
*/


WITH season_points AS (
    SELECT
        s.season,
        d.driverName,
        SUM(f.points) AS total_points
    FROM goldf1.fact_race_results f
    JOIN goldf1.dim_driver d ON f.driver_key = d.driver_key
    JOIN goldf1.dim_season s ON f.season_key = s.season_key
    GROUP BY s.season, d.driverName
)
SELECT
    season,
    driverName,
    total_points,
    total_points - LAG(total_points) OVER (
        PARTITION BY driverName
        ORDER BY season
    ) AS yoy_change
FROM season_points;
