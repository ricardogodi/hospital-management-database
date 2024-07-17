-- This query selects the names of all physicians who are not currently monitoring any patients.

SELECT name FROM PHYSICIANS
WHERE physician_id NOT IN (
  SELECT physician_id
  FROM MONITORED
)