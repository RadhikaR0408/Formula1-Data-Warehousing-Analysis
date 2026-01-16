/*
===============================================================================
Position Change
===============================================================================
Purpose:
    - To find the Grid → Finish Performances

SQL Functions Used:
    - JOIN, ORDER BY, PARTITION, OVER, SUM().
===============================================================================
*/

SELECT
    d.driverName,
    AVG(f.grid - f.position) AS avg_positions_gained
FROM goldf1.fact_race_results f
JOIN goldf1.dim_driver d ON f.driver_key = d.driver_key
WHERE f.grid IS NOT NULL
  AND f.position IS NOT NULL
GROUP BY d.driverName
ORDER BY avg_positions_gained DESC
LIMIT 10;
