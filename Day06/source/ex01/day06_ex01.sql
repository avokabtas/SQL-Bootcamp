INSERT INTO person_discounts
SELECT ROW_NUMBER() OVER () AS id,
       person_id,
       pizzeria_id,
       CASE
           WHEN amount_of_orders = 1 THEN 10.5
           WHEN amount_of_orders = 2 THEN 22
           ELSE 30
           END                 discount
FROM (SELECT person_id, pizzeria_id, COUNT(pizzeria_id) AS amount_of_orders
      FROM person_order
               JOIN menu ON person_order.menu_id = menu.id
      GROUP BY person_id, pizzeria_id) AS table_id
ORDER BY person_id;
