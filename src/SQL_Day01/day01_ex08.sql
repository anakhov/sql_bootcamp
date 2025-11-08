-- Использование NATURAL JOIN для автоматического соединения по одинаковым именам столбцов

SELECT 
  person_order.order_date, 
  CONCAT(sub.name, ' (age:', sub.age, ')') AS person_information 
FROM 
  person_order 
  NATURAL JOIN (
    SELECT 
      person.name, 
      person.id AS person_id, 
      person.age 
    FROM 
      person
  ) AS sub 
ORDER BY 
  order_date, 
  person_information
