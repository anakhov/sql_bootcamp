SELECT name,
SUM(count) AS total_count
FROM
((SELECT p.name as name,
COUNT(*) as count,
'visit' as action_type
FROM pizzeria p 
INNER JOIN person_visits pv ON pv.pizzeria_id = p.id
GROUP BY p.name
ORDER BY 2 DESC)
UNION
(SELECT p.name as name,
COUNT(*) as count,
'order' as action_type
FROM pizzeria p 
INNER JOIN menu m ON m.pizzeria_id = p.id
INNER JOIN person_order po ON m.id = po.menu_id
GROUP BY p.name
ORDER BY 2 DESC))
GROUP BY name
ORDER BY 2 DESC,1 ASC;

