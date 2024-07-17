


SELECT i.instruction_code, i.description, COUNT(*) AS num_times_ordered FROM INSTRUCTIONS i
JOIN ORDERS o ON i.instruction_code = o.instruction_code
GROUP BY i.instruction_code, i.description
ORDER BY COUNT(*) DESC
LIMIT 3;