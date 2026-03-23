## ETL Decisions

### Decision 1 — Date Standardization
Problem: The raw dataset contained inconsistent date formats such as "01-02-2024", "2024/02/01", and "Feb 1 2024", which would cause incorrect grouping and joins in the warehouse.

Resolution: All dates were converted into a standard ISO format (YYYY-MM-DD) before loading into the dim_date table. Additionally, derived fields like month and year were extracted to support analytical queries efficiently.


### Decision 2 — Handling Inconsistent Category Casing
Problem: Product categories appeared in different formats such as "electronics", "Electronics", and "ELECTRONICS", leading to incorrect aggregations.

Resolution: Categories were normalized to a consistent format (Title Case, e.g., "Electronics", "Clothing", "Groceries") before inserting into the dim_product table. This ensures accurate grouping in reporting queries.


### Decision 3 — Handling NULL and Missing Values
Problem: Some records had NULL values in critical fields like quantity, price, or store, which could break aggregations or reduce data quality.

Resolution: 
- Records with missing essential keys (date, product, store) were removed.
- Missing numeric values like quantity were either defaulted (if safe) or excluded.
- Revenue was always computed as (quantity × price) to ensure consistency.
This ensured only clean, reliable data was loaded into the fact table.