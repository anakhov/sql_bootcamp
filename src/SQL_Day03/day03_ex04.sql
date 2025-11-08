(
  SELECT 
    pizzeria.name AS pizzeria_name 
  FROM 
    pizzeria 
    INNER JOIN menu m ON pizzeria.id = m.pizzeria_id 
    INNER JOIN person_order po ON m.id = po.menu_id 
    INNER JOIN person ON po.person_id = person.id 
  WHERE 
    person.gender = 'female' 
  EXCEPT 
  SELECT 
    pizzeria.name AS pizzeria_name 
  FROM 
    pizzeria 
    INNER JOIN menu m ON pizzeria.id = m.pizzeria_id 
    INNER JOIN person_order po ON m.id = po.menu_id 
    INNER JOIN person ON po.person_id = person.id 
  WHERE 
    person.gender = 'male'
) 
UNION 
  (
    SELECT 
      pizzeria.name AS pizzeria_name 
    FROM 
      pizzeria 
      INNER JOIN menu m ON pizzeria.id = m.pizzeria_id 
      INNER JOIN person_order po ON m.id = po.menu_id 
      INNER JOIN person ON po.person_id = person.id 
    WHERE 
      person.gender = 'male' 
    EXCEPT 
    SELECT 
      pizzeria.name AS pizzeria_name 
    FROM 
      pizzeria 
      INNER JOIN menu m ON pizzeria.id = m.pizzeria_id 
      INNER JOIN person_order po ON m.id = po.menu_id 
      INNER JOIN person ON po.person_id = person.id 
    WHERE 
      person.gender = 'female'
  ) 
ORDER BY 
  1