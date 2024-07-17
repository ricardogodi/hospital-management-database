-- This transaction query is moving the patient with ID 1001 to room number 105


START TRANSACTION;

UPDATE PATIENTS
SET room_number = 105
WHERE patient_id = 1001;

UPDATE ROOMS
SET capacity = capacity - 1
WHERE room_number = 105;

COMMIT;