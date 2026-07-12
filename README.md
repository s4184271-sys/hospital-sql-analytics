# Hospital Analytics – SQL Project

A portfolio SQL project demonstrating data analysis on a hospital records
dataset using PostgreSQL. The project covers aggregation, ranking, date
arithmetic, and reporting queries commonly asked in SQL interviews.

## Project Structure

```
hospital-sql-analytics/
├── README.md          # This file
├── schema.sql         # Table definition
├── sample_data.sql     # Sample records to run the queries against
└── queries.sql         # 10 analytical SQL queries with explanations
```

##  Dataset

The project uses a single `hospitals` table representing patient visit
records across multiple hospitals, cities, and departments.

| Column           | Type          | Description                              |
|------------------|---------------|-------------------------------------------|
| record_id        | SERIAL (PK)   | Unique record identifier                  |
| patient_name      | VARCHAR       | Name of the patient                       |
| hospital_name     | VARCHAR       | Hospital where the patient was treated    |
| location_name     | VARCHAR       | City where the hospital is located        |
| department        | VARCHAR       | Department/ward (e.g. Cardiology)         |
| doctors_count     | INT           | Doctors available at the hospital/dept    |
| patients_count    | INT           | Patients recorded in that visit/dept      |
| medical_expenses  | NUMERIC       | Total medical expenses for the visit      |
| admission_date    | DATE          | Date the patient was admitted             |
| discharge_date    | DATE          | Date the patient was discharged           |

## How to Run

1. Create a PostgreSQL database (or use an existing one).
2. Run the schema and sample data:
   ```bash
   psql -d your_db -f schema.sql
   psql -d your_db -f sample_data.sql
   ```
3. Run the analysis queries:
   ```bash
   psql -d your_db -f queries.sql
   ```

> Written for PostgreSQL (uses `TO_CHAR`, `DATE_TRUNC`, date subtraction).
> Minor syntax tweaks may be needed for MySQL/SQL Server (noted inline
> where relevant).

##  Queries Included

1. Total number of patients across all hospitals
2. Average number of doctors per hospital
3. Top 3 departments with the highest number of patients
4. Hospital with the maximum medical expenses
5. Daily average medical expenses per hospital
6. Longest hospital stay
7. Total patients treated per city
8. Average length of stay per department
9. Department with the lowest number of patients
10. Monthly medical expenses report

## Skills Demonstrated

- Aggregate functions (`SUM`, `AVG`, `MAX`, `COUNT`)
- `GROUP BY` and `ORDER BY`
- `LIMIT` for top-N / bottom-N analysis
- Date arithmetic (length of stay)
- Date formatting and monthly grouping
- Handling divide-by-zero with `NULLIF`
Problem:
Hospitals collect large amounts of raw data — patient visits, admission/discharge dates, department records, medical expenses — but this data is not useful on its own. Hospital administrators need answers to questions like: Which departments are overloaded with patients? Which hospitals are the most expensive to run? How long do patients typically stay? Without querying the data properly, this information stays buried in the raw records and can't inform decisions like staffing, budgeting, or resource allocation.
Solution:
This project uses SQL to turn raw hospital records into actionable insights. Using aggregate functions (SUM, AVG, MAX), grouping, sorting, and date calculations, it answers 10 real-world hospital management questions, such as:

How many patients are being treated overall and per city
Which departments have the most/least patients (useful for staffing decisions)
Which hospital has the highest medical expenses (useful for budget review)
How long patients stay on average, and who had the longest stay (useful for spotting inefficiencies or bottlenecks)
Monthly expense trends (useful for financial planning)
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/89f0df77-0461-4bd8-8f09-9f47e159c793" />
<img width="500" height="500" alt="Screenshot 2026-07-12 121843" src="https://github.com/user-attachments/assets/7ba8a30d-807a-4dc9-b9d7-4a28dd2f127c" />

