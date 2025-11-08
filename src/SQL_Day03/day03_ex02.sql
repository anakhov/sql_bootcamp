SELECT 
  menu.pizza_name AS pizza_name, 
  menu.price AS price, 
  pizzeria.name AS pizzeria_name 
FROM 
  (
    SELECT 
      menu.id AS menu_id 
    FROM 
      menu 
    EXCEPT 
    SELECT 
      person_order.menu_id 
    FROM 
      person_order
  ) AS sub 
  INNER JOIN menu ON sub.menu_id = menu.id 
  INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id 
ORDER BY 1, 2