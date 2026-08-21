# Step 3: Relationship Validation
Validate that the relationships between the fact table (`trade_and_retail`) and shared dimensions.

## Validation Areas

### 1. Dimension Key Uniqueness
Confirm that dimension keys uniquely identify records.

> **SQL File: [`03-Relationship-Validation_dim_key_unique.sql`](https://github.com/AhmedMaganza/cross-functional_data_analytics_platform/tree/main/phase_2_data_profiling/sql/03-Relationship-Validation_dim_key_unique.sql)**

</br>

<img width="350" height="500" alt="image" src="https://github.com/user-attachments/assets/f400f7e1-f9c6-40c7-822d-5e21295f7c32" />

### 2. Foreign-Key Integrity
Check that fact-table foreign keys have matching records in the related dimensions.

> **SQL File: [`03-Relationship-Validation_foreign_key_integrity.sql`](https://github.com/AhmedMaganza/cross-functional_data_analytics_platform/tree/main/phase_2_data_profiling/sql/03-Relationship-Validation_foreign_key_integrity.sql)**

</br>

<img width="500" height="500" alt="03-Relationship-Validation_foreign_key_integrity" src="https://github.com/user-attachments/assets/740225d4-74a2-427c-ad65-041dc103b277" />

### 3. Orphan Records
Identify fact records whose foreign keys do not have a corresponding dimension record.  
> **SQL File: [`03-Relationship-Validation_orphan_records.sql`](https://github.com/AhmedMaganza/cross-functional_data_analytics_platform/tree/main/phase_2_data_profiling/sql/03-Relationship-Validation_orphan_records.sql)**

</br>

<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/9578f3c2-d402-4d74-b7c9-c99db2ef7e7a" />


### 4. Relationship Cardinality

Validate the expected **one-to-many** relationship between dimensions and fact tables.
> **SQL File: [`03-Relationship-Validation_cardinality.sql`](https://github.com/AhmedMaganza/cross-functional_data_analytics_platform/tree/main/phase_2_data_profiling/sql/03-Relationship-Validation_cardinality.sql)**

</br>

<img width="400" height="500" alt="image" src="https://github.com/user-attachments/assets/0f74ea72-4444-4474-bcb2-4f8e0e9d20e8" />

## Findings
Relationship validation confirmed that the warehouse relationships are structurally sound and consistent with the expected dimensional model. Dimension keys are unique, fact-table foreign keys correctly reference their dimensions, and no significant orphan records or relationship anomalies were identified.

Overall, the current data model provides a reliable foundation for analysis and reporting.