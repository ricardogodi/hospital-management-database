-- Aggregation Queries
-- -------------------------------------------------------------------------------------
SELECT AVG(fee) AS avg_fee FROM INSTRUCTIONS;

SELECT nurse_id, COUNT(patient_id) AS num_patients FROM PATIENTS
GROUP BY nurse_id;

SELECT ph.name, SUM(inv.instruction_fee + inv.room_fee) AS total_revenue FROM PHYSICIANS ph
JOIN MONITORED m ON ph.physician_id = m.physician_id
JOIN PATIENTS p ON m.patient_id = p.patient_id
JOIN INVOICES inv ON p.patient_id = inv.patient_id
GROUP BY ph.name;


-- Join Queries
-- -------------------------------------------------------------------------------------
SELECT p.patient_id, p.name AS patient_name, p.phone_num AS patient_phone_num,
       n.name AS nurse_name, r.room_number, r.capacity
FROM PATIENTS p
JOIN NURSES n ON p.nurse_id = n.nurse_id
JOIN ROOMS r ON p.room_number = r.room_number;

SELECT p.patient_id, p.name, SUM(pm.amount) AS total_payments
FROM PATIENTS p
JOIN PAYMENTS pm ON p.patient_id = pm.patient_id
GROUP BY p.patient_id;

SELECT i.invoice_id, i.instruction_fee, i.room_fee, i.patient_id,
       p.name AS patient_name, py.amount AS payment_amount, py.date AS payment_date
FROM INVOICES i
JOIN PATIENTS p ON i.patient_id = p.patient_id
JOIN PAYMENTS py ON i.patient_id = py.patient_id;

-- Nested Queries
-- -------------------------------------------------------------------------------------
SELECT name FROM PHYSICIANS
WHERE physician_id NOT IN (
  SELECT physician_id
  FROM MONITORED
);

SELECT name FROM PATIENTS
WHERE nurse_id IN (
  SELECT nurse_id
  FROM NURSES
  WHERE certification_num = 'OP12345'
);

SELECT name, patient_count FROM NURSES 
JOIN 
  (SELECT nurse_id, COUNT(*) AS patient_count 
   FROM PATIENTS 
   GROUP BY nurse_id) AS patient_counts 
ON NURSES.nurse_id = patient_counts.nurse_id 
ORDER BY patient_count DESC;


-- TRANSACTION Queries
-- -------------------------------------------------------------------------------------
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


START TRANSACTION;
UPDATE PATIENTS
SET room_number = 105
WHERE patient_id = 1001;
UPDATE ROOMS
SET capacity = capacity - 1
WHERE room_number = 105;
COMMIT;

-- Trigger Queries
-- -------------------------------------------------------------------------------------

DELIMITER //
CREATE TRIGGER update_room_capacity
AFTER INSERT ON PATIENTS
FOR EACH ROW
BEGIN
    UPDATE ROOMS
    SET capacity = capacity - 1
    WHERE room_number = NEW.room_number;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_room_capacity
AFTER DELETE ON PATIENTS
FOR EACH ROW
BEGIN
    UPDATE ROOMS
    SET capacity = capacity + 1
    WHERE room_number = OLD.room_number;
END; //
DELIMITER ;


DELIMITER //
CREATE TRIGGER update_patient_status
AFTER INSERT ON HEALTH_RECORDS
FOR EACH ROW
BEGIN
  UPDATE PATIENTS p
  SET p.status = NEW.status
  WHERE p.patient_id = NEW.patient_id
  AND NEW.date = (SELECT MAX(date) FROM HEALTH_RECORDS WHERE patient_id = NEW.patient_id);
END //
DELIMITER ;


-- View Queries
-- -------------------------------------------------------------------------------------
CREATE VIEW patient_fees AS 
SELECT p.patient_id, p.name, SUM(i.instruction_fee + i.room_fee) AS total_fees
FROM PATIENTS p 
JOIN INVOICES i ON p.patient_id = i.patient_id 
GROUP BY p.patient_id, p.name;

CREATE VIEW patient_latest_health_record AS
SELECT h.patient_id, p.name AS patient_name, h.health_id,
       h.disease, h.status, h.date, h.description
FROM PATIENTS p
JOIN HEALTH_RECORDS h ON p.patient_id = h.patient_id
WHERE h.date = (SELECT MAX(date) FROM HEALTH_RECORDS WHERE patient_id = h.patient_id);

CREATE VIEW physician_patient_counts AS
SELECT ph.name AS physician_name, COUNT(m.patient_id) AS patient_count
FROM PHYSICIANS ph
LEFT JOIN MONITORED m ON ph.physician_id = m.physician_id
GROUP BY ph.physician_id;

-- General Queries
-- -------------------------------------------------------------------------------------

SELECT SUM(instruction_fee + room_fee) AS total_fee
FROM INVOICES
WHERE patient_id = 1005;

SELECT DISTINCT p.name, p.phone_num FROM PHYSICIANS p
JOIN MONITORED m ON p.physician_id = m.physician_id
JOIN PATIENTS pat ON m.patient_id = pat.patient_id;

SELECT AVG(num_nights) AS avg_nights
FROM PATIENTS;

SELECT DISTINCT p.name FROM PATIENTS p 
WHERE p.num_nights > 4;

SELECT i.instruction_code, i.description, COUNT(*) AS num_times_ordered FROM INSTRUCTIONS i
JOIN ORDERS o ON i.instruction_code = o.instruction_code
GROUP BY i.instruction_code, i.description
ORDER BY COUNT(*) DESC
LIMIT 3




