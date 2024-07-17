-- This query retrieves counts the number of patients assigned to each nurse in the NURSES table  

SELECT nurse_id, COUNT(patient_id) AS num_patients FROM PATIENTS
GROUP BY nurse_id;


 