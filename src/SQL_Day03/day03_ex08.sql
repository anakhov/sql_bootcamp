INSERT INTO menu (id, pizza_name, pizzeria_id, price)
VALUES (
(SELECT MAX(id) FROM menu) + 1, 
'sicilian pizza', 
(SELECT id FROM pizzeria WHERE name = 'Dominos'), 
900
)

-- SELECT * FROM menu
