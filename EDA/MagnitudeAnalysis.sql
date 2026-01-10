/*
===============================================================================
Magnitude Analysis
===============================================================================
Purpose:
    - To quantify data and group results by specific dimensions.
    - For understanding data distribution across categories.

SQL Functions Used:
    - Aggregate Functions: SUM(), COUNT()
    - GROUP BY, ORDER BY, LIMIT , JOIN.
===============================================================================
*/


---Constructor dominance 

SELECT
    c.constructorName,
    SUM(f.points) AS total_points
FROM goldf1.fact_race_results f
JOIN goldf1.dim_constructor c ON f.constructor_key = c.constructor_key
GROUP BY c.constructorName
ORDER BY total_points DESC
LIMIT 10;

---Wins concentration

SELECT
    d.full_name,
    COUNT(*) AS wins
FROM goldf1.fact_race_results f
JOIN goldf1.dim_driver d ON f.driver_key = d.driver_key
WHERE f.position = 1
GROUP BY d.full_name
ORDER BY wins DESC
LIMIT 10;
