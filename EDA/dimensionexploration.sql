
/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.
===============================================================================
*/


--- driver per season

SELECT
    f.season,
    d.full_name,
    COUNT(*) AS races,
    SUM(f.points) AS total_points,
    AVG(f.position) AS avg_finish_position
FROM goldf1.fact_race_results f
JOIN goldf1.dim_driver d
    ON f.driver_key = d.driver_key
GROUP BY f.season, d.driver_key
ORDER BY f.season, total_points DESC;

--- circuits by country

SELECT
    country,
    COUNT(*) AS circuits_count
FROM goldf1.dim_circuit
GROUP BY country
ORDER BY circuits_count DESC;
