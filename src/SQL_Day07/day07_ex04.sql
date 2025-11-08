SELECT name,
COUNT(*) as count_of_visits
FROM person
INNER JOIN person_visits ON person.id = person_visits.person_id
GROUP BY name 
HAVING COUNT(*) > 3;
