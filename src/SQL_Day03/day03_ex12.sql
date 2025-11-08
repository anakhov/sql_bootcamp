INSERT INTO person_order (id, menu_id, order_date, person_id)
SELECT 
gen + (SELECT MAX(id) FROM person_order) AS id,
(SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
'2022-02-25' AS order_date,
id AS person_id
FROM person
INNER JOIN generate_series(1, (SELECT COUNT(id) FROM person)) gen 
ON gen = person.id
