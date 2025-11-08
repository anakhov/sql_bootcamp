SELECT DISTINCT name
FROM person 
INNER JOIN person_order ON person_order.person_id = person.id
ORDER BY 1;