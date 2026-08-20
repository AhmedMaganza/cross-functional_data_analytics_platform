# Step 2: Table-Level Data Profiling

Profile the actual contents of the warehouse tables to understand their volume, uniqueness, distributions, and key data characteristics before performing formal data-quality assessment.

All profiling is performed using **BigQuery SQL** against the existing warehouse tables.

## Profiling Areas

### 1. Table Volume

Measure the number of records in each warehouse table to establish the size and relative scale of the data.</br>
#### [`02-Data-Profiling_tables-volume.sql`](https://github.com/AhmedMaganza/cross-functional_data_analytics_platform/tree/main/phase_2_data_profiling/sql/02-Data-Profiling_tables-volume.sql)

<img width="400" height="450" alt="02-Data-Profiling_tables-volume" src="../snapshots/02-Data-Profiling_tables-volume.png" />


### 2. Key Uniqueness & Duplicates

Evaluate candidate business keys and identify duplicate records while considering the expected grain of each table.</br>
#### [`02-Data-Profiling_unique_keys.sql`](https://github.com/AhmedMaganza/cross-functional_data_analytics_platform/tree/main/phase_2_data_profiling/sql/02-Data-Profiling_unique_keys.sql)

<img width="400" height="450" alt="image" src="../snapshots/02-Data-Profiling_unique_keys.png" />


### 3. Numeric Profiling (In-Progress⏳)

Profile relevant measures using:

* Minimum
* Maximum
* Average
* Zero values
* Negative values

### 4. Date Profiling (In-Progress⏳)

Assess relevant date fields for:

* Earliest and latest dates
* Date coverage
* Missing dates
* Future dates

### 5. Categorical Profiling (In-Progress⏳)

Review important categorical fields to identify:

* Distinct values
* Value frequencies
* Blank values
* Potentially unexpected categories

## Step 2 Workflow

```text
Table Volume
     ↓
Key Uniqueness & Duplicates
     ↓
Numeric Profiling
     ↓
Date Profiling
     ↓
Categorical Profiling
     ↓
Step 2 Findings
```

