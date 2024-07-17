-- This query retrieve the total amount of payments made by each patient:
-- from the Patients and Payments tables using JOIN operations.

SELECT p.patient_id, p.name, SUM(pm.amount) AS total_payments
FROM PATIENTS p
JOIN PAYMENTS pm ON p.patient_id = pm.patient_id
GROUP BY p.patient_id;
