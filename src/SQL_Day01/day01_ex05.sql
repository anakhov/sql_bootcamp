-- Создание всех возможных комбинаций строк

SELECT 
  * 
FROM 
  person pe 
  CROSS JOIN pizzeria pz 
ORDER BY 
  pe.id, 
  pz.id
