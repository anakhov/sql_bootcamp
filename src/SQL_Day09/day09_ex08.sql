CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fibonacci INTEGER) AS $$
WITH RECURSIVE fib(prev_n, next_n) AS (
    SELECT 
	0 AS prev_n, 
	1 as next_n
    UNION ALL
    SELECT 
	next_n,
	next_n + prev_n FROM fib WHERE next_n < pstop
  )
  SELECT prev_n FROM fib;
$$ LANGUAGE sql;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
