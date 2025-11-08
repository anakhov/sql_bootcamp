SELECT person.name,
menu.pizza_name,
menu.price,
trim_scale(menu.price * (100 - person_discounts.discount)/100) AS discount_price,
pizzeria.name AS pizzeria_name
FROM person_order
INNER JOIN menu ON menu.id = person_order.menu_id
INNER JOIN person ON person.id = person_order.person_id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_discounts ON person.id = person_discounts.person_id
AND person_discounts.pizzeria_id = pizzeria.id
ORDER BY 1, 2
