SELECT 
  menu.pizza_name, 
  pizzeria.name AS pizzeria_name, 
  menu.price 
FROM 
  menu 
  INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id 
WHERE 
  pizza_name IN (
    'mushroom pizza', 'pepperoni pizza'
  ) 
ORDER BY 1, 2