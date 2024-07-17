
-- This view that all physicians along with the number of patients they are currently monitoring: 


CREATE VIEW physician_patient_counts AS
SELECT ph.name AS physician_name, COUNT(m.patient_id) AS patient_count
FROM PHYSICIANS ph
LEFT JOIN MONITORED m ON ph.physician_id = m.physician_id
GROUP BY ph.physician_id;
