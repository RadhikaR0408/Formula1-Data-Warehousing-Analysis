/*
===============================================================================
Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silverf1' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the structure of 'bronzef1' Tables
===============================================================================
*/

DROP TABLE IF EXISTS silverf1.ref_circuits;
CREATE TABLE silverf1.ref_circuits (
    circuitId VARCHAR(50),
    circuitName VARCHAR(255),
    lat DECIMAL(9,6),
    `long` DECIMAL(9,6),
    locality VARCHAR(100),
    country VARCHAR(100),
    url TEXT
);

DROP TABLE IF EXISTS silverf1.ref_status;
CREATE TABLE silverf1.ref_status (
    statusId INT,
    status VARCHAR(50),
    count INT
);

DROP TABLE IF EXISTS silverf1.ref_seasons;
CREATE TABLE silverf1.ref_seasons (
    season INT,
    url TEXT
);
DROP TABLE IF EXISTS silverf1.part_constructors;
CREATE TABLE silverf1.part_constructors (
    constructorId VARCHAR(50),
    constructorName VARCHAR(255),
    nationality VARCHAR(100),
    url TEXT
);

DROP TABLE IF EXISTS silverf1.part_drivers;
CREATE TABLE silverf1.part_drivers (
    driverId VARCHAR(50),
    givenName VARCHAR(100),
    familyName VARCHAR(100),
    code VARCHAR(10),
    permanentNumber VARCHAR(10),
    dateOfBirth VARCHAR(20),
    nationality VARCHAR(100),
    url TEXT
);

DROP TABLE IF EXISTS silverf1.game_lap_times;
CREATE TABLE silverf1.game_lap_times (
    season INT,
    round INT,
    lapNumber INT,
    driverId VARCHAR(50),
    position INT,
    time VARCHAR(20)
);

DROP TABLE IF EXISTS silverf1.game_pit_stops;
CREATE TABLE silverf1.game_pit_stops (
    season INT,
    round INT,
    driverId VARCHAR(50),
    lap INT,
    stop INT,
    time VARCHAR(20),
    duration VARCHAR(20)
);

DROP TABLE IF EXISTS silverf1.game_qualifying_results;
CREATE TABLE silverf1.game_qualifying_results (
    season INT,
    round INT,
    driverId VARCHAR(50),
    driverName VARCHAR(255),
    constructorId VARCHAR(50),
    constructorName VARCHAR(255),
    number INT,
    position INT,
    Q1 VARCHAR(20),
    Q2 VARCHAR(20),
    Q3 VARCHAR(20)
);

DROP TABLE IF EXISTS silverf1.game_race_results;
CREATE TABLE silverf1.game_race_results (
    season INT,
    round INT,
    driverId VARCHAR(50),
    driverName VARCHAR(255),
    constructorId VARCHAR(50),
    constructorName VARCHAR(255),
    number INT,
    position INT,
    positionText VARCHAR(20),
    points DECIMAL(5,2),
    grid INT,
    laps INT,
    status VARCHAR(50),
    time VARCHAR(20),
    fastestLapRank INT,
    fastestLap_lap INT,
    fastestLapTime VARCHAR(20),
    averageSpeed DECIMAL(6,2)
);

DROP TABLE IF EXISTS silverf1.game_races;
CREATE TABLE silverf1.game_races (
    season INT,
    round INT,
    raceName VARCHAR(255),
    circuitId VARCHAR(50),
    circuitName VARCHAR(255),
    raceDate VARCHAR(20),
    raceTime VARCHAR(20),
    firstPractice VARCHAR(20),
    secondPractice VARCHAR(20),
    thirdPractice VARCHAR(20),
    qualifying VARCHAR(20),
    sprint VARCHAR(20),
    url TEXT
);

DROP TABLE IF EXISTS silverf1.game_sprint_results;
CREATE TABLE silverf1.game_sprint_results (
    season INT,
    round INT,
    driverId VARCHAR(50),
    driverName VARCHAR(255),
    constructorId VARCHAR(50),
    constructorName VARCHAR(255),
    number INT,
    position INT,
    positionText VARCHAR(20),
    points DECIMAL(5,2),
    grid INT,
    laps INT,
    status VARCHAR(50),
    time VARCHAR(20),
    fastestLap_lap INT,
    fastestLapTime VARCHAR(20)
);


