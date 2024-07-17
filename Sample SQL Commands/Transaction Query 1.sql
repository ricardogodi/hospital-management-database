-- This transaction query is used to transfer a patient to another room 



START TRANSACTION;

-- Update the current room capacity
UPDATE rooms
SET capacity = capacity + 1
WHERE room_number = '100';

-- Update the new room capacity
UPDATE rooms
SET capacity = capacity - 1
WHERE room_number = '101';

-- Update the patient's room number
UPDATE patients
SET room_number = '101'
WHERE patient_id = '1001';

COMMIT;
