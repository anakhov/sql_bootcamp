COMMENT ON TABLE person_discounts IS 'Таблица скидок для клиентов в разных пиццериях';
COMMENT ON COLUMN person_discounts.id IS 'Первичный ключ строки';
COMMENT ON COLUMN person_discounts.person_id IS 'id клиентов';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'id пиццерий';
COMMENT ON COLUMN person_discounts.discount IS 'Процент скидки для клиентов в каждой отдельной пиццерии';

