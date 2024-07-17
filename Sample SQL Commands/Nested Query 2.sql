-- This query selects the names of all patients who are assigned to nurses 
-- with a certain certification number OP12345

SELECT name FROM PATIENTS
WHERE nurse_id IN (
  SELECT nurse_id
  FROM NURSES
  WHERE certification_num = 'OP12345'
)