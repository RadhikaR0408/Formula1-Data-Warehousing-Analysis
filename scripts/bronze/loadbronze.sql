/*
===============================================================================
Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronzef1' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `LOAD DATA` command to load data from csv Files to bronze tables.

===============================================================================
*/

SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
SHOW SESSION VARIABLES LIKE 'local_infile';


-- ================================
-- Loading Bronze Layer (MySQL)
-- ================================

SELECT 'Loading Bronze Layer - START' AS log_message, NOW() AS log_time;

-- REFERRENCE TABLES

USE datawarehousef1;
TRUNCATE TABLE bronzef1.ref_circuits;

LOAD DATA LOCAL INFILE 'C:/sql/Formula 1/ref/circuits.csv'
INTO TABLE bronzef1.ref_circuits
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

TRUNCATE TABLE bronzef1.ref_status;

LOAD DATA LOCAL INFILE 'C:/sql/Formula 1/ref/status.csv'
INTO TABLE bronzef1.ref_status
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

TRUNCATE TABLE bronzef1.ref_seasons;

LOAD DATA LOCAL INFILE 'C:/sql/Formula 1/ref/seasons.csv'
INTO TABLE bronzef1.ref_seasons
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- PARTICIPANTS TABLES
TRUNCATE TABLE bronzef1.part_constructors;

LOAD DATA LOCAL INFILE 'C:/sql/Formula 1/part/constructors.csv'
INTO TABLE bronzef1.part_constructors
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

TRUNCATE TABLE bronzef1.part_drivers;

LOAD DATA LOCAL INFILE 'C:/sql/Formula 1/part/drivers.csv'
INTO TABLE bronzef1.part_drivers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- GAME TABLES

TRUNCATE TABLE bronzef1.game_lap_times;

LOAD DATA LOCAL INFILE 'C:/sql/Formula 1/game/lap_times.csv'
INTO TABLE bronzef1.game_lap_times
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

TRUNCATE TABLE bronzef1.game_pit_stops;

LOAD DATA LOCAL INFILE 'C:/sql/Formula 1/game/pitstops.csv'
INTO TABLE bronzef1.game_pit_stops
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

TRUNCATE TABLE bronzef1.game_qualifying_results;

LOAD DATA LOCAL INFILE 'C:/sql/Formula 1/game/qualifying_results.csv'
INTO TABLE bronzef1.game_qualifying_results
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

TRUNCATE TABLE bronzef1.game_race_results;

LOAD DATA LOCAL INFILE 'C:/sql/Formula 1/game/race_results.csv'
INTO TABLE bronzef1.game_race_results
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

TRUNCATE TABLE bronzef1.game_races;

LOAD DATA LOCAL INFILE 'C:/sql/Formula 1/game/races.csv'
INTO TABLE bronzef1.game_races
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

TRUNCATE TABLE bronzef1.game_sprint_results;

LOAD DATA LOCAL INFILE 'C:/sql/Formula 1/game/sprint_results.csv'
INTO TABLE bronzef1.game_sprint_results
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT 'Loading Bronze Layer - COMPLETED' AS log_message, NOW() AS log_time;


