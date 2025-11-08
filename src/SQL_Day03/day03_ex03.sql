SELECT 
  sub.pizzeria_name 
FROM 
  (
    SELECT 
      pizzeria.name AS pizzeria_name, 
      count(pv.person_id) cv 
    FROM 
      pizzeria 
      INNER JOIN person_visits pv ON pizzeria.id = pv.pizzeria_id 
      INNER JOIN person ON pv.person_id = person.id 
    GROUP BY 
      1, 
      person.gender 
    HAVING 
      person.gender = 'female' 
    EXCEPT 
      ALL 
    SELECT 
      pizzeria.name AS pizzeria_name, 
      count(pv.person_id) cv 
    FROM 
      pizzeria 
      INNER JOIN person_visits pv ON pizzeria.id = pv.pizzeria_id 
      INNER JOIN person ON pv.person_id = person.id 
    GROUP BY 
      1, 
      person.gender 
    HAVING 
      person.gender = 'male'
  ) sub 
ORDER BY 
  1