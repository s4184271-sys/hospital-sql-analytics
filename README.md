# Hospital Analytics — PostgreSQL & SQL

A SQL analytics project using PostgreSQL to analyze hospital records and answer practical questions around patient volume, medical expenses, department workload, and length of stay.

## Project Overview

The project works with a `hospitals` table containing patient, hospital, department, doctor, expense, admission-date, and discharge-date information.

### Questions Solved

1. What is the total number of patients across all hospitals?
2. What is the average number of doctors available at each hospital?
3. Which three departments have the highest patient volume?
4. Which hospital has the highest total medical expenses?
5. What is the average medical expense per day of stay for each hospital?
6. Which patient had the longest hospital stay?
7. Which cities treated the most patients?
8. What is the average length of stay for each department?
9. Which department has the lowest patient volume?
10. How do medical expenses vary month by month?

## Solution

SQL queries were used to transform raw hospital records into summarized information that can support operational analysis.

The project demonstrates:
- Aggregation with `SUM`, `AVG`, `MAX`, and `COUNT`
- `GROUP BY` and `ORDER BY`
- Top/bottom analysis with `LIMIT`
- Date arithmetic for length-of-stay calculations
- Monthly grouping with `DATE_TRUNC` and `TO_CHAR`
- `NULLIF` to avoid division-by-zero errors

## Dataset

The repository contains a sample hospital dataset with 20 records covering multiple hospitals, cities, and departments.

| Column | Type | Description |
|---|---|---|
| `record_id` | SERIAL | Unique record identifier |
| `patient_name` | VARCHAR | Patient name |
| `hospital_name` | VARCHAR | Hospital |
| `location_name` | VARCHAR | City |
| `department` | VARCHAR | Department/ward |
| `doctors_count` | INT | Doctors available |
| `patients_count` | INT | Patients recorded |
| `medical_expenses` | NUMERIC | Medical expenses |
| `admission_date` | DATE | Admission date |
| `discharge_date` | DATE | Discharge date |

Because this is a small sample dataset, the results are intended for SQL practice and portfolio demonstration rather than real-world hospital benchmarking.

## Project Structure

```
hospital-sql-analytics/
├── README.md
├── schema.sql
├── sample_data.sql
└── queries.sql
```

## How to Run

1. Create or open a PostgreSQL database.
2. Run the schema:
   ```bash
   psql -d your_db -f schema.sql
   ```
3. Load the sample data:
   ```bash
   psql -d your_db -f sample_data.sql
   ```
4. Run the analytical queries:
   ```bash
   psql -d your_db -f queries.sql
   ```

## Tools

**PostgreSQL · SQL**

## Screenshots

The repository includes screenshots of the SQL analysis/results.
