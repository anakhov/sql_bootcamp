SELECT person.name AS name,
COUNT(*) AS count_of_visits
FROM person_visits pv
INNER JOIN person ON person.id = pv.person_id
GROUP BY person.name
ORDER BY 2 DESC, 1 ASC
LIMIT 4;
