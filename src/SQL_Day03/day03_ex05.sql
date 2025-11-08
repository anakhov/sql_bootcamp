SELECT 
  pizzeria.name AS pizzeria_name 
FROM 
  pizzeria 
  INNER JOIN person_visits pv ON pizzeria.id = pv.pizzeria_id 
  INNER JOIN person ON pv.person_id = person.id 
WHERE 
  person.name = 'Andrey' 
EXCEPT 
SELECT 
  pizzeria.name AS pizzeria_name 
FROM 
  pizzeria 
  INNER JOIN menu m ON pizzeria.id = m.pizzeria_id 
  INNER JOIN person_order po ON m.id = po.menu_id 
  INNER JOIN person ON po.person_id = person.id 
WHERE 
  person.name = 'Andrey' 
ORDER BY 
  1
