/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehousef1'. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.

*/

DROP DATABASE IF EXISTS DataWarehousef1;

CREATE DATABASE DataWarehousef1;

USE DataWarehousef1;
CREATE SCHEMA Bronzef1;
CREATE SCHEMA Silverf1;
CREATE SCHEMA Goldf1;

DEFAULT CHARACTER SET = 'utf8mb4';
