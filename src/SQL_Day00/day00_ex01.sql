-- Фильтрация по нескольким условиям и сортровка результатов

SELECT 
  name, 
  age 
FROM 
  person 
WHERE 
  address = 'Kazan' 
  AND gender = 'female' 
ORDER BY 
  name
