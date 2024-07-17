-- This query retrieves the details of invoices along with their corresponding patient and 
-- payment information from the Invoices, Patients, and Payments tables using JOIN operations.

SELECT i.invoice_id, i.instruction_fee, i.room_fee, i.patient_id,
       p.name AS patient_name, py.amount AS payment_amount, py.date AS payment_date
FROM INVOICES i
JOIN PATIENTS p ON i.patient_id = p.patient_id
JOIN PAYMENTS py ON i.patient_id = py.patient_id;
