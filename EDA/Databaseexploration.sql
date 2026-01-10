/*
===============================================================================
Database Exploration
===============================================================================
Purpose:
    - To explore the structure of the database, including the list of tables and their schemas.
    - To inspect the columns and metadata for specific tables.

===============================================================================
*/


SHOW TABLES FROM goldf1;

SELECT 'fact_race_results' AS table_name, COUNT(*) AS row_count
FROM goldf1.fact_race_results
UNION ALL
SELECT 'dim_driver', COUNT(*) FROM goldf1.dim_driver
UNION ALL
SELECT 'dim_constructor', COUNT(*) FROM goldf1.dim_constructor
UNION ALL
SELECT 'dim_circuit', COUNT(*) FROM goldf1.dim_circuit
UNION ALL
SELECT 'dim_season', COUNT(*) FROM goldf1.dim_season;
