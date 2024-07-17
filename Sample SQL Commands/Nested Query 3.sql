-- This query uses a nested subquery to count the number of patients treated by each nurse, and 
-- then joins the results with the NURSES table to retrieve the names of the corresponding nurses 

SELECT name, patient_count FROM NURSES 
JOIN 
  (SELECT nurse_id, COUNT(*) AS patient_count 
   FROM PATIENTS 
   GROUP BY nurse_id) AS patient_counts 
ON NURSES.nurse_id = patient_counts.nurse_id 
ORDER BY patient_count DESC;
