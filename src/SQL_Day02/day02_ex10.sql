SELECT 
  person.name AS person_name1, 
  p.name AS person_name2, 
  person.address AS common_address 
FROM 
  person 
  INNER JOIN person p ON person.address = p.address 
WHERE 
  person.id > p.id 
ORDER BY 1, 2, 3