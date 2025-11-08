CREATE VIEW v_price_with_discount AS
SELECT person.name AS name,
pizza_name, 
price, 
(price - price*0.1)::INTEGER AS discount_price
FROM menu
INNER JOIN person_order po ON po.menu_id = menu.id
INNER JOIN person ON po.person_id = person.id
ORDER BY name, pizza_name

-- SELECT * FROM v_price_with_discount