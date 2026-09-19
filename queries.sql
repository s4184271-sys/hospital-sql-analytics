-- Hospital Analytics — Analytical Queries
-- PostgreSQL
-- The table structure and sample data are defined in schema.sql and sample_data.sql.
-- This file contains only the analytical queries.

-- 1. Total number of patients
SELECT
    SUM(patients_count) AS total_patients
FROM hospitals;

-- Bonus: patient volume by hospital
SELECT
    hospital_name,
    SUM(patients_count) AS total_patients
FROM hospitals
GROUP BY hospital_name
ORDER BY total_patients DESC;


-- 2. Average number of doctors per hospital
SELECT
    hospital_name,
    AVG(doctors_count) AS average_doctors
FROM hospitals
GROUP BY hospital_name
ORDER BY average_doctors DESC;


-- 3. Top 3 departments by patient volume
SELECT
    department,
    SUM(patients_count) AS total_patients
FROM hospitals
GROUP BY department
ORDER BY total_patients DESC
LIMIT 3;


-- 4. Hospital with the maximum medical expenses
SELECT
    hospital_name,
    SUM(medical_expenses) AS total_medical_expenses
FROM hospitals
GROUP BY hospital_name
ORDER BY total_medical_expenses DESC
LIMIT 1;


-- 5. Average medical expense per day of stay, by hospital
SELECT
    hospital_name,
    AVG(
        medical_expenses /
        NULLIF(discharge_date - admission_date, 0)
    ) AS avg_daily_expenses
FROM hospitals
GROUP BY hospital_name
ORDER BY avg_daily_expenses DESC;


-- 6. Longest hospital stay
SELECT
    patient_name,
    hospital_name,
    department,
    admission_date,
    discharge_date,
    discharge_date - admission_date AS stay_days
FROM hospitals
ORDER BY stay_days DESC
LIMIT 1;


-- 7. Total patients treated per city
SELECT
    location_name AS city,
    SUM(patients_count) AS total_patients
FROM hospitals
GROUP BY location_name
ORDER BY total_patients DESC;


-- 8. Average length of stay per department
SELECT
    department,
    AVG(discharge_date - admission_date) AS avg_length_of_stay
FROM hospitals
GROUP BY department
ORDER BY avg_length_of_stay DESC;


-- 9. Department with the lowest patient volume
SELECT
    department,
    SUM(patients_count) AS total_patients
FROM hospitals
GROUP BY department
ORDER BY total_patients ASC
LIMIT 1;


-- 10. Monthly medical expenses report
SELECT
    TO_CHAR(DATE_TRUNC('month', admission_date), 'Month YYYY') AS month,
    SUM(medical_expenses) AS total_expenses
FROM hospitals
GROUP BY DATE_TRUNC('month', admission_date)
ORDER BY DATE_TRUNC('month', admission_date);
