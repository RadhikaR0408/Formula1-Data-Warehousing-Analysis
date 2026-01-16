/*
===============================================================================
Top Constructors per Season
===============================================================================
Purpose:
    - To find the top constructors per season with (CTE + Rank).

SQL Functions Used:
    - JOIN, ORDER BY, PARTITION, OVER, SUM().
===============================================================================
*/

WITH constructor_points AS (
    SELECT
        s.season,
        c.constructorName,
        SUM(f.points) AS season_points
    FROM goldf1.fact_race_results f
    JOIN goldf1.dim_constructor c ON f.constructor_key = c.constructor_key
    JOIN goldf1.dim_season s      ON f.season_key = s.season_key
    GROUP BY s.season, c.constructorName
)
SELECT
    season,
    constructorName,
    season_points,
    RANK() OVER (
        PARTITION BY season
        ORDER BY season_points DESC
    ) AS constructor_rank
FROM constructor_points;
