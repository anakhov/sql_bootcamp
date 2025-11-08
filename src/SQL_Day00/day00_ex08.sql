--Выбор всех заказов с четными номерами

SELECT 
  * 
FROM 
  person_order 
WHERE 
  id % 2 = 0 
ORDER BY 
  id