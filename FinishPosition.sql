/*
===============================================================================
Grid Vs Finish position (Race craft)
===============================================================================
Purpose:
   - To Findthe average position gained by the drivers.

SQL Functions Used:
    - Aggregate Functions: AVG()
    - GROUP BY, ORDER BY
===============================================================================
*/


SELECT
    d.full_name,
    AVG(f.grid - f.position) AS avg_positions_gained
FROM goldf1.fact_race_results f
JOIN goldf1.dim_driver d ON f.driver_key = d.driver_key
WHERE f.grid IS NOT NULL
AND f.position IS NOT NULL
GROUP BY d.full_name
ORDER BY avg_positions_gained DESC
LIMIT 10;
