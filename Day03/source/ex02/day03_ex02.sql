WITH cte_table AS (SELECT id AS menu_id
                   FROM menu
                   EXCEPT
                   SELECT menu_id
                   FROM person_order)
SELECT menu.pizza_name, menu.price, pizzeria.name
FROM menu,
     cte_table,
     pizzeria
WHERE menu.id = cte_table.menu_id
  AND pizzeria.id = menu.pizzeria_id
ORDER BY pizza_name, price;

