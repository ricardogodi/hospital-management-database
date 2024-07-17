-- This trigger fires after each insert operation on the HEALTH_RECORDS table and updates the PATIENTS table by setting the status column to the value of the
-- status column in the most recent HEALTH_RECORDS record for that patient.

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