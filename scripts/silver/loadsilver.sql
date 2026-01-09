/*
===============================================================================
Load Silver Layer (Bronze -> Silver)
===============================================================================
Script Purpose:
    This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'silverf1' schema tables from the 'bronzef1' schema.
	Actions Performed:
		- Truncates Silver tables.
		- Inserts transformed and cleansed data from Bronze into Silver tables.
===============================================================================
*/

INSERT INTO silverf1.ref_circuits (
    circuitId,
    circuitName,
    lat,
    `long`,
    locality,
    country,
    url
)
SELECT
    circuitId,
    circuitName,
    CAST(lat AS DECIMAL(9,6)),
    CAST(`long` AS DECIMAL(9,6)),
    locality,
    country,
    url
FROM bronzef1.ref_circuits
WHERE circuitId IS NOT NULL;

INSERT INTO silverf1.ref_status (
    statusId,
    status,
    count
)
SELECT
    CAST(statusId AS UNSIGNED),
    status,
    CAST(count AS UNSIGNED)
FROM bronzef1.ref_status
WHERE statusId IS NOT NULL;

INSERT INTO silverf1.ref_seasons (
    season,
    url
)
SELECT
    CAST(season AS UNSIGNED),
    url
FROM bronzef1.ref_seasons
WHERE season IS NOT NULL;

INSERT INTO silverf1.part_constructors (
    constructorId,
    constructorName,
    nationality,
    url
)
SELECT
    constructorId,
    constructorName,
    nationality,
    url
FROM bronzef1.part_constructors
WHERE constructorId IS NOT NULL;

INSERT INTO silverf1.part_drivers (
    driverId,
    givenName,
    familyName,
    code,
    permanentNumber,
    dateOfBirth,
    nationality,
    url
)
SELECT
    driverId,
    givenName,
    familyName,
    code,
    permanentNumber,
    dateOfBirth,
    nationality,
    url
FROM bronzef1.part_drivers
WHERE driverId IS NOT NULL;

INSERT INTO silverf1.game_lap_times (
    season,
    round,
    lapNumber,
    driverId,
    position,
    time
)
SELECT
    CAST(season AS UNSIGNED),
    CAST(round AS UNSIGNED),
    CAST(lapNumber AS UNSIGNED),
    driverId,
    CAST(position AS UNSIGNED),
    time
FROM bronzef1.game_lap_times
WHERE driverId IS NOT NULL;

INSERT INTO silverf1.game_pit_stops (
    season,
    round,
    driverId,
    lap,
    stop,
    time,
    duration
)
SELECT
    CAST(season AS UNSIGNED),
    CAST(round AS UNSIGNED),
    driverId,
    CAST(lap AS UNSIGNED),
    CAST(stop AS UNSIGNED),
    time,
    duration
FROM bronzef1.game_pit_stops
WHERE driverId IS NOT NULL;

INSERT INTO silverf1.game_qualifying_results (
    season,
    round,
    driverId,
    driverName,
    constructorId,
    constructorName,
    number,
    position,
    Q1,
    Q2,
    Q3
)
SELECT
    CAST(season AS UNSIGNED),
    CAST(round AS UNSIGNED),
    driverId,
    driverName,
    constructorId,
    constructorName,
    CAST(number AS UNSIGNED),
    CAST(position AS UNSIGNED),
    Q1,
    Q2,
    Q3
FROM bronzef1.game_qualifying_results
WHERE driverId IS NOT NULL;

INSERT INTO silverf1.game_race_results (
    season,
    round,
    driverId,
    driverName,
    constructorId,
    constructorName,
    number,
    position,
    positionText,
    points,
    grid,
    laps,
    status,
    time,
    fastestLapRank,
    fastestLap_lap,
    fastestLapTime,
    averageSpeed
)
SELECT
    CAST(season AS UNSIGNED),
    CAST(round AS UNSIGNED),
    driverId,
    driverName,
    constructorId,
    constructorName,
    CAST(number AS UNSIGNED),
    CAST(position AS UNSIGNED),
    positionText,
    CAST(points AS DECIMAL(5,2)),
    CAST(grid AS UNSIGNED),
    CAST(laps AS UNSIGNED),
    status,
    time,
    CAST(fastestLapRank AS UNSIGNED),
    CAST(fastestLap_lap AS UNSIGNED),
    fastestLapTime,
    CAST(averageSpeed AS DECIMAL(6,2))
FROM bronzef1.game_race_results
WHERE driverId IS NOT NULL;

INSERT INTO silverf1.game_races (
    season,
    round,
    raceName,
    circuitId,
    circuitName,
    raceDate,
    raceTime,
    firstPractice,
    secondPractice,
    thirdPractice,
    qualifying,
    sprint,
    url
)
SELECT
    CAST(season AS UNSIGNED),
    CAST(round AS UNSIGNED),
    raceName,
    circuitId,
    circuitName,
    raceDate,
    raceTime,
    firstPractice,
    secondPractice,
    thirdPractice,
    qualifying,
    sprint,
    url
FROM bronzef1.game_races;

INSERT INTO silverf1.game_sprint_results (
    season,
    round,
    driverId,
    driverName,
    constructorId,
    constructorName,
    number,
    position,
    positionText,
    points,
    grid,
    laps,
    status,
    time,
    fastestLap_lap,
    fastestLapTime
)
SELECT
    CAST(season AS UNSIGNED),
    CAST(round AS UNSIGNED),
    driverId,
    driverName,
    constructorId,
    constructorName,
    CAST(number AS UNSIGNED),
    CAST(position AS UNSIGNED),
    positionText,
    CAST(points AS DECIMAL(5,2)),
    CAST(grid AS UNSIGNED),
    CAST(laps AS UNSIGNED),
    status,
    time,
    CAST(fastestLap_lap AS UNSIGNED),
    fastestLapTime
FROM bronzef1.game_sprint_results
WHERE driverId IS NOT NULL;






