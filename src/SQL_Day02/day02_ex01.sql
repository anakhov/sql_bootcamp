SELECT 
  missing_date :: DATE 
FROM 
  generate_series(
    '2022-01-01', '2022-01-10', INTERVAL '1 day'
  ) AS missing_date 
  LEFT JOIN (
    SELECT 
      * 
    FROM 
      person_visits 
    WHERE 
      person_visits.person_id = 1 
      OR person_visits.person_id = 2
  ) pv ON missing_date = pv.visit_date 
WHERE 
  pv.visit_date IS NULL 
ORDER BY 
  pv.visit_date
