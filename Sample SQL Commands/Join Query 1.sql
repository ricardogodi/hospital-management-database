-- This query retrieves the details of patients along with their corresponding nurse 
-- and room information from the Patients, Nurses, and Rooms tables using JOIN operations.

SELECT p.patient_id, p.name AS patient_name, p.phone_num AS patient_phone_num,
       n.name AS nurse_name, r.room_number, r.capacity
FROM PATIENTS p
JOIN NURSES n ON p.nurse_id = n.nurse_id
JOIN ROOMS r ON p.room_number = r.room_number;


