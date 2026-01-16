# Formula 1 End-to-End Analytics & AI Project (1950–2024)

## Project Overview

This project is a **full-fledged data analytics + AI-enabled data engineering project** built using historical **Formula 1 data (1950–2024)**. It demonstrates real-world skills in:

* Data Warehousing (Medallion Architecture)
* SQL-based ETL (Bronze → Silver → Gold)
* Dimensional Modeling (Star Schema)
* Exploratory Data Analysis (EDA)
* Advanced SQL (CTEs, Window Functions)
---

## Dataset

**Source:** Kaggle – Formula One Datasets (1950–2024)

### Raw CSV Files

* `circuits.csv`
* `constructors.csv`
* `drivers.csv`
* `lap_times.csv`
* `pit_stops.csv`
* `qualifying_results.csv`
* `race_results.csv`
* `races.csv`
* `seasons.csv`
* `sprint_results.csv`
* `status.csv`

---

## Architecture

### Medallion Architecture

```
Raw CSVs
   ↓
Bronze Layer (Raw ingestion)
   ↓
Silver Layer (Cleaned & standardized)
   ↓
Gold Layer (Analytics-ready dimensional model)
```

### Technology Stack

* **Database:** MySQL
* **ETL:** SQL
* **Analytics:** SQL (WINDOW FUNCTIONS)
---

## Bronze Layer (Raw Data)

### Purpose

* Load raw CSV data without transformations
* Preserve source-level fidelity

### Rules

* No joins
* No business logic
* Minimal type casting (mostly VARCHAR)

Each CSV is loaded into its own table under the `bronzef1` schema.

---

## Silver Layer (Cleaned & Structured)

### Purpose

* Data cleaning & standardization
* Data type normalization
* Remove duplicates
* Prepare data for dimensional modeling

### Key Transformations

* CAST numeric fields (points, positions, laps)
* Standardize date/time formats
* Separate **Reference**, **Participant**, and **Game** entities

### Silver Schema Structure

* `ref_*` → Reference data (circuits, seasons, status)
* `part_*` → Participants (drivers, constructors)
* `game_*` → Event-level data (races, results, lap times)

---

## Gold Layer (Analytics-Ready)

### Dimensional Model (Star Schema)

#### Dimensions

* `dim_driver`
* `dim_constructor`
* `dim_circuit`
* `dim_race`

#### Fact Table

* `fact_race_results`

### Design Principles

* Surrogate keys (`AUTO_INCREMENT`)
* No descriptive fields in facts
* Degenerate dimensions (season, round)
* One row per driver per race

This structure enables **high-performance analytics**, BI dashboards, and ML feature engineering.

---

## Exploratory Data Analysis (EDA)

### EDA Framework Used

1. Database & schema exploration
2. Dimension analysis
3. Time range analysis
4. Measure exploration
5. Magnitude analysis
6. Ranking analysis

### Example Analyses

* Number of races per season
* Top drivers by total points
* Constructor dominance over eras
* Grid vs finish position correlation

Advanced SQL techniques used:

* CTEs
* Window functions
* Ranking & cumulative metrics

---

## BI & Visualization (Power BI)

Gold-layer tables are **BI-ready** and optimized for:

* Performance dashboards
* Driver & constructor rankings
* Season-over-season comparisons
* ML prediction vs actual visuals

---

## Assumptions & Limitations

* Regulation changes introduce **concept drift**
* 2026 predictions are **scenario-based**, not deterministic
* ML outputs are used for **decision support**, not absolute forecasting


---

## Author

**Radhika**
Cloud & Data Engineering Entusiast

