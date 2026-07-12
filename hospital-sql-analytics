
-- Hospital Analytics - Schema

DROP TABLE IF EXISTS hospitals;

CREATE TABLE hospitals (
    record_id        SERIAL PRIMARY KEY,
    patient_name      VARCHAR(100)   NOT NULL,
    hospital_name     VARCHAR(100)   NOT NULL,
    location_name     VARCHAR(100)   NOT NULL,   -- city
    department        VARCHAR(100)   NOT NULL,
    doctors_count     INT            NOT NULL,
    patients_count    INT            NOT NULL,
    medical_expenses  NUMERIC(10,2)  NOT NULL,
    admission_date    DATE           NOT NULL,
    discharge_date    DATE           NOT NULL,

    CONSTRAINT chk_dates CHECK (discharge_date >= admission_date)
);
iNSERT INTO hospitals
(patient_name, hospital_name, location_name, department, doctors_count, patients_count, medical_expenses, admission_date, discharge_date)
VALUES
('John Carter',    'City General Hospital', 'New York',    'Cardiology',   12, 45, 5200.00, '2024-01-05', '2024-01-10'),
('Amelia Stone',   'City General Hospital', 'New York',    'Neurology',     8, 30, 6100.50, '2024-01-12', '2024-01-20'),
('Ravi Kapoor',    'City General Hospital', 'New York',    'Orthopedics',  10, 25, 3200.00, '2024-02-02', '2024-02-06'),
('Maria Lopez',    'Sunrise Medical Center','Los Angeles', 'Cardiology',    9, 40, 4700.00, '2024-01-08', '2024-01-14'),
('David Kim',      'Sunrise Medical Center','Los Angeles', 'Pediatrics',    6, 60, 2100.00, '2024-02-10', '2024-02-12'),
('Sophie Turner',  'Sunrise Medical Center','Los Angeles', 'Oncology',     11, 20, 9800.00, '2024-03-01', '2024-03-15'),
('Liam Johnson',   'Lakeside Hospital',     'Chicago',     'Cardiology',    7, 35, 3900.00, '2024-01-20', '2024-01-25'),
('Olivia Brown',   'Lakeside Hospital',     'Chicago',     'Neurology',     5, 18, 7200.00, '2024-02-05', '2024-02-18'),
('Noah Wilson',    'Lakeside Hospital',     'Chicago',     'Orthopedics',   9, 22, 2600.00, '2024-03-03', '2024-03-07'),
('Emma Davis',     'Green Valley Hospital', 'Houston',     'Pediatrics',    4, 50, 1800.00, '2024-01-15', '2024-01-17'),
('James Miller',   'Green Valley Hospital', 'Houston',     'Oncology',     10, 15, 10500.00,'2024-02-20', '2024-03-10'),
('Isabella Garcia','Green Valley Hospital', 'Houston',     'Cardiology',    8, 28, 4400.00, '2024-03-05', '2024-03-09'),
('Ethan Martinez', 'City General Hospital', 'New York',    'Pediatrics',    6, 55, 1950.00, '2024-04-01', '2024-04-03'),
('Ava Rodriguez',  'Sunrise Medical Center','Los Angeles', 'Neurology',     7, 26, 6900.00, '2024-04-08', '2024-04-16'),
('Mason Anderson', 'Lakeside Hospital',     'Chicago',     'Oncology',      9, 19, 11200.00,'2024-04-12', '2024-04-28'),
('Mia Thompson',   'Green Valley Hospital', 'Houston',     'Orthopedics',   8, 24, 2950.00, '2024-05-02', '2024-05-06'),
('Lucas White',    'City General Hospital', 'New York',    'Cardiology',   12, 47, 5300.00, '2024-05-10', '2024-05-16'),
('Charlotte Harris','Sunrise Medical Center','Los Angeles', 'Pediatrics',   6, 58, 2050.00, '2024-05-18', '2024-05-20'),
('Benjamin Clark', 'Lakeside Hospital',     'Chicago',     'Neurology',     5, 20, 7400.00, '2024-06-01', '2024-06-14'),
('Amelia Lewis',   'Green Valley Hospital', 'Houston',     'Oncology',     10, 16, 10800.00,'2024-06-05', '2024-06-25');
-- 1. Total Number of Patients
-- Find the total number of patients across all hospitals.
SELECT
    SUM(patients_count) AS total_patients
FROM hospitals;

-- Bonus: breakdown per hospital
SELECT
    hospital_name,
    SUM(patients_count) AS total_patients
FROM hospitals
GROUP BY hospital_name
ORDER BY total_patients DESC;


-- 2. Average Number of Doctors per Hospital
-- Retrieve the average count of doctors available in each hospital.
SELECT
    hospital_name,
    AVG(doctors_count) AS average_doctors
FROM hospitals
GROUP BY hospital_name
ORDER BY average_doctors DESC;


-- 3. Top 3 Departments with the Highest Number of Patients
-- Find the top 3 hospital departments that have the highest number of patients.
SELECT
    department,
    SUM(patients_count) AS total_patients
FROM hospitals
GROUP BY department
ORDER BY total_patients DESC
LIMIT 3;


-- 4. Hospital with the Maximum Medical Expenses
-- Identify the hospital that recorded the highest total medical expenses.
SELECT
    hospital_name,
    SUM(medical_expenses) AS total_medical_expenses
FROM hospitals
GROUP BY hospital_name
ORDER BY total_medical_expenses DESC
LIMIT 1;


-- 5. Daily Average Medical Expenses
-- Calculate the average medical expense per day of stay, per hospital.
SELECT
    hospital_name,
    AVG(medical_expenses / NULLIF(discharge_date - admission_date, 0)) AS avg_daily_expenses
FROM hospitals
GROUP BY hospital_name
ORDER BY avg_daily_expenses DESC;


-- 6. Longest Hospital Stay
-- Find the patient with the longest stay by calculating the difference
-- between discharge date and admission date.
SELECT
    patient_name,
    hospital_name,
    department,
    admission_date,
    discharge_date,
    (discharge_date - admission_date) AS stay_days
FROM hospitals
ORDER BY stay_days DESC
LIMIT 1;


-- 7. Total Patients Treated Per City
-- Count the total number of patients treated in each city.
SELECT
    location_name AS city,
    SUM(patients_count) AS total_patients
FROM hospitals
GROUP BY location_name
ORDER BY total_patients DESC;


-- 8. Average Length of Stay Per Department
-- Calculate the average number of days patients spend in each department.
SELECT
    department,
    AVG(discharge_date - admission_date) AS avg_length_of_stay
FROM hospitals
GROUP BY department
ORDER BY avg_length_of_stay DESC;


-- 9. Identify the Department with the Lowest Number of Patients
-- Find the department with the least number of patients overall.
SELECT
    department,
    SUM(patients_count) AS total_patients
FROM hospitals
GROUP BY department
ORDER BY total_patients ASC
LIMIT 1;


-- 10. Monthly Medical Expenses Report
-- Group the data by month and calculate the total medical expenses for each month.
SELECT
    TO_CHAR(DATE_TRUNC('month', admission_date), 'Month YYYY') AS month,
    SUM(medical_expenses) AS total_expenses
FROM hospitals
GROUP BY DATE_TRUNC('month', admission_date)
ORDER BY DATE_TRUNC('month', admission_date);













