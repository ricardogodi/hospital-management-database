-- This query finds the names and phone numbers of all physicians who have patients that are currently staying in the hospital.

SELECT DISTINCT p.name, p.phone_num FROM PHYSICIANS p
JOIN MONITORED m ON p.physician_id = m.physician_id
JOIN PATIENTS pat ON m.patient_id = pat.patient_id;