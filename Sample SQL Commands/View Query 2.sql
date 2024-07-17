-- This view that shows all patients with their corresponding health records,
--  including only the most recent record for each patient

CREATE VIEW patient_latest_health_record AS
SELECT h.patient_id, p.name AS patient_name, h.health_id,
       h.disease, h.status, h.date, h.description
FROM PATIENTS p
JOIN HEALTH_RECORDS h ON p.patient_id = h.patient_id
WHERE h.date = (SELECT MAX(date) FROM HEALTH_RECORDS WHERE patient_id = h.patient_id);

