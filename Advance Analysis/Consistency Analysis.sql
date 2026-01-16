/*
===============================================================================
Consistency Analysis
===============================================================================
Purpose:
    - To find the driver's consistency using standard deviation.
SQL Functions Used:
    - JOIN, ORDER BY, PARTITION, OVER, SUM().
===============================================================================
*/




WITH driver_stats AS (
    SELECT
        d.driverName,
        AVG(f.position) AS avg_position,
        STDDEV(f.position) AS position_stddev
    FROM goldf1.fact_race_results f
    JOIN goldf1.dim_driver d ON f.driver_key = d.driver_key
    WHERE f.position IS NOT NULL
    GROUP BY d.driverName
)
SELECT *
FROM driver_stats
ORDER BY position_stddev ASC
LIMIT 10;
