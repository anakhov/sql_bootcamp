SELECT person.address,
pizzeria.name,
count(*) as count_of_orders
FROM person_order
INNER JOIN person ON person.id = person_order.person_id
INNER JOIN menu ON menu.id = person_order.menu_id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY 1, 2
ORDER BY 1, 2