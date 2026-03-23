## Anomaly Analysis

## Insert Anomaly
Column 'office_address' is differently mentioned for 'sales_rep_name' value 'Deepak Joshi' with values 'Mumbai HQ, Nariman Point, Mumbai - 400021' and 'Mumbai HQ, Nariman Pt, Mumbai - 400021'. Office address is inserted incorrectly.
Example Row: 38 and 176


## Update Anomaly
Same office has two different values. Column 'office_address' has 'Mumbai HQ, Nariman Point, Mumbai - 400021' and 'Mumbai HQ, Nariman Pt, Mumbai - 400021'. Partial updates creates conflict and inconsistencies.  
Example Row: 38 and 176

## Delete Anomaly
In Row 12 and Column 'product_id', where product id value 'P008'. Deleting this one record causes loss of valid data, leading to inconsistent understanding of available products

## Normalization Justification
For example, the office_address column already contains inconsistent values such as “Mumbai HQ, Nariman Point, Mumbai - 400021” and “Mumbai HQ, Nariman Pt, Mumbai - 400021”. This is not just a small issue—such inconsistencies result issues in filtering, grouping, and reporting. A simple query counting orders by office would treat these as two different offices. This inconsistency arises because the same data is repeatedly inserted across multiple rows instead of being stored once.

Similarly, update anomalies are evident. If the Mumbai office address needs correction, it must be updated in dozens of rows. Missing even a single row leads to conflicting data within the same table. This increases the likelihood of human error and makes the system unreliable over time.

Delete anomalies further highlight the problem. If a row containing a unique product (e.g., a product that appears only once in the dataset) is deleted, all information about that product—its name and category—is permanently lost. This creates gaps in historical or reference data.

Normalization addresses these issues by separating entities like Offices, Products, and Customers into distinct tables. This ensures each fact is stored once, eliminating redundancy and preventing inconsistencies. While a single table may seem simpler initially, it becomes harder to maintain, query accurately, and scale. Therefore, normalization is not over-engineering—it is essential for data integrity and long-term reliability.