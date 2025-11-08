-- Объединение с сохранением всех строк, включая дубликаты

SELECT 
  * 
FROM 
  (
    SELECT 
      p.name AS object_name 
    FROM 
      person p 
    ORDER BY 
      object_name
  ) subquery_1 
UNION ALL 
SELECT 
  * 
FROM 
  (
    SELECT 
      m.pizza_name AS object_name 
    FROM 
      menu m 
    ORDER BY 
      object_name
  ) subquery_2
