SELECT 
  menu.pizza_name, 
  pizzeria.name AS pizzeria_name 
FROM 
  menu 
  INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id 
  INNER JOIN person_order ON person_order.menu_id = menu.id 
  INNER JOIN person ON person_order.person_id = person.id 
WHERE 
  person.name IN ('Denis', 'Anna') 
ORDER BY 1, 2