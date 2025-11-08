(SELECT p.name AS name,
count(*) AS count,
'visit' AS action_type
FROM pizzeria p 
INNER JOIN person_visits pv ON pv.pizzeria_id = p.id
GROUP BY p.name
ORDER BY 2 DESC
LIMIT 3)
UNION
(SELECT p.name AS name,
count(*) AS count,
'order' AS action_type
FROM pizzeria p 
INNER JOIN menu m ON m.pizzeria_id = p.id
INNER JOIN person_order po ON m.id = po.menu_id
GROUP BY p.name
ORDER BY 2 DESC
LIMIT 3)
ORDER BY 3 ASC, 2 DESC;

