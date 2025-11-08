-- DROP INDEX idx_1  
CREATE INDEX idx_1 ON pizzeria(rating); 
SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;

-- before
-- "Sort  (cost=25.95..26.00 rows=19 width=96) (actual time=0.100..0.101 rows=19 loops=1)"
-- "  Sort Key: m.pizza_name, (max(pz.rating) OVER (?))"
-- "  Sort Method: quicksort  Memory: 25kB"
-- "  ->  WindowAgg  (cost=25.21..25.55 rows=19 width=96) (actual time=0.056..0.065 rows=19 loops=1)"
-- "        ->  Sort  (cost=25.17..25.22 rows=19 width=64) (actual time=0.043..0.044 rows=19 loops=1)"
-- "              Sort Key: pz.rating"
-- "              Sort Method: quicksort  Memory: 25kB"
-- "              ->  Merge Join  (cost=0.27..24.77 rows=19 width=64) (actual time=0.025..0.032 rows=19 loops=1)"
-- "                    Merge Cond: (m.pizzeria_id = pz.id)"
-- "                    ->  Index Only Scan using idx_menu_unique on menu m  (cost=0.14..12.42 rows=19 width=40) (actual time=0.011..0.014 rows=19 loops=1)"
-- "                          Heap Fetches: 19"
-- "                    ->  Index Scan using pizzeria_pkey on pizzeria pz  (cost=0.13..12.22 rows=6 width=40) (actual time=0.007..0.008 rows=6 loops=1)"
-- "Planning Time: 0.792 ms"
-- "Execution Time: 0.139 ms"

-- after
-- "Sort  (cost=25.95..26.00 rows=19 width=96) (actual time=0.072..0.073 rows=19 loops=1)"
-- "  Sort Key: m.pizza_name, (max(pz.rating) OVER (?))"
-- "  Sort Method: quicksort  Memory: 25kB"
-- "  ->  WindowAgg  (cost=2.93..25.54 rows=19 width=96) (actual time=0.026..0.044 rows=19 loops=1)"
-- "        ->  Nested Loop  (cost=0.27..25.21 rows=19 width=64) (actual time=0.011..0.024 rows=19 loops=1)"
-- "              ->  Index Scan using idx_1 on pizzeria pz  (cost=0.13..12.22 rows=6 width=40) (actual time=0.004..0.005 rows=6 loops=1)"
-- "              ->  Index Only Scan using idx_menu_unique on menu m  (cost=0.14..2.15 rows=1 width=40) (actual time=0.002..0.002 rows=3 loops=6)"
-- "                    Index Cond: (pizzeria_id = pz.id)"
-- "                    Heap Fetches: 19"
-- "Planning Time: 0.936 ms"
-- "Execution Time: 0.099 ms"