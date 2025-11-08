INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id)+1 FROM person_visits), 
(SELECT person.id FROM person WHERE name = 'Dmitriy'), 
(SELECT pizzeria.id FROM pizzeria 
INNER JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE name != 'Papa Johns' AND menu.price < 800 
LIMIT 1), 
'2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats

-- SELECT * FROM mv_dmitriy_visits_and_eats 