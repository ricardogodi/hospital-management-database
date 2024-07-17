-- This query finds the total fee of all invoices generated for a specific patient

SELECT SUM(instruction_fee + room_fee) AS total_fee
FROM INVOICES
WHERE patient_id = 1005;