/*
===============================================================================
Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse. 
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

CREATE SCHEMA IF NOT EXISTS goldf1;

DROP TABLE IF EXISTS goldf1.dim_driver;
CREATE TABLE goldf1.dim_driver (
    driver_key INT AUTO_INCREMENT PRIMARY KEY,
    driverId VARCHAR(50),
    full_name VARCHAR(255),
    code VARCHAR(10),
    permanentNumber VARCHAR(10),
    dateOfBirth DATE,
    nationality VARCHAR(100)
);

INSERT INTO goldf1.dim_driver (
    driverId,
    full_name,
    code,
    permanentNumber,
    dateOfBirth,
    nationality
)
SELECT DISTINCT
    driverId,
    CONCAT(givenName, ' ', familyName),
    code,
    permanentNumber,
    STR_TO_DATE(dateOfBirth, '%Y-%m-%d'),
    nationality
FROM silverf1.part_drivers;

DROP TABLE IF EXISTS goldf1.dim_constructor;
CREATE TABLE goldf1.dim_constructor (
    constructor_key INT AUTO_INCREMENT PRIMARY KEY,
    constructorId VARCHAR(50),
    constructorName VARCHAR(255),
    nationality VARCHAR(100)
);
INSERT INTO goldf1.dim_constructor (
    constructorId,
    constructorName,
    nationality
)
SELECT DISTINCT
    constructorId,
    constructorName,
    nationality
FROM silverf1.part_constructors;


DROP TABLE IF EXISTS goldf1.dim_circuit;
CREATE TABLE goldf1.dim_circuit (
    circuit_key INT AUTO_INCREMENT PRIMARY KEY,
    circuitId VARCHAR(50),
    circuitName VARCHAR(255),
    locality VARCHAR(100),
    country VARCHAR(100),
    lat DECIMAL(9,6),
    `long` DECIMAL(9,6)
);

INSERT INTO goldf1.dim_circuit (
        circuitId,
    circuitName,
    locality,
    country,
    lat,
    `long`
)
SELECT DISTINCT
    circuitId,
    circuitName,
    locality,
    country,
    lat,
    `long`
FROM silverf1.ref_circuits;

DROP TABLE IF EXISTS goldf1.dim_season;
CREATE TABLE goldf1.dim_season (
    season_key INT AUTO_INCREMENT PRIMARY KEY,
    season INT
);

INSERT INTO goldf1.dim_season (season)
SELECT DISTINCT season
FROM silverf1.ref_seasons;

DROP TABLE IF EXISTS goldf1.dim_status;
CREATE TABLE goldf1.dim_status (
    status_key INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(50)
);

INSERT INTO goldf1.dim_status (status)
SELECT DISTINCT status
FROM silverf1.ref_status;

--- FACT TABLES

DROP TABLE IF EXISTS goldf1.fact_race_results;
CREATE TABLE goldf1.fact_race_results (
    season INT,
    round INT,
    driver_key INT,
    constructor_key INT,
    circuit_key INT,
    status_key INT,
    grid INT,
    position INT,
    points DECIMAL(5,2),
    laps INT,
    fastestLapRank INT,
    fastestLap_lap INT,
    averageSpeed DECIMAL(6,2)
);
INSERT INTO goldf1.fact_race_results
SELECT
    r.season,
    r.round,
    d.driver_key,
    c.constructor_key,
    ci.circuit_key,
    s.status_key,
    r.grid,
    r.position,
    r.points,
    r.laps,
    r.fastestLapRank,
    r.fastestLap_lap,
    r.averageSpeed
FROM silverf1.game_race_results r
JOIN goldf1.dim_driver d ON r.driverId = d.driverId
JOIN goldf1.dim_constructor c ON r.constructorId = c.constructorId
JOIN goldf1.dim_status s ON r.status = s.status
JOIN silverf1.game_races gr 
    ON r.season = gr.season AND r.round = gr.round
JOIN goldf1.dim_circuit ci 
    ON gr.circuitId = ci.circuitId;

DROP TABLE IF EXISTS goldf1.fact_sprint_results;
CREATE TABLE goldf1.fact_sprint_results (
    season INT,
    round INT,
    driver_key INT,
    constructor_key INT,
    position INT,
    points DECIMAL(5,2),
    laps INT
);

INSERT INTO goldf1.fact_sprint_results
SELECT
    s.season,
    s.round,
    d.driver_key,
    c.constructor_key,
    s.position,
    s.points,
    s.laps
FROM silverf1.game_sprint_results s
JOIN goldf1.dim_driver d ON s.driverId = d.driverId
JOIN goldf1.dim_constructor c ON s.constructorId = c.constructorId;

DROP TABLE IF EXISTS goldf1.fact_pit_stops;
CREATE TABLE goldf1.fact_pit_stops (
    season INT,
    round INT,
    driver_key INT,
    lap INT,
    stop INT,
    duration_seconds DECIMAL(6,2)
);

INSERT INTO goldf1.fact_pit_stops
SELECT
    p.season,
    p.round,
    d.driver_key,
    p.lap,
    p.stop,
    CAST(REPLACE(p.duration, 's', '') AS DECIMAL(6,2))
FROM silverf1.game_pit_stops p
JOIN goldf1.dim_driver d ON p.driverId = d.driverId;



