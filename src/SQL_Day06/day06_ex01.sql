INSERT INTO person_discounts (person_id, pizzeria_id, discount, id)
SELECT person_order.person_id AS person_id,
menu.pizzeria_id AS pizzeria_id,
CASE 
	WHEN COUNT(person_id) = 1 THEN 10.5
	WHEN COUNT(person_id) = 2 THEN 22
	ELSE 30
END AS discount,
ROW_NUMBER() OVER () AS id
FROM person_order
INNER JOIN menu ON menu.id = person_order.menu_id
GROUP BY  person_id, menu.pizzeria_id;
