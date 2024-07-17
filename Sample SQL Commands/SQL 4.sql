-- This query finds the names of the nurses who are assigned to patients who 
-- have been staying in the hospital for more than 4 nights. 


SELECT DISTINCT p.name FROM PATIENTS p 
WHERE p.num_nights > 4;
