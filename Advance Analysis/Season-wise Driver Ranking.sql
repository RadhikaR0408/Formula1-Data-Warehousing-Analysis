/*
===============================================================================
Season-wise Driver Ranking
===============================================================================
Purpose:
    - To find the Season-wise Driver Ranking.

SQL Functions Used:
    - JOIN, ORDER BY, PARTITION, OVER, SUM(), RANK(), GROUP BY().
===============================================================================
*/


SELECT
    s.season,
    d.driverName,
    SUM(f.points) AS season_points,
    RANK() OVER (
        PARTITION BY s.season
        ORDER BY SUM(f.points) DESC
    ) AS driver_rank
FROM goldf1.fact_race_results f
JOIN goldf1.dim_driver d  ON f.driver_key = d.driver_key
JOIN goldf1.dim_season s ON f.season_key = s.season_key
GROUP BY s.season, d.driverName;
