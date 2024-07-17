
-- This view query shows the total fees paid by each patient.
-- It is helpful as it allows a user to 

CREATE VIEW patient_fees AS 
SELECT p.patient_id, p.name, SUM(i.instruction_fee + i.room_fee) AS total_fees
FROM PATIENTS p 
JOIN INVOICES i ON p.patient_id = i.patient_id 
GROUP BY p.patient_id, p.name;