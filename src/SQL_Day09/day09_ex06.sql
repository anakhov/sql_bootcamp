CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson VARCHAR DEFAULT 'Dmitriy',
    pprice NUMERIC DEFAULT 500,
    pdate DATE DEFAULT '2022-01-08'
)
RETURNS TABLE (
    name VARCHAR
)
AS $$
BEGIN
RETURN QUERY

SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN menu
ON menu.pizzeria_id = pizzeria.id
INNER JOIN person_visits
ON person_visits.pizzeria_id = pizzeria.id
INNER JOIN person
ON person_visits.person_id = person.id
WHERE person.name = pperson
AND menu.price < pprice
AND person_visits.visit_date = pdate;

END;
$$ LANGUAGE plpgsql;


SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

