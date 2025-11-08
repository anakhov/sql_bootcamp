SELECT 
  person.name AS name 
FROM 
  person 
  INNER JOIN person_order ON person_order.person_id = person.id 
  INNER JOIN menu ON menu.id = person_order.menu_id 
WHERE 
  person.gender = 'female' 
  AND menu.pizza_name = 'pepperoni pizza' 
INTERSECT 
SELECT 
  person.name AS name 
FROM 
  person 
  INNER JOIN person_order ON person_order.person_id = person.id 
  INNER JOIN menu ON menu.id = person_order.menu_id 
WHERE 
  person.gender = 'female' 
  AND menu.pizza_name = 'cheese pizza' 
ORDER BY 
  1