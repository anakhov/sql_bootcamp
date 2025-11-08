-- Нахождение общих дат и person_id с помоцью INTERSECT ALL

SELECT 
  sub.action_date, 
  person.name AS person_name 
FROM 
  (
    SELECT 
      po.order_date AS action_date, 
      po.person_id AS person_id 
    FROM 
      person_order po

    INTERSECT ALL 

    SELECT 
      pv.visit_date, 
      pv.person_id 
    FROM 
      person_visits pv
  ) AS sub 
  INNER JOIN person ON person.id = sub.person_id  -- Получение имени по ID
ORDER BY 
  action_date, 
  person_name DESC
